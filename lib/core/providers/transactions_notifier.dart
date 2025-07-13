import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:personal_finance_app/core/models/transaction_model.dart';
import 'package:personal_finance_app/core/services/sample_transactions_service.dart';
import 'package:personal_finance_app/utils/const/server_consts.dart';
import 'package:personal_finance_app/utils/logs/logger.dart';
import 'package:personal_finance_app/utils/types/transaction_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transactions_notifier.g.dart';

@Riverpod(keepAlive: true)
class TransactionsNotifier extends _$TransactionsNotifier {
  @override
  List<Transaction> build() {
    return state = getSampleTransactions();
  }

  void addTransaction(Transaction transaction) {
    state = [...state, transaction];
    Logger.log('Added transaction: $transaction');
  }


  Future<void> fetchTransactions() async {
    try {
      final response = await http.get(Uri.parse(remoteTransactionsFileUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        final transactions = data
            .map((item) => Transaction.fromJson(item as Map<String, dynamic>))
            .toList();
        state = transactions;
        Logger.log('Fetched ${transactions.length} transactions from server.');
      } else {
        Logger.log('Failed to fetch transactions: ${response.statusCode}');
      }
    } catch (e) {
      Logger.log('Error fetching transactions: $e');
    }
  }

  double getTotalAmount() {
    final total = state.fold<double>(0, (sum, tx) => sum + tx.amount);
    return total;  
    }


  int getUniqueTransactionId() {
    final usedIds = state.map((tx) => tx.id).toSet();
    int id = 1;
    while (usedIds.contains(id)) {
      id++;
    }
    return id;
  }
}
