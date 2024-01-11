import 'package:diary_app/Pages/add_note.dart';
import 'package:diary_app/Pages/display.dart';
import 'package:diary_app/Pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  // ignore: unused_local_variable
  var box = await Hive.openBox('diary_content');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/addnote': (context) => const AddNote(),
        '/display': (context) => const Display()
      },
    );
  }
}
