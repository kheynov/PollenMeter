import 'package:flutter/foundation.dart';

class Logger {
  Logger._();

  static void log(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
