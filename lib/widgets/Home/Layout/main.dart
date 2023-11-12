import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'mobile_layout.dart';
import 'desktop_layout.dart';

class HomeLayout {
  // static _mobileLayout = () =>
  // static _desktopLayout = () =>

  static Widget init() {
    if (Platform.isAndroid) {
      return const Text("ANDROID LAYOUT");
    } else {
      return const DesktopLayout();
    }
  }
}
