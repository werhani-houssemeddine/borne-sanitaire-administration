import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
PreferredSize HomePageNavBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60.0),
    child: Container(
      height: 60,
      child: Row(
        children: [
          const Spacer(flex: 1),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIcon(buttonIcon: Icons.notifications),
                SizedBox(width: 10),
                CustomIcon(buttonIcon: Icons.message),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class CustomIcon extends StatelessWidget {
  final IconData buttonIcon;
  const CustomIcon({super.key, required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          child: Icon(
            buttonIcon,
            size: 24,
          ),
        ),
      ),
    );
  }
}
