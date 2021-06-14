import 'package:flutter/material.dart';


class Anotacoes extends StatefulWidget {
    const Anotacoes({ Key? key }) : super(key: key);

  @override
    _AnotacoesState createState() => _AnotacoesState();
}

class _AnotacoesState extends State<Anotacoes> {

    final anotacoes = [
        {
            'titulo': 'titulo1',
            'texto': 'texto1',
            'dt_criacao': 'data criação'
        }
    ];

    @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

            title: Text("Anotações"),

            actions: [
                IconButton(
                    onPressed: () => Navigator.of(context).pushNamed('settings'), 
                    icon: Icon(Icons.settings)
                )
            ]
        ),
        body: ListView.builder(
            itemCount: anotacoes.length,
            itemBuilder: (context, i){
                var anotacao = anotacoes[i];

                var arrow = Icon(Icons.arrow_drop_down_circle_outlined);

                return ListTile(
                    title: Text(anotacao['titulo'].toString()),
                    subtitle: Text(anotacao['dt_criacao'].toString()),
                    trailing: Container(
                        child: arrow
                    ),
                    onTap: () => Icon(Icons.arrow_upward_outlined),

                );
            }
                
            
        ),

        floatingActionButton: 
            FloatingActionButton(
                onPressed: () => Navigator.of(context).pushNamed('create'), 
                child: Icon(Icons.add),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white
            )
        );
    }
}
