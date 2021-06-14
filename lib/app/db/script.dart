
final createAnotacao = """
CREATE TABLE ANOTACAO(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    TITULO VARCHAR(40) NOT NULL
    TEXTO VARCHAR(1000),
  	
  	DT_CRIACAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
""";

final createImagem = """"
CREATE TABLE IMAGEM(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_ANOTACAO INTEGER NOT NULL,

    URL VARCHAR(250) NOT NULL,

    CONSTRAINT FK_IMAGEM_ANOTACAO FOREIGN KEY (ID_ANOTACAO) REFERENCES ANOTACAO(ID)
);
""";


final insert1 = """
INSERT INTO ANOTACAO(TEXTO)
VALUES ('Descrição da anotação número 1');

INSERT INTO IMAGEM (ID_ANOTACAO, URL)
VALUES(1, 'https://media.istockphoto.com/photos/abstract-orange-background-picture-id679762938');
""";

final insert2 = """
INSERT INTO ANOTACAO(TEXTO)
VALUES ('Descição da anotação número 2');

INSERT INTO IMAGEM (ID_ANOTACAO, URL)
VALUES(2, 'https://media.istockphoto.com/photos/abstract-orange-background-picture-id679762938');
""";