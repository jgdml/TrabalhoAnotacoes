import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:text_editor/app/domain/entities/anotacao.dart';
import 'package:text_editor/app/domain/services/anotacao_service.dart';


class CreateBack {
    Anotacao? anotacao;

    var _svc = GetIt.I.get<AnotacaoService>();

    bool _tituloValido = false;
    bool _textoValido = false;


    CreateBack(BuildContext context){
        var parametro = ModalRoute.of(context)!.settings.arguments;
        

        if (parametro != null){
            anotacao = parametro as Anotacao;
        }
        else{
            anotacao = Anotacao();
        }
    }
    

    salvar() async {
        _svc.salvar(anotacao!);
    }


    bool get isValido => _tituloValido && _textoValido;
    

    String? validarTitulo(String? titulo){
        try{
            _svc.validarTitulo(titulo);
            _tituloValido = true;
            return null;
        }
        catch(err) {
            _tituloValido = false;
            return err.toString();
        }
    }


    String? validarTexto(String? texto){
        try{
            _svc.validarTexto(texto);
            _textoValido = true;
            return null;
        }
        catch(err) {
            _textoValido = false;
            return err.toString();
        }
    }
}