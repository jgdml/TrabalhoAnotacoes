import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'package:text_editor/app/domain/entities/anotacao.dart';
import 'package:text_editor/app/domain/services/anotacao_service.dart';

part 'anotacoes_back.g.dart';

class AnotacoesBack = _AnotacoesBack with _$AnotacoesBack;


abstract class _AnotacoesBack with Store{

    var _service = GetIt.I.get<AnotacaoService>();

    Future<List<Anotacao>>? anotacoes;


    _AnotacoesBack(){
        this.anotacoes = _service.buscar();
    }

    atualizarLista(){
        anotacoes = _service.buscar();
    }

    irParaForm(BuildContext context, {Anotacao? anotacao}){
        Navigator.of(context).pushNamed('create', arguments: anotacao)
        .then(atualizarLista());
    }

    excluir(int id){
        _service.remover(id);
        atualizarLista();
    }
}