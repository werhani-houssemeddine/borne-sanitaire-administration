import 'package:borne_sanitaire_admin/widgets/authentication/Login/widgets/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(const LoginScreen());

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
          ),
          Flexible(
            flex: 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Flexible(
                    flex: 1,
                    child: Text(
                      "Borne Sanitaire Administration",
                      style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(child: LoginWidgets.Login())
                ]),
          ),
          const Expanded(
              child: Image(image: AssetImage('assets/Security-On-bro.png')))
        ],
      ),
    );
  }
}
