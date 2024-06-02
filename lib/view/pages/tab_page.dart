import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:minimal_chat_app/provider/auth_provider.dart';
import 'package:minimal_chat_app/view/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'profile_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

//bottom navbar Logics

class _TabPageState extends State<TabPage> {
  int tabpageIndex = 0;

  List tabPage = [HomePage(), ProfilePage()];
  void changeTabPage(int index) {
    tabpageIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: tabPage[tabpageIndex],
          bottomNavigationBar: SnakeNavigationBar.color(
            onTap: (value) {
              setState(() {
                changeTabPage(value);
              });
            },
            currentIndex: tabpageIndex,
            showUnselectedLabels: true,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            snakeShape: SnakeShape.circle,
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedItemColor: Colors.blue,
            snakeViewColor: Theme.of(context).colorScheme.inversePrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(IconlyBroken.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(IconlyBroken.profile), label: "Profile"),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.home),
              // )
            ],
          ),
        );
      },
    );
  }
}
