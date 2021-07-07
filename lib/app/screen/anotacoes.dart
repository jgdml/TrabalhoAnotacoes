import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


import 'package:text_editor/app/domain/entities/anotacao.dart';
import 'package:text_editor/app/screen/anotacoes_back.dart';


class Anotacoes extends StatelessWidget {
    
    final _back = AnotacoesBack();


    Color _getCardColor(int index){
        if (index % 2 == 0){
            return Colors.white;
        }
        return Colors.blue.shade50;
    }


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

            floatingActionButton: FloatingActionButton(
                onPressed: () => Navigator.of(context).pushNamed('create'), 
                child: Icon(Icons.add),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white
            ),

            body: Observer(builder: (context){

                return FutureBuilder(
                    // espera a funçao asincrona terminar
                    // e pega seu retorno
                    future: _back.anotacoes,

                    // constroi a tela usando o retorno da funçao
                    builder: (context, future){

                        if (!future.hasData){
                            return CircularProgressIndicator();
                        }
                        else{
                            // converte future.data em uma lista de anotacao
                            var anotacoes = <Anotacao>[];
                            anotacoes = (future.data! as List<Anotacao>);

                            return ListView.builder(
                                itemCount: anotacoes.length,

                                itemBuilder: (context, i){
                                    var anotacao = anotacoes[i];

                                    return ListTile(
                                        
                                        title: Text(anotacao.titulo!),
                                        subtitle: Text(anotacao.dtCriacao!),
                                        tileColor: _getCardColor(i),

                                        trailing: Container(
                                            child: Icon(Icons.arrow_drop_down_circle_outlined)
                                        ),
                                        onTap: () => Icon(Icons.arrow_upward_outlined),

                                    );
                                }
                            );
                        }
                    }
                );
            })
        );
    }
}
