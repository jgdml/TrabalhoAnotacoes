import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:text_editor/app/domain/entities/anotacao.dart';

part 'create_back.g.dart';


class CreateBack = _CreateBack with _$CreateBack;

abstract class _CreateBack with Store{
    Anotacao? anotacao;

    _CreateBack(BuildContext context){
        var parametro = ModalRoute.of(context)!.settings.arguments;
        

        if (parametro != null){
            anotacao = parametro as Anotacao;
        }
    }
}