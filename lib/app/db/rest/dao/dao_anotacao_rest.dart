import 'package:dio/dio.dart';
import 'package:text_editor/app/domain/entities/anotacao.dart';
import 'package:text_editor/app/domain/interfaces/dao_anotacao.dart';

class DaoAnotacaoRest extends DaoAnotacao {
    final _dio = Dio(BaseOptions(
        baseUrl: 'http://10.0.0.104:8080',
        connectTimeout: 5000,
        receiveTimeout: 5000,
        sendTimeout: 5000,
    ));

    Future<List<Anotacao>> buscar() async {
        Response res = await _dio.get("/anotacoes");

        var lista;

        lista = res.data.map<Anotacao>(
            (anotacao) => Anotacao(
                id: anotacao['id'],
                titulo: anotacao['titulo'],
                texto: anotacao['texto'],
                dtModificacao: anotacao['dtModificacao'],
            ),
        );
        return lista.toList();
    }

    dropTable() async {
        var res = await buscar();

        res.forEach((anotacao) => remover(anotacao.id));
    }

    @override
    remover(id) async {
        await _dio.delete("/anotacoes/$id");
    }

    @override
    salvar(Anotacao anotacao) async {
        await _dio.post("/anotacoes/post", data: Anotacao.toJson(anotacao));
    }
}