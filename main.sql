

CREATE DATABASE farmacia;


CREATE TABLE clientes(

    id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF_CNPJ VARCHAR(25),
    TIPO_DE_CLIENTE ENUM('PessoaFisica', 'PessoaJuridica'),
    UNIQUE (CPF_CNPJ, TIPO_DE_CLIENTE )
    
);

/*INSERT INTO clientes (Nome, CPF_CNPJ, TIPO_DE_CLIENTE) VALUES ('thomasturbando','567.202.150-60','PessoaFisica')*/

CREATE TABLE produtos(

    id INT PRIMARY KEY AUTO_INCREMENT,
    Nome_produto VARCHAR(255),
    preço VARCHAR(25),
    Tipo_de_produto('cosmetico', 'higiene', 'remedio'),
    UNIQUE(Tipo_de_produto)
);

INSERT INTO produtos(Nome_produto, Tipo_de_produto,)

