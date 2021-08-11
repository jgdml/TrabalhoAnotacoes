import 'package:get_it/get_it.dart';

import 'package:text_editor/app/domain/entities/anotacao.dart';
import 'package:text_editor/app/domain/exceptions/domain_exception.dart';
import 'package:text_editor/app/domain/interfaces/dao_anotacao.dart';

class AnotacaoService{
    var _dao = GetIt.I.get<DaoAnotacao>();


    salvar(Anotacao anotacao) async {
        validarTitulo(anotacao.titulo);
        validarTexto(anotacao.texto);
        await _dao.salvar(anotacao);
    }

    remover(dynamic id) async {
        await _dao.remover(id);
    }


    Future<List<Anotacao>> buscar(){
        return _dao.buscar();
    }


    validarTitulo(String? titulo){
        if (titulo == null || titulo == ""){
            throw new DomainException("Título não pode ser vazio");
        }
    }

    validarTexto(String? texto){
        if (texto!.length > 1000){
            throw new DomainException("Texto deve ser menor que 1000 caracteres");
        }
    }
}