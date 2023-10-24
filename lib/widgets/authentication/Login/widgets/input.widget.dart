// ignore_for_file: unused_field, constant_identifier_names

import 'package:flutter/material.dart';

enum Validators { EMAIL_VALIDATOR, PASSWORD_VALIDATOR }

Widget makeInputWidget(InputDecoration decoration,
    TextEditingController controller, Validators validator,
    {bool secureText = false}) {
  return SizedBox(
    width: 400,
    child: TextFormField(
        decoration: decoration,
        controller: controller,
        obscureText: secureText,
        validator: customValidators(validator)),
  );
}

String? Function(String?)? customValidators(Validators validator) {
  if (validator == Validators.EMAIL_VALIDATOR) {
    return (String? value) {
      if (value == null || value == '') {
        return 'Email is required !';
      } else if (value.contains('@') == false) {
        return 'Pease enter a vaild email';
      }

      return null;
    };
  } else {
    return (String? value) {
      if (value == null || value == '') {
        return 'Password is required !';
      } else if (value.length < 8) {
        return 'Password is too short !';
      }

      return null;
    };
  }
}
