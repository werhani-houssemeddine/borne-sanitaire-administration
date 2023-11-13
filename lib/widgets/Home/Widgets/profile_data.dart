import 'package:flutter/material.dart';

class ChangeProfileData extends StatelessWidget {
  const ChangeProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
