// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../Utils/database.dart';

class Display extends StatelessWidget {
  final List<String> dNote;

  const Display({Key? key, required this.dNote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a TextEditingController with the initial value
    TextEditingController _descriptionController = TextEditingController(
      text: dNote[1],
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Diary db = Diary();
              db.updateNoteDescription(dNote, _descriptionController.text);
              Navigator.pop(context, true);
            },
            icon: Icon(Icons.check),
            color: Colors.white,
          )
        ],
        title: const Text(
          "M Y  D I A R Y",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    dNote[0].toUpperCase(),
                    style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // Use _descriptionController for initial text and to get edited text
              controller: _descriptionController,
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
              maxLines: null, // Allows multiple lines of text
              decoration: InputDecoration(
                hintText: "Enter the description",
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
