import 'package:flutter/material.dart';
import 'package:flutter_todo_1/todo_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, // Sistem temasına izin verme alanı
      home: TodoHomeScreen(), //Ana ekranı belirleyen kodumuz
    );
  }
}
