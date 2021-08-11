import 'package:cloud_firestore/cloud_firestore.dart';

class Anotacao{
    dynamic id;

    String? titulo;
    String? texto;
    String? dtModificacao;

    Anotacao({this.id, this.titulo, this.texto, this.dtModificacao});
}