
import 'dart:ui';

import 'package:flutter/material.dart';

class Themes {
  static final red = Color(0xffCF2E35);
  static final bg_color = Color(0xffF7F7F9);
  static final white = Color(0xffffffff);
  static final black = Color(0xff000000);
  static final greyLight = Color(0xffE9E4E4);
  static final finishColor = Color(0xff0078FF);
  static final cancelColor = Color(0xffCF2E35);
  static final primaryColor = Color(0xff7653E0);
  static final workInProgressColor = Color(0xffE36414);
  static final pickupColor = Color(0xff008714);
  static final notPaidColor = Color(0xff4A4D4E);
  static final paidColor = Color(0xff00406C);
  static final dividerColor = Color(0xffE7EDF2);
  static final blue = Colors.blue;
  static final green = Colors.green;
  static final grey = Colors.grey;
}
Widget animationItemWidget({required Widget child,required Animation<double> animation}){
  return FadeTransition(
    opacity: Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animation),
    // And slide transition
    child: SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0, -0.1),
        end: Offset.zero,
      ).animate(animation),
      // Paste you Widget
      child: child,
    ),
  );
}