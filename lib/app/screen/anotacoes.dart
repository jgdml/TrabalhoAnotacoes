import 'package:flutter/material.dart';

import 'package:text_editor/app/db/sqlite/dao/dao_anotacao_impl.dart';
import 'package:text_editor/app/domain/entities/anotacao.dart';


class Anotacoes extends StatelessWidget {
    const Anotacoes({ Key? key }) : super(key: key);

    // Funçao que pega e retorna 
    // todos os registros da tabela anotacao
    Future<List<Anotacao>> _getAnotacoes() async{
        
        return await DaoAnotacaoImpl().buscar();
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

                // converte future.data em uma lista de anotacao
                // e coloca em uma variavel
                var anotacoes = (future.data! as List<Anotacao>);

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
                                
                                title: Text(anotacao.titulo),
                                subtitle: Text(anotacao.dtCriacao),
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
        );
    }
}
