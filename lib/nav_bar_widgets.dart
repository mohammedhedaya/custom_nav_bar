import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';

class UserMainLayoutScreen extends StatefulWidget {
  const UserMainLayoutScreen({super.key});

  @override
  State<UserMainLayoutScreen> createState() => _UserMainLayoutScreenState();
}

class _UserMainLayoutScreenState extends State<UserMainLayoutScreen> {
  int currentIndex = 2;
  late List<Widget> screens;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    screens = [
      //you can your screen here
      // const InstractorScreen(),
      // const ScannerView(),
      // const HomeViewBody(),
      // const BuySell(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      //and here you can add your drawer
      // drawer: const CustomMenuDrawer(),
      body: screens[currentIndex],
      bottomNavigationBar: UserBottomNavBarWidget(
        selectedIndex: currentIndex,
        onItemTapped: (index) {
          if (index == 4) {
            //! Open the drawer when the menu is tapped
            _scaffoldKey.currentState?.openDrawer();
          } else {
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
    );
  }
}
