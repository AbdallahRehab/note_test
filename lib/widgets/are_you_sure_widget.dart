
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/Themes.dart';


class AreYouSure extends StatelessWidget {
  final String title;
  final String des;
  final String ConfirmTitel;
  final String CancelTitel;
  final Function onConfirm;
  final Function onCancel;
  const AreYouSure({Key? key, required this.title, required this.des, required this.onConfirm, required this.onCancel, required this.ConfirmTitel, required this.CancelTitel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8.0, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10,),
          Text(
            des,
            textAlign: TextAlign.center,
            style: TextStyle(
fontSize: 11.sp,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            width: 40.w,
            height: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Themes.red,borderRadius: BorderRadius.circular(10)),
              child:ElevatedButton(
                onPressed: () => onConfirm(),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                  backgroundColor: MaterialStateProperty.all<Color>( Colors.transparent),
                  shadowColor:
                  MaterialStateProperty.all(Colors.transparent),
                
                  // backgroundColor: MaterialStateProperty.all<Color>( GlobalColors.kButtonColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                child: Text(
                  ConfirmTitel,
                  style: TextStyle(fontSize: 10.sp,height: 2,color: Colors.white,),
                ),
              ),
            ),
          ),
          SizedBox(height: 14,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            width: 40.w,
            height: 40,
            child: ElevatedButton(
              onPressed: () => onCancel(),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                backgroundColor: MaterialStateProperty.all<Color>( Themes.greyLight),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              child: Text(
                CancelTitel,
                style: TextStyle(fontSize: 12,height: 2,color: Colors.black,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
