import 'package:flutter/material.dart';

import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageSate();
}

class _HomePageSate extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int dayNum = (DateTime.now().day);

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 50.0,
                  color: Colors.white,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0), 
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
          ],
          leading: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Text(
                    "TODO APP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              )),
        ),
        backgroundColor: secondaryColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          tooltip: 'Increment',
          backgroundColor: primaryColor,
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(child: Column()),
      ),
    );
  }
}
