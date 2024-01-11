import 'package:hive_flutter/hive_flutter.dart';

class Diary {
  Box _myBox = Hive.box("diary_content");
  String year = "${DateTime.now().year}";
  String month = "${DateTime.now().month}";
  String day = "${DateTime.now().day}";
  String time = "${DateTime.now().hour}:${DateTime.now().minute}";

  void createInitialData() {
    if (_myBox.get("DIARYLIST") == null) {
      _myBox.put("DIARYLIST", [
        ["Welcome", "I hope you like the app", month, day, year, time]
      ]);
    }
  }

  List<List<String>> loadData() {
    dynamic data = _myBox.get("DIARYLIST");
    if (data != null) {
      return List<List<String>>.from(data);
    }
    return [];
  }

  void addNote(List<String> note) {
    List<dynamic> notes = _myBox.get("DIARYLIST", defaultValue: []);
    notes.add(note);
    _myBox.put("DIARYLIST", notes);
  }
}
