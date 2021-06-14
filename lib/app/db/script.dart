final createTables = """
CREATE TABLE ANOTACAO(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    TITULO VARCHAR(40) NOT NULL,
    TEXTO VARCHAR(1000),
  	
  	DT_CRIACAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DT_MODIFICACAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IMAGEM(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_ANOTACAO INTEGER NOT NULL,

    URL VARCHAR(250) NOT NULL,

    CONSTRAINT FK_IMAGEM_ANOTACAO FOREIGN KEY (ID_ANOTACAO) REFERENCES ANOTACAO(ID)
);
""";



final insertsTeste = """
INSERT INTO ANOTACAO(TITULO, TEXTO) VALUES 
('Titulo 1', 'Descrição da anotação número 1'), 
('Titulo 2', 'Descição da anotação número 2');

INSERT INTO IMAGEM (ID_ANOTACAO, URL) VALUES
(1, 'https://media.istockphoto.com/photos/abstract-orange-background-picture-id679762938'),
(2, 'https://media.istockphoto.com/photos/abstract-orange-background-picture-id679762938');
""";

