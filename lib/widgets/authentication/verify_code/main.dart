import 'package:borne_sanitaire_admin/widgets/authentication/verify_code/verify_code.service.dart';
import 'package:flutter/material.dart';

void main() => runApp(const VerifyCode());

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(padding: EdgeInsets.all(16.0)),
          Flexible(
            flex: 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      "Verification Code",
                      style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(child: _VerifyCodeForm())
                ]),
          ),
          Expanded(
              child: Image(image: AssetImage('assets/verification-code.png')))
        ],
      ),
    );
  }
}

class _VerifyCodeForm extends StatefulWidget {
  const _VerifyCodeForm();

  @override
  State<_VerifyCodeForm> createState() => _VerifyCodeFormState();
}

class _VerifyCodeFormState extends State<_VerifyCodeForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final verifyCodeController = TextEditingController();
  String customErrorMessage = "";

  @override
  void dispose() {
    verifyCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            width: 400,
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Verification code',
                  hintText: 'xXxXxXxXx',
                  contentPadding: const EdgeInsets.all(8.0),
                  prefixIcon: const Icon(Icons.security),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  errorText:
                      customErrorMessage != "" ? customErrorMessage : null),
              maxLength: 8,
              controller: verifyCodeController,
              validator: (String? value) {
                if (value == null || value.length != 8) {
                  return "Please enter a valid code";
                } else if (value.contains(" ")) {
                  return "space are not valid";
                }

                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            width: 400,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  String code = verifyCodeController.value.text;
                  String sendCodeResponse = await sendVerificationCode(code);
                  if (sendCodeResponse == "SUCCESS") {
                    Navigator.pushNamed(context, "/home");
                  } else if (sendCodeResponse == "BLOCKED") {
                    Navigator.pop(context);
                  } else if (sendCodeResponse == "NOT BLOCKED") {
                    setState(() {
                      customErrorMessage = "Wrong Code providen";
                    });
                    verifyCodeController.clear();
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.green.shade400),
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
