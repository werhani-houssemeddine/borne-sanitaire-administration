import 'package:borne_sanitaire_admin/widgets/authentication/Login/widgets/button.widget.dart';
import 'package:borne_sanitaire_admin/widgets/authentication/Login/widgets/form.widget.dart';
import 'package:borne_sanitaire_admin/widgets/authentication/Login/widgets/input.widget.dart';
import 'package:flutter/material.dart';

class LoginWidgets {
  static Widget Login() {
    //! Need to update make
    //! Make the stack inside a container (for make a good positions)
    return Stack(
      alignment: Alignment.center,
      //padding: EdgeInsets.all(20.0),
      children: [
        const LoginForm(),
        Positioned(
            top: 40,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(112.0),
                boxShadow: kElevationToShadow[4],
              ),
              child: Icon(Icons.security,
                  size: 124.0,
                  color: Colors
                      .greenAccent.shade400 //Color.fromARGB(255, 43, 249, 74),
                  ),
            )),
      ],
    );
  }

  static Widget EmailInput(
      TextEditingController controller, bool error, String errorMessage) {
    InputDecoration decoration = InputDecoration(
        labelText: 'Email',
        hintText: 'email@example.com',
        contentPadding: const EdgeInsets.all(8.0),
        prefixIcon: const Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        errorText: error ? errorMessage : null);

    return makeInputWidget(decoration, controller, Validators.EMAIL_VALIDATOR);
  }

  static Widget PasswordInput(TextEditingController controller,
      bool Function() togglePass, bool error, String errorMessage) {
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
        ),
        errorText: error ? errorMessage : null);

    return makeInputWidget(
        decoration, controller, Validators.PASSWORD_VALIDATOR,
        secureText: !togglePass());
  }

  static Widget SubmitButton(
      BuildContext context,
      GlobalKey<FormState> formKey,
      TextEditingController emailController,
      TextEditingController passwordController,
      getStateErrorMessage) {
    //! this will be a moved to a class to handle all possible action
    void goToVerificationCode() {
      Navigator.pushNamed(context, '/verification-code');
    }

    return makeSubmitButtonWidget(formKey, emailController, passwordController,
        goToVerificationCode, getStateErrorMessage);
  }

  /*static Widget ErrorText() {}
*/
}
