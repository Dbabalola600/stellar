import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../utils/colors.dart';

AppBar backButtonAppbar(Function(), String appBarTitle , dynamic cuscolor) {
  return AppBar(
    centerTitle: true,
    backgroundColor: cuscolor,
    elevation: 0.0,
    title: Text(
      appBarTitle,
      style: TextStyle(
          color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    // actions: [
    //     GestureDetector(
    //       onTap: () {},
    //       child: Container(
    //         alignment: Alignment.center,
    //         width: 37,
    //         margin: EdgeInsets.all(10),
    //         child: SvgPicture.asset(
    //           "assets/icons/dots.svg",
    //           height: 5,
    //           width: 5,
    //         ),
    //         decoration: BoxDecoration(
    //             color: whiteColor, borderRadius: BorderRadius.circular(10)),
    //       ),
    //     )
    //   ],
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
       
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}
