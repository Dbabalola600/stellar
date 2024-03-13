import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../requests/task_request.dart';

import '../components/displays/back_appbar.dart';
import '../components/displays/task_display.dart';

import '../utils/colors.dart';

import 'dart:async';

class CompletedPage extends StatefulWidget {
  const CompletedPage({Key? key}) : super(key: key);
  @override
  State<CompletedPage> createState() => _CompletedPageSate();
}

class Tasks {
  final dynamic title;

  final dynamic content;

  final dynamic id;

  Tasks({required this.title, required this.content, required this.id});
}

class _CompletedPageSate extends State<CompletedPage> {
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
    var response = await getCompleted();

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
            ...taskList.map((tasks) => 
            (
              TaskDisplay(
                props: Props(
                    content: tasks.content,
                    title: tasks.title,
                    id: tasks.id,
                    isComplete: true))
            )
            ),
          ],
        )),
      ),
    );
  }
}
