import 'package:cloud_firestore/cloud_firestore.dart';

class Anotacao{
    dynamic id;

    String? titulo;
    String? texto;
    Timestamp? dtModificacao;

    Anotacao({this.id, this.titulo, this.texto, this.dtModificacao});
}