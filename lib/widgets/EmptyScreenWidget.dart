
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../utils/AssetsRoutes.dart';


class EmptyScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AssetsRoutes.empty, height: 40.w, width: 40.w),
        Text("empty_screen", style: TextStyle(fontSize: 14.sp))
      ],
    );
  }
}
