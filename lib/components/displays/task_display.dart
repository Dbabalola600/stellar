

import 'package:flutter/material.dart';
import 'package:stellar_eminence/utils/colors.dart';

class Props {
  final String title;

  final String content;

  final bool isComplete;

  Props({
    required this.title,
    required this.content,
    required this.isComplete
  });
}

class TaskDisplay extends StatefulWidget {
  final Props props;
  TaskDisplay({required this.props});

  @override
  _TaskDisplayState createState() => _TaskDisplayState();
}

class _TaskDisplayState extends State<TaskDisplay> {
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
              borderRadius: BorderRadius.only(
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
                  offset: Offset(0, 3),
                )
              ],
            ),
            margin: const EdgeInsets.only(bottom: 2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.props.title,
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

                  widget.props.isComplete == false ?  
                  Container(
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
                          onPressed: () {
                            // Put your code here
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                            color: primaryColor,
                          ),
                          onPressed: () {
                            // Put your code here
                          },
                        ),

                        IconButton(
                          icon: const Icon(
                            Icons.check_circle_outline,
                            color: primaryColor,
                          ),
                          onPressed: () {
                            // Put your code here
                          },
                        ),
                      ],
                    ),
                  )
                  
                  
                  :

                Container(),
                  
                ]),
          )
        ]),
      ),
    );
  }
}
