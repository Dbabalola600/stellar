import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../pages/completed_screen_page.dart';
import '../../pages/home_screen_page.dart';
import '../../utils/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  dynamic count = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Get.to(const HomePage()); 
            break;
             case 1:
            Get.to(const CompletedPage()); // Navigate to the home page
            break;

        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'All',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check),
          label: 'Completed',
        ),
      ],
      backgroundColor: whiteColor,
      selectedItemColor: primaryColor, 
      unselectedItemColor: unselected, 

      showUnselectedLabels:
          true, 
      type:
          BottomNavigationBarType.fixed, 

    );
  }
}
