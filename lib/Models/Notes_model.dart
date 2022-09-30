


class NotesModel {


  NotesModel.fromJson(dynamic json) {
    text = json['text'];
    placeDateTime = json['placeDateTime'];
    userId = json['userId'];
    id = json['id'];
  }
  String? text;
  String? placeDateTime;
  String? userId;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['placeDateTime'] = placeDateTime;
    map['userId'] = userId;
    map['id'] = id;
    return map;
  }

}