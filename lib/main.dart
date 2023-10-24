import 'package:borne_sanitaire_admin/widgets/authentication/Login/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _MainApp();
  }
}

class _MainApp extends StatelessWidget {
  _MainApp();
  final bool _isDeviceSupported = Platform.isAndroid || Platform.isWindows;

  Widget unSupportedDevice() {
    return const Center(
      child: Column(
        children: <Widget>[
          Text('Unsupported Device Please try either our desktop'),
          Text('application or our mobile application')
        ],
      ),
    );
  }

  Widget supportedDevice(Widget mainWidget) {
    return mainWidget;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _isDeviceSupported == false
          ? unSupportedDevice()
          : supportedDevice(const Login()),
      debugShowCheckedModeBanner: false,
    );
  }
}
