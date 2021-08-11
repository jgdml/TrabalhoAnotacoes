import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:text_editor/app/domain/entities/anotacao.dart';
import 'package:text_editor/app/domain/interfaces/dao_anotacao.dart';

class DaoAnotacaoFire extends DaoAnotacao{

    late CollectionReference anotacaoCollection;

    DaoAnotacaoFire(){
        anotacaoCollection = FirebaseFirestore.instance.collection('anotacao');
    }

    @override
    Future<List<Anotacao>> buscar() async {
        var res = await anotacaoCollection.get();

        var lista = res.docs.map(
            (doc) => Anotacao(
                id: doc.reference.id.toString(),
                titulo: doc['titulo'],
                texto: (doc['texto'] ?? ''),
                dtModificacao: doc['dtModificacao']
            )
        );
        return lista.toList();
    }

    @override
    remover(id) async {
        await anotacaoCollection.doc(id).delete();
    }

    @override
    salvar(Anotacao anotacao) async {
        await anotacaoCollection.doc(anotacao.id).set({
            'titulo': anotacao.titulo,
            'texto': anotacao.texto,
            'dtModificacao': FieldValue.serverTimestamp()
        });
    }
}