

import 'package:get_it/get_it.dart';
import 'package:text_editor/app/db/sqlite/dao/dao_anotacao_impl.dart';
import 'package:text_editor/app/db/sqlite/dao/dao_imagem_impl.dart';
import 'package:text_editor/app/domain/interfaces/dao_anotacao.dart';
import 'package:text_editor/app/domain/interfaces/dao_imagem.dart';
import 'package:text_editor/app/domain/services/anotacao_service.dart';

setupInject(){
    GetIt getIt = GetIt.I;

    getIt.registerSingleton<DaoAnotacao>(DaoAnotacaoImpl());
    getIt.registerSingleton<DaoImagem>(DaoImagemImpl());

    getIt.registerSingleton<AnotacaoService>(AnotacaoService());
}