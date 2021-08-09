import 'package:sqflite/sqflite.dart';

import 'package:text_editor/app/db/sqlite/connection.dart';
import 'package:text_editor/app/domain/entities/anotacao.dart';
import 'package:text_editor/app/domain/interfaces/dao_anotacao.dart';

class DaoAnotacaoImpl implements DaoAnotacao{

    @override
    Future<List<Anotacao>> buscar() async {
        Database? db = await Connection.get();

        // faz uma query e retorna os dados da lista
        List<Map<String, dynamic>> res = await db!.query('ANOTACAO');

        // converte para uma lista de anotacoes
        List<Anotacao> lista = List.generate(res.length, (index) {
            var anotacao = res[index];

            return Anotacao(
                id: anotacao['ID'], 
                titulo: anotacao['TITULO'], 
                texto: anotacao['TEXTO'], 
                dtModificacao: anotacao['DT_MODIFICACAO']
            );
        });

        return lista;
    }


    @override
    remover(dynamic id) async{
        Database? db = await Connection.get();
        var sql = 'DELETE FROM ANOTACAO WHERE ID == ?';

        db!.rawDelete(sql, [id]);
    }


    @override
    salvar(Anotacao anotacao) async{
        Database? db = await Connection.get();

        if (anotacao.id == null){
            var sql = 'INSERT INTO ANOTACAO(TITULO, TEXTO) VALUES(?, ?)';
            db!.rawInsert(sql, [anotacao.titulo, anotacao.texto]);
        }
        else{
            var sql = 'UPDATE ANOTACAO SET TITULO=?, TEXTO=?, DT_MODIFICACAO=CURRENT_TIMESTAMP WHERE ID = ?';
            db!.rawUpdate(sql, [anotacao.titulo, anotacao.texto, anotacao.id]);
        }
    }
}