import 'package:borne_sanitaire_admin/widgets/authentication/Login/login.service.dart';
import 'package:flutter/material.dart';

Widget makeSubmitButtonWidget(
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
    void Function() gotToVerificationCode,
    getStateErrorMessage) {
  return Container(
    width: 400,
    height: 65,
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      //! In future Version we will separate onPressed function
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          String email = emailController.value.text;
          String password = passwordController.value.text;

          String submitingFormResponse = await submitForm(email, password);

          List<String> listOfResponse = [
            "FAILURE",
            "SUCCESS",
            "WRONG CREDENTIALS",
            "UNKNOWN ERROR",
            "INTERNAL SERVER ERROR"
          ];
          print(submitingFormResponse);
          if (submitingFormResponse == listOfResponse[2]) {
            getStateErrorMessage(listOfResponse[2]);
            passwordController.clear();
          } else if (submitingFormResponse == listOfResponse[1]) {
            gotToVerificationCode();
          }
        } else {}
      },
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          backgroundColor: Colors.greenAccent.shade400),
      child: const Text('Submit'),
    ),
  );
}
