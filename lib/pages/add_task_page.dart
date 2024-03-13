import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_eminence/components/displays/back_appbar.dart';
import 'package:stellar_eminence/utils/colors.dart';

import '../components/displays/app_button.dart';

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
        onWillPop: () => Future.value(false),
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
                          onPress: ()=>{},
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
