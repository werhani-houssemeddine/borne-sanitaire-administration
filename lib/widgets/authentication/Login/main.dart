import 'package:borne_sanitaire_admin/widgets/authentication/Login/widgets/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
          ),
          Flexible(
            flex: 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      "Borne Sanitaire Administration",
                      style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(child: _LoginForm())
                ]),
          ),
          Expanded(
              child: Image(image: AssetImage('assets/Security-On-bro.png')))
        ],
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
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
