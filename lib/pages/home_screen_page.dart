import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_eminence/components/displays/task_display.dart';
import 'package:stellar_eminence/pages/add_task_page.dart';

import '../components/navigation/bottom_navbar.dart';
import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageSate();
}

class _HomePageSate extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    int dayNum = (DateTime.now().day);

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 10,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right:10.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 50.0,
                    color: Colors.white,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        dayNum.toString(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          
          centerTitle: false,
          title: const Text(
            "TODO APP",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: secondaryColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const NewTaskPage());
          },
          backgroundColor: primaryColor,
          shape: const CircleBorder(),
          elevation: 4.0,
          child: const Icon(
            Icons.add,
            color: whiteColor,
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            TaskDisplay(
                props: Props(
                    content: "TODO CONTENT",
                    title: "TODO TITLE",
                    isComplete: false))
          ],
        )),
      ),
    );
  }
}
