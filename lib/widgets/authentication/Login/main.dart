import 'package:flutter/material.dart';
import 'login.service.dart';

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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
          SizedBox(
            width: 400,
            child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'email@example.com',
                  contentPadding: const EdgeInsets.all(8.0),
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                controller: emailController,
                validator: (String? value) {
                  if (value == null || value == '') {
                    return 'Email is required !';
                  } else if (value.contains('@') == false) {
                    return 'Pease enter a vaild email';
                  }

                  return null;
                }),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
          ),
          SizedBox(
              width: 400,
              child: TextFormField(
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
                        child: Icon(!passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
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
                  })),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String email = emailController.toString();
                      String password = passwordController.toString();
                      String submitingFormResponse =
                          await submitForm(email, password);
                    } else {}
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.green.shade400),
                  child: const Text('Submit'),
                ),
              ))
        ],
      ),
    );
  }
}
