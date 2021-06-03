import 'package:flutter/material.dart';
import 'package:text_editor/app/screen/files.dart';
import 'package:text_editor/app/screen/edit.dart';


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editor',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.dark(),
        primaryColor: Colors.purple


      ),
      routes: {
          '/': (context) => Files(),
          'edit': (context) => Edit()
      },
    );
  }
}
