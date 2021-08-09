import 'package:text_editor/app/domain/entities/anotacao.dart';

abstract class DaoAnotacao{

    salvar(Anotacao anotacao);

    remover(dynamic id);

    Future<List<Anotacao>> buscar();
}