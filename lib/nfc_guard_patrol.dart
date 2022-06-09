library nfc_guard_patrol;
import 'dart:async';

import 'package:flutter/services.dart';



enum NFCStatus {
  enabled,
  notEnabled,
  notSupported
}

class NfcGuardPatrol {
  /// Current channel
  static const MethodChannel _channel = MethodChannel('nfc_guard_patrol');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// Check current availability of NFC
  static Future<NFCStatus> isNFCEnable() async {
    final response = await _channel.invokeMethod("isNFCEnable") as String;
    return _mapEnableStats(response);
  }

  /// Get current mifare id
  static Future<String> getId() async {
    final response = await _channel.invokeMethod("getId") as String;
    return response;
  }

  static NFCStatus _mapEnableStats(String status) {
    switch (status) {
      case "Enabled":
        return NFCStatus.enabled;
      case "NotEnabled":
        return NFCStatus.notEnabled;
      case "NotSupported":
        return NFCStatus.notSupported;
      default:
        return NFCStatus.notSupported;
    }
  }
}
