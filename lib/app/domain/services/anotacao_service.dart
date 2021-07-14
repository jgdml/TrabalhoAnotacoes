import 'package:get_it/get_it.dart';

import 'package:text_editor/app/domain/entities/anotacao.dart';
import 'package:text_editor/app/domain/exceptions/domain_exception.dart';
import 'package:text_editor/app/domain/interfaces/dao_anotacao.dart';

class AnotacaoService{
    var _dao = GetIt.I.get<DaoAnotacao>();


    salvar(Anotacao anotacao){
        validarAnotacao(anotacao);
        _dao.salvar(anotacao);
    }

    // precisa remover as imagens da anotacao tambem
    remover(int id){
        return _dao.remover(id);
    }

    // precisa retornar a imagem relacionada tambem
    Future<List<Anotacao>> buscar(){
        return _dao.buscar();
    }


    validarAnotacao(Anotacao anotacao){
        // titulo nao pode ser vazio
        if (anotacao.titulo == ""){
            throw new DomainException("Título não pode ser vazio");
        }

        else if (anotacao.texto!.length > 1000){
            throw new DomainException("Texto deve ser menor que 1000 caracteres");
        }

        // precisa verificar se existe pelo menos um texto
        // ou uma imagem na anotacao
        // else if (anotacao.texto == null && ){

        // }
    }
}