import 'package:borne_sanitaire_admin/widgets/authentication/Login/widgets/main.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
        appBar: null,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: height,
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (width < 475) const Text("Unsupported Screen Size !"),
              if (width > 475) _loginContainer(height, width),
              if (width > 900) _imageWidget(),
            ],
          ),
        ));
  }
}

Widget _imageWidget() {
  return const Expanded(
      child: Image(image: AssetImage('assets/Security-On-bro.png')));
}

Widget _loginContainer(double height, double width) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_topNavBar(), Expanded(child: LoginWidgets.Login())],
    ),
  );
}

Widget _topNavBar() {
  return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _logo(),
          Text(
            "Borne Sanitaire Administration",
            style: _textStyle(),
          ),
        ],
      ));
}

Widget _logo() {
  return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white),
      child: null);
}

TextStyle _textStyle() {
  return const TextStyle(
      fontSize: 14, // Adjust the font size as needed
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontStyle: FontStyle.italic // Change the color to your preference
      );
}
