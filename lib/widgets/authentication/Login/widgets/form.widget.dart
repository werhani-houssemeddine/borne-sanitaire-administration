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
      child: Container(
          height: 500,
          decoration: BoxDecoration(
              boxShadow: kElevationToShadow[4],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0)),
          padding: const EdgeInsets.only(bottom: 30.0, left: 20.0, right: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                LoginWidgets.EmailInput(emailController),
                LoginWidgets.PasswordInput(
                    passwordController, toggleSecureText),
                LoginWidgets.SubmitButton(
                    context, _formKey, emailController, passwordController),
              ])),
    );
  }
}
