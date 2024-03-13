import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

AppBar backButtonAppbar( String appBarTitle, dynamic cuscolor) {
  return AppBar(
    backgroundColor: cuscolor,
centerTitle: false,
    elevation: 50,
    title: Text(
      appBarTitle,
      style: const TextStyle(
          color: whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
        child: const Icon(
          Icons.arrow_back,
          color: whiteColor,
          // size: 10,
          weight: 30,
        ),
      ),
    ),
  );
}
