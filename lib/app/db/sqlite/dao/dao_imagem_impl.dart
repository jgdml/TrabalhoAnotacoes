import 'package:sqflite/sqflite.dart';

import '../connection.dart';
import 'package:text_editor/app/domain/entities/imagem.dart';
import 'package:text_editor/app/domain/interfaces/dao_imagem.dart';


class DaoImagemImpl implements DaoImagem{


    @override
    Future<List<Imagem>> buscar() async {
        Database db = await Connection.get();

        List<Map<String, dynamic>> res = await db.query('ANOTACAO');

        List<Imagem> imgs = List.generate(res.length, (index) {
            var img = res[index];
            
            return Imagem(
                img['ID'], 
                img['ID_ANOTACAO'], 
                img['URL']
            );
        });

        return imgs;
    }


    @override
    remover(int id) async {
        Database db = await Connection.get();
        var sql = 'DELETE FROM IMAGEM WHERE ID == ?';

        db.rawDelete(sql);
    }


    @override
    salvar(Imagem img) async {
        Database db = await Connection.get();

        if (img.id == -1){
            var sql = 'INSERT INTO IMAGEM(ID_ANOTACAO, URL) VALUES(?, ?)';
            db.rawInsert(sql, [img.idAnotacao, img.url]);
        }
        else{
            var sql = 'UPDATE IMAGEM SET URL=?';
            db.rawUpdate(sql, [img.url]);
        }
    }

}