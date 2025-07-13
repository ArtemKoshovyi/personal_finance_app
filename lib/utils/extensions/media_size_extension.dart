import 'package:flutter/widgets.dart';

/// Extension for [BuildContext] to access media query size.
extension MediaQuerryX on BuildContext {
  /// Returns the size of the media query.
  Size get mediaSize => MediaQuery.of(this).size;
}
