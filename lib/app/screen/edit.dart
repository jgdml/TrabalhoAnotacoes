import 'package:flutter/material.dart';



class Edit extends StatefulWidget {
    const Edit({ Key? key }) : super(key: key);

    @override
    _EditState createState() => _EditState();
}


class _EditState extends State<Edit> {

    final titleController = TextEditingController();
    final textController = TextEditingController();


    @override
    Widget build(BuildContext context) {
        return Scaffold(

            appBar: AppBar(

                title: TextField(
                    controller: titleController,
                    style: TextStyle(fontSize: 20),
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "Nome do arquivo",
                    ),
                ),

                actions: [
                    IconButton(
                        onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Texto salvo"))
                            );

                            Navigator.of(context).pop();
                            
                        }, 
                        icon: Icon(Icons.save)
                    )
                ]
            ),



            body: Center(

                child: TextField(
                    controller: textController,
                    decoration: InputDecoration(hintText: "Digite o texto"),
                    scrollPadding: EdgeInsets.all(20.0),
                    keyboardType: TextInputType.multiline,
                    maxLines: 99999,
                    )
    
                ),
        
        );
    }
}