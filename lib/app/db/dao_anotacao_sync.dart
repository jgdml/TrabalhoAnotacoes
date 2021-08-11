import 'package:text_editor/app/db/firestore/dao/dao_anotacao_fire.dart';
import 'package:text_editor/app/db/sqlite/dao/dao_anotacao_impl.dart';
import 'package:text_editor/app/domain/entities/anotacao.dart';
import 'package:text_editor/app/domain/interfaces/dao_anotacao.dart';


class DaoAnotacaoSync implements DaoAnotacao{

    DaoAnotacaoImpl _daoSql = DaoAnotacaoImpl();
    DaoAnotacaoFire _daoFire = DaoAnotacaoFire();

    syncCloudDatabase() async {
        var localRes = await _daoSql.buscar();

        await _daoFire.dropCollection();  

        for (var anotacao in localRes){
            await _daoFire.salvar(anotacao);
        }
    }

    @override
    Future<List<Anotacao>> buscar() async{        
        return _daoSql.buscar();
    }

    @override
    remover(id) async {
        await _daoSql.remover(id);
        syncCloudDatabase();
    }

    @override
    salvar(Anotacao anotacao) async {
        await _daoSql.salvar(anotacao);
        syncCloudDatabase();
    }

}