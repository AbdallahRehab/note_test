import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_test/utils/Themes.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'Screens/note_list.dart';
import 'controllers/NotesListController.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(child: Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider<NotesListController>(
                create: (context) => NotesListController()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Themes.primaryColor,
              appBarTheme: AppBarTheme(
                centerTitle: false,
                color: Themes.primaryColor,
                iconTheme: IconThemeData(color: Colors.white),
                elevation: 1,
                systemOverlayStyle: SystemUiOverlayStyle(
                  // Status bar color
                  statusBarColor: Themes.primaryColor,
                ),
              ),
            ),
            home: const NoteList(),
          ));
    }));
  }
}
