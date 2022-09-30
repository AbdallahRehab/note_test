import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';
import '../utils/Themes.dart';
import '../widgets/TextFieldWidget.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final _usernameFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  bool isShow = false;

  setIsPassShow(bool status) {
    setState(() {
      isShow = status;
    });
  }

  List<File> selectFilesImage = <File>[];
  List<File> finalFilesImage = <File>[];

  updateimages(images) {
    setState(() {
      finalFilesImage.addAll(images);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add User",
            style: TextStyle(color: Colors.white, fontSize: 22)),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                FilePickerResult? result =
                await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  type: FileType.image,
                );

                if (result != null) {
                  selectFilesImage = result.paths
                      .map((path) => File(path!))
                      .toList();
                  print(
                      'FFFFFF:: ${selectFilesImage.length}');

                  updateimages(selectFilesImage);
                } else {
                  // User canceled the picker
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 3,
                        color: Colors.grey.shade300,
                        offset: const Offset(0, 0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Image.asset(
                      //   AssetsRoutes.addphoto,
                      //   height: 50,
                      //   width: 50,
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Add_car_pictures",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildGridImagesView(),
            ),
            SizedBox(height: 5.h,),
            TextFieldWidget(
              controller: _usernameFieldController,
              textInputType: TextInputType.text,
              labelText: "User Name",
              onSubmitted: () {},
            ),
            SizedBox(
              height: 2.h,
            ),
            TextFieldWidget(
              controller: _passwordFieldController,
              textInputType: TextInputType.text,
              onChangeText: (v) {},
              labelText: "Password",
              isInputPassword: !isShow,
              suffixIcon: GestureDetector(
                onTap: () {
                  setIsPassShow(!isShow);
                },
                child: isShow
                    ? Icon(
                        Icons.visibility_off,
                        color: Themes.grey,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Themes.grey,
                      ),
              ),
              padding: EdgeInsets.symmetric(vertical: 6),
            ),
            SizedBox(
              height: 2.h,
            ),
            TextFieldWidget(
              controller: _emailFieldController,
              textInputType: TextInputType.emailAddress,
              labelText: "Email",
              onSubmitted: () {},
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Text("interset", style: TextStyle(fontSize: 12)),
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
                )),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 95.w,
              height: 5.h,
              child: ElevatedButton(
                child: const Text('Save'),
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Themes.primaryColor),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 16))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridImagesView() {
    return finalFilesImage.isEmpty?Container():Column(
      children: [
        Row(
          children: [
            Text("car_pictures",style: TextStyle(
                fontSize: 11.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          height: 10.h,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            children: List.generate(finalFilesImage.length, (index) {
              File asset = finalFilesImage[index];
              print('MMMMMM::${asset.path}');
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  height: 20.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF727272).withOpacity(0.16),
                        offset: Offset(0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.file(
                      // asset: asset,
                      asset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
