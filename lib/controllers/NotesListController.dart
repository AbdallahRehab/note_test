import 'package:flutter/cupertino.dart';
import '../Models/Notes_model.dart';
import '../services/note_list_services.dart';

class NotesListController extends ChangeNotifier {
  // get all orders
  List<NotesModel> allNotesModel = [];

  Future<List<NotesModel>> getAllNotes() async {
    allNotesModel = await AllOrdersServices().getAllNotesApi();

    notifyListeners();
    return allNotesModel;
  }
}
