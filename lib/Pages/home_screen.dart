import 'package:diary_app/Pages/display.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../Utils/database.dart';
import '../Utils/item_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Diary db = Diary();
  final _myBox = Hive.box("diary_content");

  @override
  void initState() {
    super.initState();
    if (_myBox.get("DIARYLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  Future<void> _navigateToAddNoteScreen() async {
    await Navigator.pushNamed(context, '/addnote');
    // After navigating back from AddNote screen, reload data
    db.loadData();
    // Update the UI by calling setState
    setState(() {});
  }

  Future<void> _navigateToDisplayScreen(List<String> note) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Display(dNote: note),
      ),
    );

    // After navigating back from the 'display' screen, reload data
    db.loadData();
    // Update the UI by calling setState
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<List<String>> notes = db.loadData();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "M Y  D I A R Y",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _navigateToAddNoteScreen();
        },
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.black,
        elevation: 0,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            // Pass the selected note to the _navigateToDisplayScreen function
            _navigateToDisplayScreen(notes[index]);
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ItemNote(
              dNote: notes[index],
            ),
          ),
        ),
      ),
    );
  }
}
