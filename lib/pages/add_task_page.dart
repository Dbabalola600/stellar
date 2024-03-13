import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../components/displays/app_alert_dialogue.dart';
import '../components/displays/app_button.dart';
import '../components/displays/back_appbar.dart';
import '../requests/task_request.dart';
import '../utils/colors.dart';
import 'home_screen_page.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({Key? key}) : super(key: key);
  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final titleTextController = TextEditingController();
  final contentTextController = TextEditingController();

  bool isButtonDisabled = true;
  bool _isLoading = false;

  bool showError = false;

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

  void createNew() async {
    setState(() {
      _isLoading = true;
    });

    var response =
        await newTask(titleTextController.text, contentTextController.text);
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: backButtonAppbar("Add Task", primaryColor),
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
                            labelText: 'Detail',
                          ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppButton(
                          buttonColour: primaryColor,
                          text: _isLoading ? "Loading..." : "Add",
                          onPress: createNew,
                          isDisabled: isButtonDisabled,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                )),
          )),
        ));
  }
}
