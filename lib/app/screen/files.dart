
import 'package:flutter/material.dart';



class Files extends StatelessWidget {
    const Files({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(

            appBar: AppBar(

                title: Text("Arquivos"),

                actions: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pushNamed("edit"), 
                        icon: Icon(Icons.add)
                    )
                ]
            ),


            body: Column(
                    children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                minimumSize: Size(500, 80),
                                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                            ),


                            child: Text("Texto1"),
                            onPressed: () => null
                        )
                    ],
                )
            
        );
    }
}