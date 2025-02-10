

CREATE DATABASE farmacia;


CREATE TABLE clientes(

    id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF_CNPJ VARCHAR(25),
    TIPO_DE_CLIENTE ENUM('PessoaFisica', 'PessoaJuridica'),
    UNIQUE (CPF_CNPJ, TIPO_DE_CLIENTE )
    
);


-- INSERT INTO clientes (Nome, CPF_CNPJ, TIPO_DE_CLIENTE) VALUES ('thomasturbando','567.202.150-60','PessoaFisica');--


CREATE TABLE fornecedor(

    id INT PRIMARY KEY AUTO_INCREMENT,
    Nome_fornecedor VARCHAR(255),
    contato VARCHAR(255)
);


--INSERT INTO fornecedor (Nome_fornecedor, contato) VALUES ('ANSONIC LABORATORIO ANALISES CLINICAS', '(93) 99139-9933');--


CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nome_produto VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    tipo_produto ENUM('cosmetico', 'higiene', 'remedio') NOT NULL,
    fornecedor_id INT NOT NULL,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id)
);

--INSERT INTO produtos (Nome_produto, preco, quantidade_estoque, tipo_produto, fornecedor_id) VALUES ('Shampoo Anticaspa', 25.90, 100, 'higiene', 1);--


CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cliente_id INT, 
    total DECIMAL(10,2) NOT NULL,
    forma_pagamento ENUM('dinheiro', 'cartão', 'pix', 'outro') NOT NULL,
    observacao TEXT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)

);


CREATE TABLE itens_venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (venda_id) REFERENCES vendas(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);


