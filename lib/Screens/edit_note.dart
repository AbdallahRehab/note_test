import 'package:flutter/material.dart';
import 'package:notes_test/utils/ToastM.dart';
import 'package:sizer/sizer.dart';

import '../widgets/TextFieldWidget.dart';

class EditNoteScreen extends StatefulWidget {
  final String noteContent;

  const EditNoteScreen({Key? key, required this.noteContent}) : super(key: key);

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final _noteFieldController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _noteFieldController.text = widget.noteContent;
  }

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Edit Note",
            style: TextStyle(color: Colors.white, fontSize: 22)),
        actions: [
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              ToastM.show("save");
            },
            child: const Icon(Icons.save_as_outlined,
                color: Colors.white, size: 30),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWidget(
              controller: _noteFieldController,
              labelText: "note",
              height: 30.h,
              onSubmitted: () {},
              maxLines: 13,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(2),
                  child: Text("Assign to user",style: TextStyle(fontSize: 12)),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[500]!, width: 1),
                    ),
                    child: DropdownButton(
                      // Initial Value
                      value: dropdownvalue,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      isExpanded: true,
                      underline: SizedBox(),

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
