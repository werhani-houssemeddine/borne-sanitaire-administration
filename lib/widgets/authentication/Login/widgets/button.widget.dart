import 'package:borne_sanitaire_admin/widgets/authentication/Login/login.service.dart';
import 'package:flutter/material.dart';

Widget makeSubmitButtonWidget(
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController) {
  return SizedBox(
    width: 400,
    child: ElevatedButton(
      //! In future Version we will separate onPressed function
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          String email = emailController.toString();
          String password = passwordController.toString();

          String submitingFormResponse = await submitForm(email, password);

          List<String> listOfResponse = [
            "FAILURE",
            "SUCCESS",
            "UNKNOWN ERROR",
            "INTERNAL SERVER ERROR"
          ];
          if (submitingFormResponse == listOfResponse[0]) {
            passwordController.clear();
          }
        } else {}
      },
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          backgroundColor: Colors.green.shade400),
      child: const Text('Submit'),
    ),
  );
}
