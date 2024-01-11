import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Utils/database.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  String year = "${DateTime.now().year}";
  String month = "${DateTime.now().month}";
  String day = "${DateTime.now().day}";
  String time = "${DateTime.now().hour}:${DateTime.now().minute}";

  Diary db = Diary();
  // ignore: unused_field
  final _myBox = Hive.box("diary_content");

  void addNewTask() {
    setState(() {
      db.addNote([_title.text, _description.text, month, day, year, time]);
      _title.clear();
      _description.clear();
    });
    // db.updateData();
    Navigator.pop(context); // Navigate back to the previous screen (home page)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              addNewTask();
            },
            icon: const Icon(Icons.done),
            color: Colors.white,
          )
        ],
        title: const Text(
          "A D D  N O T E",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: TextField(
                controller: _description,
                decoration: InputDecoration(
                    hintText: "Start typing here...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                maxLines: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
