import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AndroidSettings {
  /// Channel to communicate with native code
  static const MethodChannel _channel =
      MethodChannel('com.yugene.android_settings');

  static Future<bool> requestPermission() async {
    try {
      final bool result = await _channel.invokeMethod('requestPermission');
      return result;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("AndroidSettings - requestPermission: '${e.message}'.");
      }
      return false;
    }
  }

  static Future<bool> setScreenTimeout(int milliseconds) async {
    try {
      final bool result = await _channel.invokeMethod('setScreenTimeout', {
        'timeout': milliseconds,
      });
      return result;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("AndroidSettings - setScreenTimeout: '${e.message}'.");
      }
      return false;
    }
  }
}
