import 'package:sqflite/sqflite.dart';

import 'package:text_editor/app/db/sqlite/connection.dart';
import 'package:text_editor/app/domain/entities/anotacao.dart';
import 'package:text_editor/app/domain/interfaces/dao_anotacao.dart';

class DaoAnotacaoImpl implements DaoAnotacao{

    @override
    Future<List<Anotacao>> buscar() async {
        Database db = await Connection.get();

        // faz uma query e retorna os dados da lista
        List<Map<String, dynamic>> res = await db.query('ANOTACAO');

        // converte para uma lista de anotacoes
        List<Anotacao> lista = List.generate(res.length, (index) {
            var anotacao = res[index];

            return Anotacao(
                anotacao['ID'], 
                anotacao['TITULO'], 
                anotacao['TEXTO'], 
                anotacao['DT_CRIACAO'], 
                anotacao['DT_MODIFICACAO']
            );
        });

        return lista;
    }


    @override
    remover(int id) async{
        Database db = await Connection.get();
        var sql = 'DELETE FROM ANOTACAO WHERE ID == ?';

        db.rawDelete(sql);
    }


    @override
    salvar(Anotacao anotacao) async{
        Database db = await Connection.get();

        // comparacoes com null nao funcionam do mesmo jeito mais
        // pois uma variavel nao pode ser nula
        // logo o valor para indicar que o registro nao existe
        // sera -1
        if (anotacao.id == -1){
            var sql = 'INSERT INTO ANOTACAO(TITULO, TEXTO) VALUES(?, ?)';
            db.rawInsert(sql, [anotacao.titulo, anotacao.texto]);
        }
        else{
            var sql = 'UPDATE ANOTACAO SET TITULO=?, TEXTO=?, SET DT_MODIFICACAO=CURRENT_TIMESTAMP';
            db.rawUpdate(sql, [anotacao.titulo, anotacao.texto]);
        }
    }
}