import 'package:flutter/material.dart';
import 'package:notes_test/utils/ToastM.dart';
import 'package:provider/provider.dart';

import '../controllers/NotesListController.dart';
import '../utils/Themes.dart';
import '../widgets/EmptyScreenWidget.dart';
import '../widgets/OnceFutureBuilder.dart';
import '../widgets/search_box.dart';
import 'add_user_page.dart';
import 'edit_note.dart';
import 'option_page.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final _searchFieldNode = FocusNode();
  final _searchFieldController = TextEditingController();
  bool isVisibleSearch = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchFieldNode.addListener(_onFocusChange);
  }

  String get _searchKeyword => _searchFieldController.text;
  bool _showResult = false;

  void _onFocusChange() {
    if (_searchKeyword.isEmpty && !_searchFieldNode.hasFocus) {
      _showResult = false;
    } else {
      _showResult = !_searchFieldNode.hasFocus;
    }

    Future.delayed(const Duration(milliseconds: 120), () {
      setState(() {
        isVisibleSearch = _searchFieldNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Notes",
              style: TextStyle(color: Colors.white, fontSize: 22)),
          actions: [
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddUserScreen(),
                ));
              },
              child: const Icon(Icons.person_add_alt_1,
                  color: Colors.white, size: 30),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => OptionScreen(),
                ));
              },
              child: const Icon(Icons.settings, color: Colors.white, size: 30),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                // ToastM.show("");
              },
              child:
                  const Icon(Icons.drag_handle, color: Colors.white, size: 30),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ToastM.show("add");
          },
          backgroundColor: Themes.primaryColor,
          child: Icon(Icons.add),
        ),
        body: Consumer<NotesListController>(
            builder: (_, model, child) => RefreshIndicator(
                color: Themes.primaryColor,
                onRefresh: () async {
                  await model.getAllNotes();
                },
                child: OnceFutureBuilder(
                    future: () => model.getAllNotes(),
                    builder: (ctx, snapShot) {
                      if (snapShot.connectionState != ConnectionState.done) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Themes.primaryColor,
                          ),
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.filter_alt,
                                    color: Themes.primaryColor, size: 35),
                                // Icon(Icons.search,color: Themes.primaryColor,size: 35),
                                Expanded(
                                  child: SearchBox(
                                    controller: _searchFieldController,
                                    focusNode: _searchFieldNode,
                                    onChanged: (String value) {},
                                    onSubmitted: (String value) {},
                                    onCancel: () {
                                      setState(() {
                                        isVisibleSearch = false;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                           Expanded(
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => EditNoteScreen(
                                              noteContent: "ssssssssss"),
                                        ));
                                      },
                                      title: Text(
                                          "TTTTTTTTTTTTTTTTTTTTTTT TTTTTTTTTTTTTTTTTTT TTTTTTTTTTTTTTTTTTTTTTTTTT tttttttttttttt",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis),
                                      trailing: Icon(Icons.edit,
                                          color: Colors.grey, size: 20),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      Divider(),
                                  itemCount: 20),
                            )
                          ],
                        ),
                      );
                    }))));
  }
}
