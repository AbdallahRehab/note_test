import 'package:flutter/material.dart';
import 'package:notes_test/utils/ToastM.dart';

import '../utils/Themes.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Optins",
            style: TextStyle(color: Colors.white, fontSize: 22)),

      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Use Local Database',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'instead of using http call to work with the app data ,please use SQLite for this',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Transform.scale(
                scale: 1.5,
                child: Switch(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: toggleSwitch,
                  value: isSwitched,
                  activeColor: Themes.primaryColor,
                  activeTrackColor: Themes.primaryColor.withOpacity(0.5),
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey.shade400,
                )),
          ],
        ),
      ),
    );
  }
}
