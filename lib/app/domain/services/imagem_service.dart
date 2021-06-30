import 'package:get_it/get_it.dart';

import 'package:text_editor/app/domain/entities/imagem.dart';
import 'package:text_editor/app/domain/exceptions/domain_exception.dart';
import 'package:text_editor/app/domain/interfaces/dao_imagem.dart';

class ImagemService{
    var _dao = GetIt.I.get<DaoImagem>();

    salvar(Imagem img){
        validarImagem(img);
        _dao.salvar(img);
    }
    
    remover(int id){
        _dao.remover(id);
    }

    Future<List<Imagem>> buscar(){
        return _dao.buscar();
    }


    
    validarImagem(Imagem img){
        // caso a imagem nao tiver anotacao
        if (img.idAnotacao == null){
            throw new DomainException("Uma Imagem precisa pertencer a uma Anotação");
        }
        // caso a imagem nao tiver url
        else if(img.url == null){
            throw new DomainException("A Imagem deve possuir url");
        }
    }
}