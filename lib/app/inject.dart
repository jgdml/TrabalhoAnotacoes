import 'package:get_it/get_it.dart';
import 'package:text_editor/app/db/firestore/dao/dao_anotacao_fire.dart';
import 'package:text_editor/app/domain/interfaces/dao_anotacao.dart';
import 'package:text_editor/app/domain/services/anotacao_service.dart';

setupInject() async {
    GetIt getIt = GetIt.I;

    getIt.registerSingleton<DaoAnotacao>(DaoAnotacaoFire());
    getIt.registerSingleton<AnotacaoService>(AnotacaoService());
}