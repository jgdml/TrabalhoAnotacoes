import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:text_editor/app/db/sqlite/script.dart';


class Connection{

    // variavel do banco
    // definida como late pois nao pode ser null
    static late Database _db;

    // informacoes do banco
    static String _dbName = 'db_anotacoes';
    static int _dbVersion = 1;

    static bool _dbIsOpen = false;

    // retorna a instancia do banco 
    // e cria uma caso nao exista
    static Future<Database> get() async{
    
        if (_dbIsOpen == false){
            _db = await _initDb();
        }
        return _db;
    }


    // instancia o banco
    static _initDb() async{
        String dbPath = join(await getDatabasesPath(), _dbName);

        return await openDatabase(
            dbPath, 
            version: _dbVersion, 
            onCreate: (db, ver) async{
                await db.execute(createAnotacao);
                await db.execute(createImagem);
                await db.execute(insertsTeste);
                _dbIsOpen = true;
            }
        );
    }
}