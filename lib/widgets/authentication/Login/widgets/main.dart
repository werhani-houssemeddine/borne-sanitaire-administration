import 'package:borne_sanitaire_admin/widgets/authentication/Login/widgets/button.widget.dart';
import 'package:borne_sanitaire_admin/widgets/authentication/Login/widgets/input.widget.dart';
import 'package:flutter/material.dart';

class LoginWidgets {
  static Widget EmailInput(TextEditingController controller) {
    InputDecoration decoration = InputDecoration(
      labelText: 'Email',
      hintText: 'email@example.com',
      contentPadding: const EdgeInsets.all(8.0),
      prefixIcon: const Icon(Icons.email_outlined),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
    );

    return makeInputWidget(decoration, controller, Validators.EMAIL_VALIDATOR);
  }

  static Widget PasswordInput(
      TextEditingController controller, bool Function() togglePass) {
    InputDecoration decoration = InputDecoration(
        labelText: 'Password',
        hintText: '************',
        contentPadding: const EdgeInsets.all(8.0),
        prefixIcon: const Icon(Icons.lock_outlined),
        suffixIcon: InkWell(
          onTap: () {
            togglePass();
          },
          child: Icon(!togglePass() ? Icons.visibility : Icons.visibility_off),
        ),
        border: OutlineInputBorder(
          //borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(7.0),
        ));

    return makeInputWidget(
        decoration, controller, Validators.PASSWORD_VALIDATOR,
        secureText: !togglePass());
  }

  static Widget SubmitButton(
      GlobalKey<FormState> formKey,
      TextEditingController emailController,
      TextEditingController passwordController) {
    return makeSubmitButtonWidget(formKey, emailController, passwordController);
  }

  /*static Widget ErrorText() {}
*/
}
