import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        resizeToAvoidBottomInset: false,
        // ignore: sized_box_for_whitespace
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: _LoginForm())],
          ),
        ));
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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var client = http.Client();

  Future<String> submitForm() async {
    String email = emailController.text;
    String password = passwordController.text;

    var response = await client.post(
        Uri.http('localhost:8000', '/administration/login/'),
        body: {'email': email, 'password': password});

    print(response.body);
    if (response.statusCode == 200) {
      print('data sent successfully');
    } else {
      print('error occurred while sending data to server');
    }
    if (response.body ==
        'Authentication done and verification code send successfully') {
      print('dooooone');
    }
    return response.body;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'email@example.com',
                  contentPadding: const EdgeInsets.all(8.0),
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    //borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7.0),
                  )),
              controller: emailController,
              validator: (String? value) {
                if (value == null || value == '') {
                  return 'Email is required !';
                }

                return null;
              }),
          Container(
            margin: const EdgeInsets.all(5.0),
          ),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: '************',
                  contentPadding: const EdgeInsets.all(8.0),
                  prefixIcon: const Icon(Icons.lock_outlined),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        passToggle = !passToggle;
                      });
                    },
                    child: Icon(
                        !passToggle ? Icons.visibility : Icons.visibility_off),
                  ),
                  border: OutlineInputBorder(
                    //borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7.0),
                  )),
              obscureText: passToggle,
              obscuringCharacter: '.',
              controller: passwordController,
              validator: (String? value) {
                if (value == null || value == '') {
                  return 'Password is required !';
                } else if (value.length < 8) {
                  return 'Password is too short !';
                }

                return null;
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                String response = await submitForm();
                // ignore: use_build_context_synchronously
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(response),
                      );
                    });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
