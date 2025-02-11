

CREATE DATABASE farmacia;


CREATE TABLE clientes(

    id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF_CNPJ VARCHAR(25),
    TIPO_DE_CLIENTE ENUM('PessoaFisica', 'PessoaJuridica'),
    UNIQUE (CPF_CNPJ, TIPO_DE_CLIENTE )
    
);

INSERT INTO clientes (Nome, CPF_CNPJ, TIPO_DE_CLIENTE) VALUES ('João Silva', '123.456.789-00', 'PessoaFisica');

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo ENUM('admin', 'vendedor') NOT NULL
);

INSERT INTO usuarios (nome, email, senha, tipo) VALUES ('Admin', 'admin@email.com', SHA2('senha123', 256), 'admin');




CREATE TABLE fornecedor(

    id INT PRIMARY KEY AUTO_INCREMENT,
    Nome_fornecedor VARCHAR(255),
    contato VARCHAR(255)
);


INSERT INTO fornecedor (Nome_fornecedor, contato) VALUES ('Farmácia Central', '(11) 99999-9999');



CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nome_produto VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    tipo_produto ENUM('cosmetico', 'higiene', 'remedio') NOT NULL,
    fornecedor_id INT NOT NULL,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id)
);

INSERT INTO produtos (Nome_produto, preco, quantidade_estoque, tipo_produto, fornecedor_id) VALUES ('Paracetamol', 10.50, 50, 'remedio', 1);



CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cliente_id INT, 
    total DECIMAL(10,2) NOT NULL,
    forma_pagamento ENUM('dinheiro', 'cartão', 'pix', 'outro') NOT NULL,
    observacao TEXT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)

);


INSERT INTO vendas (cliente_id, total, forma_pagamento, observacao) VALUES (1, 150.75, 'pix', 'Pagamento realizado via Pix, entrega agendada');



CREATE TABLE itens_venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (venda_id) REFERENCES vendas(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES (1, 1, 2, 10.50);

SELECT * FROM produtos WHERE id = 1;


CREATE TABLE pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    forma_pagamento ENUM('dinheiro', 'cartão', 'pix', 'outro') NOT NULL,
    FOREIGN KEY (venda_id) REFERENCES vendas(id)
);

CREATE TABLE enderecos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(255),
    numero VARCHAR(10),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    cep VARCHAR(20),
    cliente_id INT,
    fornecedor_id INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id)
);

CREATE TABLE logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    acao TEXT NOT NULL,
    data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);


CREATE TRIGGER atualizar_estoque
AFTER INSERT ON itens_venda
FOR EACH ROW
UPDATE produtos 
SET quantidade_estoque = quantidade_estoque - NEW.quantidade
WHERE id = NEW.produto_id;

--consultar o banco de dados--

SELECT v.id, c.Nome, v.total, v.forma_pagamento, v.status 
FROM vendas v 
JOIN clientes c ON v.cliente_id = c.id;


--Verificar os Produtos no Estoque---

SELECT Nome_produto, quantidade_estoque FROM produtos;

--SELECT * FROM pagamentos;--

SELECT * FROM pagamentos;

--Verificar os Logs do Sistema--

SELECT * FROM logs;


