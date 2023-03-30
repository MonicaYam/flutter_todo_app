import 'package:flutter/material.dart';
import 'package:flutter_application_2/todoListPage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'My Todo App',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.kaiseiOptiTextTheme(),
      ),
      // リスト一覧画面を表示
      home: const TodoListPage(),
    );
  }
}
