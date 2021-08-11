import 'package:flutter/material.dart';
import 'package:text_editor/app/screen/create_back.dart';


class Create extends StatefulWidget {
    const Create({ Key? key }) : super(key: key);

    @override
    _CreateState createState() => _CreateState();
}


class _CreateState extends State<Create> {
    final _formState = GlobalKey<FormState>();


    Widget titleField(CreateBack back){
        return TextFormField(
            validator: back.validarTitulo,
            onSaved: (val) => back.anotacao?.titulo = val,

            initialValue: back.anotacao?.titulo ?? '',
            autofocus: true,
            maxLength: 40,

            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
                labelText: "Título",
                hintText: "Anotação 1",
            ),
        );
    }


    Widget textField(CreateBack back){
        return TextFormField(
            validator: back.validarTexto,
            onSaved: (val) => back.anotacao?.texto = val,
            initialValue: back.anotacao?.texto ?? '',

            scrollPadding: EdgeInsets.all(20.0),
            keyboardType: TextInputType.multiline,
            minLines: 3,
            maxLines: 12,
            maxLength: 1000,

            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
                labelText: "Texto",
                hintText: "Texto da anotação 1"
            ),
        );
    }

    showSnack(context, String text){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Anotação salva"))
        );
    }


    @override
    Widget build(BuildContext context) {
        var _back = CreateBack(context);

        return Scaffold(

            appBar: AppBar(
                title: Text("Criar Anotação"),
                actions: [
                    IconButton(
                        onPressed: () async{
                            _formState.currentState!.validate();
                            _formState.currentState!.save();

                            if (_back.isValido){
                                await _back.salvar();
                                showSnack(context, "Anotação salva");
                                Navigator.of(context).pop();
                            }
                        }, 
                        icon: Icon(Icons.save)
                    )
                ]
            ),



            body: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: _formState,
                    child: Column(
                        children: [
                            titleField(_back),
                            SizedBox(height: 15),
                            textField(_back)
                        ],
                    )
                )
            )
        );
    }
}