import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/displays/task_display.dart';
import '../components/navigation/bottom_navbar.dart';

import '../requests/task_request.dart';
import '../utils/colors.dart';
import 'add_task_page.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageSate();
}

class Tasks {
  final dynamic title;

  final dynamic content;

  final dynamic id;

  Tasks({required this.title, required this.content, required this.id});
}

class _HomePageSate extends State<HomePage> {
  int _currentIndex = 0;
  bool _isLoading = false;
  Timer? _timer;
  List<Tasks> taskList = [];
  List<Map<String, String>> taskData = [];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer =
        Timer.periodic(const Duration(seconds: 2), (Timer t) => showInfo());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> showInfo() async {
    setState(() {
      _isLoading = true;
    });

    await connect();
    var response = await getAll();


    if (response != null) {
      // ignore: avoid_print

      var resData = response;

      taskList = (resData as List).map((task) {
        return Tasks(
          id: task["_id"],
          content: task["content"],
          title: task["title"],
        );
      }).toList();
      // print(taskList);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    int dayNum = (DateTime.now().day);

    return WillPopScope(
      // onWillPop: () => Future.value(false),
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 10,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 35.0,
                    color: Colors.white,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        dayNum.toString(),
                        style: const TextStyle(
                          fontSize: 12.0,
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
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () =>showInfo(),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Refresh",
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            ...taskList.map((tasks) => 
            (
              TaskDisplay(
                props: Props(
                    content: tasks.content,
                    title: tasks.title,
                    id: tasks.id,
                    isComplete: false))
            )
            ),
            
          ],
        )),
      ),
    );
  }
}
