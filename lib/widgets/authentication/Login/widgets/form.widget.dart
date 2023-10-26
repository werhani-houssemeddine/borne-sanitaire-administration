import 'package:flutter/material.dart';

import 'package:borne_sanitaire_admin/widgets/authentication/Login/widgets/main.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passToggle = true;
  bool isResponseReceived = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool toggleSecureText() {
    setState(() {
      passToggle = !passToggle;
    });

    return passToggle;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          LoginWidgets.EmailInput(emailController),
          LoginWidgets.PasswordInput(passwordController, toggleSecureText),
          LoginWidgets.SubmitButton(
              context, _formKey, emailController, passwordController),
        ],
      ),
    );
  }
}
