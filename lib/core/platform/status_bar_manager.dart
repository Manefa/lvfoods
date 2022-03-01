import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarManager {
  static void setColor({required Brightness iconBrightness, required Color color}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: iconBrightness,
        statusBarColor: color,
      ),
    );
  }
}
