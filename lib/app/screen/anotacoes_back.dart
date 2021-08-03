import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'package:text_editor/app/domain/entities/anotacao.dart';
import 'package:text_editor/app/domain/services/anotacao_service.dart';
import 'package:url_launcher/url_launcher.dart';

part 'anotacoes_back.g.dart';

class AnotacoesBack = _AnotacoesBack with _$AnotacoesBack;


abstract class _AnotacoesBack with Store{

    var _service = GetIt.I.get<AnotacaoService>();

    @observable
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

    Future<bool> launchEmail() async{
        var email = "mailto:jgdml2801@gmail.com?subject=Suporte do aplicativo Anotações";

        if (await canLaunch(email)){
            launch(email);
            return true;
        } 
        return false;

    }

    excluir(int id){
        _service.remover(id);
        atualizarLista();
    }
}