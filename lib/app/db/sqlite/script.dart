final createAnotacao = """
CREATE TABLE ANOTACAO(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    TITULO VARCHAR(40) NOT NULL,
    TEXTO VARCHAR(1000),
  	
  	DT_CRIACAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DT_MODIFICACAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
""";



final insertsTeste = """
INSERT INTO ANOTACAO(TITULO, TEXTO) VALUES 
('Titulo 1', 'Descrição da anotação número 1'), 
('Titulo 2', 'Descição da anotação número 2'),
('Titulo 3', 'Descrição da anotação número 3'), 
('Titulo 4', 'Descição da anotação número 4');
""";

