import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../components/displays/back_appbar.dart';
import '../components/displays/task_display.dart';
import '../components/navigation/bottom_navbar.dart';
import '../utils/colors.dart';
import 'add_task_page.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({Key? key}) : super(key: key);
  @override
  State<CompletedPage> createState() => _CompletedPageSate();
}

class _CompletedPageSate extends State<CompletedPage> {
  // int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
         appBar: backButtonAppbar("Completed Task", primaryColor),
        backgroundColor: secondaryColor,
        
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
                    isComplete: true))
          ],
        )),
      ),
    );
  }
}
