import 'package:borne_sanitaire_admin/widgets/Home/Layout/desktop_layout.dart';
import 'package:borne_sanitaire_admin/widgets/Home/utils.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final NavigateBetweenScreens screenNavigator;

  const NavBar({super.key, required this.screenNavigator});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Container(
      constraints: _navBarConstraint(size),
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: _navBarBoxDecoration(),
        child: Column(
          children: [
            const UserProfile(),
            NavBarLinks(screenNavigator: screenNavigator),
            const Logout(),
          ],
        ),
      ),
    );
  }
}

BoxConstraints _navBarConstraint(Size size) {
  return BoxConstraints(
    minWidth: 80,
    maxWidth: 200,
    minHeight: size.height,
    maxHeight: size.height,
  );
}

List<BoxShadow> _navBarBoxShadow() {
  return [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(3, 3),
    ),
  ];
}

BoxDecoration _navBarBoxDecoration() {
  return BoxDecoration(
    color: const Color.fromRGBO(39, 0, 93, 1),
    borderRadius: BorderRadius.circular(7),
    boxShadow: _navBarBoxShadow(),
  );
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
    );
  }
}

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return NavBarLink(
      buttonTitle: 'Log out',
      buttonIcon: Icons.logout,
      navigationLink: () => {},
    );
  }
}

class NavBarLinks extends StatelessWidget {
  final NavigateBetweenScreens screenNavigator;
  const NavBarLinks({super.key, required this.screenNavigator});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        constraints: const BoxConstraints(maxHeight: 400),
        child: Column(
          children: [
            NavBarLink(
              buttonIcon: Icons.home,
              buttonTitle: 'Dashboard',
              navigationLink: screenNavigator.goToDashboard,
              isThisCurrentScreen: screenNavigator.getCurrentScreen ==
                  NAVIGATION_WIDGET.DASHBOARD,
            ),
            NavBarLink(
              buttonIcon: Icons.person,
              buttonTitle: 'Clients',
              navigationLink: screenNavigator.goToClients,
              isThisCurrentScreen:
                  screenNavigator.getCurrentScreen == NAVIGATION_WIDGET.CLIENTS,
            ),
            NavBarLink(
              buttonIcon: Icons.developer_board_sharp,
              buttonTitle: 'Devices',
              navigationLink: screenNavigator.goToDevices,
              isThisCurrentScreen:
                  screenNavigator.getCurrentScreen == NAVIGATION_WIDGET.DEVICES,
            ),
            NavBarLink(
              buttonIcon: Icons.account_circle_outlined,
              buttonTitle: 'Profile',
              navigationLink: screenNavigator.goToProfile,
              isThisCurrentScreen:
                  screenNavigator.getCurrentScreen == NAVIGATION_WIDGET.PROFILE,
            ),
            NavBarLink(
              buttonIcon: Icons.settings,
              buttonTitle: 'Settings',
              navigationLink: screenNavigator.goToSettings,
              isThisCurrentScreen: screenNavigator.getCurrentScreen ==
                  NAVIGATION_WIDGET.SETTINGS,
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _linksBoxDecoration({Color? color}) {
  return BoxDecoration(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(7),
      bottomLeft: Radius.circular(7),
    ),
    color: color ?? const Color.fromRGBO(38, 20, 55, 1),
  );
}

class NavBarLink extends StatelessWidget {
  final String buttonTitle;
  final IconData buttonIcon;
  final Function navigationLink;
  final bool? isThisCurrentScreen;

  const NavBarLink({
    super.key,
    required this.buttonTitle,
    required this.buttonIcon,
    required this.navigationLink,
    this.isThisCurrentScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 5, bottom: 7),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: _linksBoxDecoration(
        color: isThisCurrentScreen == true
            ? const Color.fromRGBO(223, 204, 251, 1)
            : null,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTapDown: (_) {
            navigationLink();
          },
          onTapUp: (_) {},
          onTapCancel: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                buttonIcon,
                color: Colors.white,
              ),
              Text(
                buttonTitle,
                style: TextStyle(
                  color:
                      isThisCurrentScreen == true ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
