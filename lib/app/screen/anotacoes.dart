import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


import 'package:text_editor/app/domain/entities/anotacao.dart';
import 'package:text_editor/app/screen/anotacoes_back.dart';


class Anotacoes extends StatelessWidget {
    
    final _back = AnotacoesBack();

    Widget mostrarBotoes(BuildContext context, Anotacao anotacao){
        return Container(
            height: 100,
            alignment: Alignment.topRight,
            child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                    IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _back.irParaForm(context, anotacao: anotacao)
                    ),
                    IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: (){
                            showDialog(
                                context: context, 
                                builder: (context) => AlertDialog(
                                    title: Text("Excluir?"),
                                    content: Text("Deseja excluir a anotação "+anotacao.titulo!+"?"),
                                    actions: [
                                        TextButton(
                                            onPressed: () => Navigator.of(context).pop(), 
                                            child: Text("NÃO")
                                        ),
                                        TextButton(
                                            onPressed: (){
                                                _back.excluir(anotacao.id!);
                                                Navigator.of(context).pop();
                                            },
                                            child: Text("SIM")
                                        )
                                    ],

                                )
                            );
                        }
                    ),
                ]
            )
        );
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
                onPressed: () => _back.irParaForm(context), 
                child: Icon(Icons.add)
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

                                    return Card(
                                        elevation: 2,
                                        child: ExpansionTile(
                                            title: Text(anotacao.titulo!),
                                            subtitle: Text(anotacao.dtModificacao!),

                                            children: [
                                                Text(anotacao.texto!, style: TextStyle(fontSize: 18)),
                                                mostrarBotoes(context, anotacao)
                                            ]
                                        )
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
