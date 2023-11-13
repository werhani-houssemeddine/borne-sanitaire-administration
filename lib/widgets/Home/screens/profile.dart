import 'package:borne_sanitaire_admin/widgets/Home/Widgets/profile_data.dart';
import 'package:borne_sanitaire_admin/widgets/Home/Widgets/profile_section.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);

    return Container(
      margin: const EdgeInsets.only(bottom: 5, right: 5),
      width: double.infinity,
      height: double.infinity,
      decoration: _profileScreenBoxDecoration(),
      child: size.width >= 1200 ? const LargeSreen() : const SmallSreen(),
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

class SmallSreen extends StatelessWidget {
  const SmallSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileSection();
  }
}

class LargeSreen extends StatelessWidget {
  const LargeSreen({super.key});

  Widget _divider() {
    return Container(
      width: 3,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 1,
        ),
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ProfileSection(),
        _divider(),
        const ChangeProfileData(),
      ],
    );
  }
}


/*
  class MakeProfileScreen extends StatelessWidget{
    final Widget parentWidget; 
    const MakeProfileScreen({super.key, required this.parentWidget });

    @override
    Widget build(BuildContext context) {
      return parentWidget(
        children: [

        ],
      )
    }
  }

*/