

CREATE DATABASE farmacia;


CREATE TABLE clientes(

    id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(45) UNIQUE NOT NULL,
    senha VARCHAR(16)NOT NULL,
    DATA_DE_NACIMENTO DATE NOT NULL
);


CREATE TABLE rededios_sublingual(

    id INT AUTO_INCREMENT PRIMARY KEY,
    Nome_medicamneto VARCHAR(100),


);

CREATE TABLE rededios_Parenteral(

    id INT AUTO_INCREMENT PRIMARY KEY,
    Nome_medicamneto VARCHAR(100),

);

CREATE TABLE rededios_Cutânea(

    id INT AUTO_INCREMENT PRIMARY KEY,
    Nome_medicamneto VARCHAR(100)
);

CREATE TABLE rededios_Nasal(

    id INT AUTO_INCREMENT PRIMARY KEY,
    Nome_medicamneto VARCHAR(100)
);