// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class ToastM {
  static show(String message) {
    // Fluttertoast.showToast(
    //     msg: message,
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.BOTTOM,
    //     backgroundColor: Colors.grey[700],
    //     timeInSecForIosWeb: 5);
    showToast(message,position: ToastPosition.bottom);
  }
  static showCenter(String message) {
    // Fluttertoast.showToast(
    //     msg: message,
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.CENTER,
    //     backgroundColor: Colors.grey[700],
    //     timeInSecForIosWeb: 5);
    showToast(message,position: ToastPosition.center);
  }
}
