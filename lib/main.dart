import 'package:borne_sanitaire_admin/widgets/Home/main.dart';
import 'package:borne_sanitaire_admin/widgets/authentication/Login/main.dart';
import 'package:borne_sanitaire_admin/widgets/authentication/verify_code/main.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MainApp();
  }
}

class _MainApp extends StatelessWidget {
  const _MainApp();

  @override
  Widget build(BuildContext context) {
    final bool isDeviceSupported = Platform.isAndroid || Platform.isWindows;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isDeviceSupported
          ? const _SupportedDevice()
          : const _UnsupportedDevice(),
    );
  }
}

class _UnsupportedDevice extends StatelessWidget {
  const _UnsupportedDevice();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      children: [
        Text(
          "Unsupported Device please try either our desktop application or our mobile application",
        ),
      ],
    );
  }
}

class _SupportedDevice extends StatelessWidget {
  const _SupportedDevice();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/': (context) => const LoginScreen(),
        '/verification-code': (context) => const VerifyCode(),
        '/home': (context) => const HomeScreen()
      },
    );
  }
}
