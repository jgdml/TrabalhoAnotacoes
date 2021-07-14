import 'package:flutter/material.dart';
import 'package:text_editor/app/screen/create_back.dart';


class Create extends StatefulWidget {
    const Create({ Key? key }) : super(key: key);

    @override
    _CreateState createState() => _CreateState();
}


class _CreateState extends State<Create> {

    Widget titleField(CreateBack back){
        return TextFormField(
            initialValue: back.anotacao?.titulo ?? '',
            autofocus: true,
            style: TextStyle(fontSize: 18, color: Colors.white),

            decoration: InputDecoration(
                hintText: "Título da anotação",
                hintStyle: TextStyle(color: Colors.grey.shade400)
            ),
        );
    }


    Widget textField(CreateBack back){
        return TextFormField(
            initialValue: back.anotacao?.texto ?? '',
            decoration: InputDecoration(
                labelText: "Texto:"
            ),
            scrollPadding: EdgeInsets.all(20.0),
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 15,
            maxLength: 1000,
        );
    }


    Widget imageField(){
        return Column(
            children: [
                Container(
                    height: 100,
                    child: ListView(
                        
                    )
                ),
                
                ElevatedButton.icon(
                    onPressed: () => null, 
                    icon: Row(children: [Icon(Icons.add), Icon(Icons.image)],),
                    label: Text('Adicionar foto'),
                    
                )
            ],
        );
    }


    @override
    Widget build(BuildContext context) {
        var _back = CreateBack(context);

        return Scaffold(

            appBar: AppBar(
                title: titleField(_back),
                actions: [
                    IconButton(
                        onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Anotação salva"))
                            );
                            Navigator.of(context).pop();
                        }, 
                        icon: Icon(Icons.save)
                    )
                ]
            ),



            body: Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                    child: Column(
                        children: [
                            textField(_back),
                            imageField()
                        ],
                    )
                )
            )
        );
    }
}