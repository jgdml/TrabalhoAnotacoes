import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


import 'package:text_editor/app/db/sqlite/connection.dart';


class Anotacoes extends StatelessWidget {
    const Anotacoes({ Key? key }) : super(key: key);

    // Funçao que pega e retorna 
    // todos os registros da tabela anotacao
    Future<List<Map<String, dynamic>>> _getAnotacoes() async{
        
        Database db = await Connection.get();
        return db.query('ANOTACAO');
    }


    Color _getCardColor(int index){
        if (index % 2 == 0){
            return Colors.white;
        }
        return Colors.blue.shade50;
    }


    @override
    Widget build(BuildContext context) {
        
        return FutureBuilder(
            // espera a funçao asincrona terminar
            // e pega seu retorno
            future: _getAnotacoes(),

            // constroi a tela usando o retorno da funçao
            builder: (context, future){

                // caso existe dados, constroi a tela com eles
                if (future.hasData){

                    // converte future.data em uma lista
                    // e coloca em uma variavel
                    var anotacoes = (future.data! as List<Map<String, dynamic>>);

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

                                return ListTile(
                                    
                                    title: Text(anotacao['TITULO'].toString()),
                                    subtitle: Text(anotacao['DT_CRIACAO'].toString()),
                                    tileColor: _getCardColor(i),

                                    trailing: Container(
                                        child: Icon(Icons.arrow_drop_down_circle_outlined)
                                    ),
                                    onTap: () => Icon(Icons.arrow_upward_outlined),

                                );
                            }
                        ),

                        floatingActionButton: FloatingActionButton(
                            onPressed: () => Navigator.of(context).pushNamed('create'), 
                            child: Icon(Icons.add),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white
                        )
                    );
                }

                else{
                    return Scaffold(
                        body: Text('data: '+future.data.toString()),
                    );
                }
            }  
        );
    }
}
