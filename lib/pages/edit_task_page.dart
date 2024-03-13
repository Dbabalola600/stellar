import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/displays/app_alert_dialogue.dart';
import '../components/displays/app_button.dart';
import '../components/displays/back_appbar.dart';
import '../requests/task_request.dart';
import '../utils/colors.dart';

class EditTaskPage extends StatefulWidget {
  final dynamic tId;

  final dynamic title;

  final dynamic content;
  const EditTaskPage(this.tId, this.title, this.content, {Key? key})
      : super(key: key);
  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final titleTextController = TextEditingController();
  final contentTextController = TextEditingController();

  bool isButtonDisabled = true;
  bool _isLoading = false;

  bool showError = false;

  void initState() {
    super.initState();
    showInfo();
  }

  void isTextFieldBlankValidation() {
    if (titleTextController.text.isEmpty ||
        contentTextController.text.isEmpty) {
      setState(() {
        isButtonDisabled = true;
      });
    } else {
      setState(() {
        isButtonDisabled = false;
      });
    }
  }

  void showLoginErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AppAlertDialogue(
          title: 'Error ',
          content: 'unknown erro',
          contentColor: primaryColor,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                setState(() {
                  showError = false; // Set showError to false when closing
                });
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showInfo() async {
    // print("here"+ widget.tId + widget.title + widget.content);

    print(widget.tId);
  }

  void editItem() async {
    setState(() {
      _isLoading = true;
    });
    var response = await editOne(
        content: contentTextController.text.isEmpty
            ? widget.content
            : contentTextController.text,
        id: widget.tId,
        title: titleTextController.text.isEmpty
            ? widget.title
            : titleTextController.text);

    if (response["status"] == 200) {
      // Get.to(const HomePage());
      Get.back();
    } else {
      setState(() {
        showError = true;
      });
      // ignore: use_build_context_synchronously
      showLoginErrorDialog(context);
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
          // ignore: prefer_interpolation_to_compose_strings
          appBar:
              backButtonAppbar("Edit Task" "  " + widget.title, primaryColor),
          body: SafeArea(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Title',
                          ),
                          controller: titleTextController,
                          onChanged: (text) {
                            isTextFieldBlankValidation();
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Detail"),
                          controller: contentTextController,
                          onChanged: (text) {
                            isTextFieldBlankValidation();
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceAround, 
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              AppButton(
                                buttonColour: primaryColor,
                                text: _isLoading ? "Loading..." : "Update",
                                onPress: editItem,
                                // isDisabled: isButtonDisabled,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                                width: 10,
                              ),
                        Expanded(
                          child: Column(
                            children: [
                              AppButton(
                                buttonColour: primaryColor,
                                text: "Cancel",
                                onPress: () => Get.back(),
                                // isDisabled: isButtonDisabled,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          )),
        ));
  }
}
