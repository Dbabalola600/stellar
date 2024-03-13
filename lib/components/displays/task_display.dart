import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/edit_task_page.dart';
import '../../requests/task_request.dart';
import '../../utils/colors.dart';

class Props {
  final String title;

  final String content;

  final bool isComplete;
  final dynamic? id;

  Props(
      {required this.title,
      required this.content,
      required this.isComplete,
      this.id});
}

class TaskDisplay extends StatefulWidget {
  final Props props;
  TaskDisplay({required this.props});

  @override
  _TaskDisplayState createState() => _TaskDisplayState();
}

class _TaskDisplayState extends State<TaskDisplay> {
  bool _isLoading = false;

  void deleteTask() async {
    setState(() {
      _isLoading = true;
    });
    // print(widget.props.id);

    var response = await deleteOne(id: widget.props.id);

    setState(() {
      _isLoading = false;
    });
  }

  void completeTask() async {
    setState(() {
      _isLoading = true;
    });
    print(widget.props.id);

    var response = await markCompleted(widget.props.id);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _isLoading ? "Loading..." : widget.props.title,
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(widget.props.content),
                      ],
                    ),
                  ),
                  widget.props.isComplete == false
                      ? Container(
                          margin: const EdgeInsets.all(3),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // edit

                              IconButton(
                                  icon: const Icon(
                                    Icons.mode_edit_outline_outlined,
                                    color: primaryColor,
                                  ),
                                  onPressed: () =>
                                      Get.to(EditTaskPage(widget.props.id, widget.props.title, widget.props.content))),

                              //delete
                              IconButton(
                                icon: const Icon(
                                  Icons.delete_outline_outlined,
                                  color: primaryColor,
                                ),
                                onPressed: () => deleteTask(),
                              ),
//mark completed
                              IconButton(
                                icon: const Icon(
                                  Icons.check_circle_outline,
                                  color: primaryColor,
                                ),
                                onPressed: () => completeTask(),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ]),
          )
        ]),
      ),
    );
  }
}
