import 'package:notes_test/Models/Notes_model.dart';

import '../utils/api_routes.dart';
import 'global_http.dart';

class AllOrdersServices {
  Future<List<NotesModel>> getAllNotesApi() async {
    List<NotesModel> notesListModel = [];
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        ApiRoutes.getAllNote,
      );
      print('QQQQQQQQQQ ${response.body}');
      if (response.statusCode == 200) {
        notesListModel=List<NotesModel>.from(
            (response.body! as List).map((x) => NotesModel.fromJson(x)));
        print('QQQQQQQQQQ $notesListModel');
        return notesListModel;
      }
      return notesListModel;
    } catch (e) {}
    return notesListModel;
  }
}
