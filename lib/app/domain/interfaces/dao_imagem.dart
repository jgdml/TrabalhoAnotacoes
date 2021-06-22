import 'package:text_editor/app/domain/entities/imagem.dart';

abstract class DaoImagem{

    salvar(Imagem img);

    remover(int id);

    Future<List<Imagem>> buscar();
}