import 'package:flutter/material.dart';
import 'package:text_editor/app/screen/anotacoes.dart';
import 'package:text_editor/app/screen/create.dart';
import 'package:text_editor/app/screen/settings.dart';



class App extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Editor',
        theme: ThemeData(

            primarySwatch: Colors.indigo,
            

        ),
        routes: {
            '/': (context) => Anotacoes(),
            'create': (context) => Create(),
            'settings': (context) => Settings()
            },
        );
    }
}
