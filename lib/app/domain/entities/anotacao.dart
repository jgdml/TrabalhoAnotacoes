class Anotacao {
    dynamic id;

    String? titulo;
    String? texto;
    String? dtModificacao;

    Anotacao({this.id, this.titulo, this.texto, this.dtModificacao});

    static Map<String, dynamic> toJson(Anotacao anotacao) {
        return {
            "id": anotacao.id,
            "titulo": anotacao.titulo,
            "texto": anotacao.texto,
            "dtModificacao": anotacao.dtModificacao,
        };
    }

    static Anotacao fromJson(Map<String, dynamic> json) {
        return Anotacao(
            id: json['id'],
            titulo: json['titulo'],
            texto: json['texto'],
            dtModificacao: json['dtModificacao'],
        );
    }
}
