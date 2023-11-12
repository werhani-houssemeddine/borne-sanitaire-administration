import 'package:borne_sanitaire_admin/widgets/Home/Widgets/app_bar.dart';
import 'package:borne_sanitaire_admin/widgets/Home/Widgets/nav_bar.dart';
import 'package:flutter/material.dart';

import 'package:borne_sanitaire_admin/widgets/Home/utils.dart';

late NAVIGATION_WIDGET currentScreen; //! This global variable will be deleted

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  void initState() {
    currentScreen = NAVIGATION_WIDGET.DASHBOARD;
    super.initState();
  }

  Widget manipulateBody() {
    if (currentScreen == NAVIGATION_WIDGET.CLIENTS) {
      return clients;
    } else if (currentScreen == NAVIGATION_WIDGET.DEVICES) {
      return device;
    } else if (currentScreen == NAVIGATION_WIDGET.SETTINGS) {
      return settings;
    } else if (currentScreen == NAVIGATION_WIDGET.PROFILE) {
      return profile;
    } else {
      return dashboard;
    }
  }

  @override
  Widget build(BuildContext context) {
    NavigateBetweenScreens screenNavigator = NavigateBetweenScreens(
      setState: setState,
    );
    print("CLICKED YAL BRO $currentScreen");

    return Scaffold(
      body: Row(
        children: [
          NavBar(screenNavigator: screenNavigator),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Scaffold(
                appBar: HomePageNavBar(),
                body: manipulateBody(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget dashboard = const Text("DASHBOARD");
Widget device = const Text("DEVICE");
Widget clients = const Text("CLIENTS");
Widget settings = const Text("SETTINGS");
Widget profile = const Text("PROFILE");

class NavigateBetweenScreens {
  final Function setState;

  NavigateBetweenScreens({required this.setState});

  void _swapeBetweenScreen(NAVIGATION_WIDGET screenToNavigate) {
    if (currentScreen != screenToNavigate) {
      setState(() {
        currentScreen = screenToNavigate;
      });
    }
  }

  get getCurrentScreen => currentScreen;

  void goToDashboard() => _swapeBetweenScreen(NAVIGATION_WIDGET.DASHBOARD);
  void goToClients() => _swapeBetweenScreen(NAVIGATION_WIDGET.CLIENTS);
  void goToDevices() => _swapeBetweenScreen(NAVIGATION_WIDGET.DEVICES);
  void goToProfile() => _swapeBetweenScreen(NAVIGATION_WIDGET.PROFILE);
  void goToSettings() => _swapeBetweenScreen(NAVIGATION_WIDGET.SETTINGS);
}
