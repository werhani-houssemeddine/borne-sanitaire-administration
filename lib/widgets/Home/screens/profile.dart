import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 5, right: 5),
      decoration: _profileScreenBoxDecoration(),
    );
  }
}

List<BoxShadow> _profileScreenBoxShadow() {
  return [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(3, 3),
    ),
  ];
}

BoxDecoration _profileScreenBoxDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(7),
    boxShadow: _profileScreenBoxShadow(),
    // color: Colors.green,
    color: Colors.white,
  );
}
