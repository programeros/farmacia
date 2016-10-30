/**
 * Author:  willian.carvalho
 * Created: 29/10/2016
 */

CREATE TABLE USUARIOS (
    CODIGO INT  NOT NULL GENERATED ALWAYS AS IDENTITY
          (START WITH 1, INCREMENT BY 1) CONSTRAINT PK_USUARIO PRIMARY KEY,
    LOGIN VARCHAR(20) NOT NULL,
    NOME VARCHAR(50),
    SENHA VARCHAR(10)
);

CREATE TABLE CATEGORIAS (
    CODIGO INT  NOT NULL GENERATED ALWAYS AS IDENTITY
          (START WITH 1, INCREMENT BY 1) CONSTRAINT PK_CATEGORIA PRIMARY KEY,
    DESCRICAO VARCHAR(3) NOT NULL
);

CREATE TABLE CONVENIOS (
  CODIGO INT  NOT NULL GENERATED ALWAYS AS IDENTITY
          (START WITH 1, INCREMENT BY 1) CONSTRAINT PK_CONVENIO PRIMARY KEY,
  NOME VARCHAR(30) NOT NULL,
  TELEFONE VARCHAR(11),
  RESPONSAVEL VARCHAR(25),
  EMAIL VARCHAR(50),
  ATIVO VARCHAR(1),
  DELETADO VARCHAR(1)
);

CREATE TABLE CLIENTES (
  CODIGO INT  NOT NULL GENERATED ALWAYS AS IDENTITY
          (START WITH 1, INCREMENT BY 1) CONSTRAINT PK_CLIENTE PRIMARY KEY,
  NOME VARCHAR(30) NOT NULL,
  ENDERECO VARCHAR(30),
  BAIRRO VARCHAR(25),
  CIDADE VARCHAR(20),
  ESTADO VARCHAR(2),
  CEP VARCHAR(8),
  SEXO VARCHAR(1),
  TELEFONE VARCHAR(11),
  CELULAR VARCHAR(11),
  CADASTRO DATE,
  CONVENIOS_CODIGO INT NOT NULL,
  ATIVO VARCHAR(1),
  DELETADO VARCHAR(1),
  CONSTRAINT FK_CLIENTES_CONVENIOS_CODIGO FOREIGN KEY(CONVENIOS_CODIGO) REFERENCES CONVENIOS(CODIGO)
);

CREATE TABLE UNIDADES(
  CODIGO INT NOT NULL GENERATED ALWAYS AS IDENTITY
          (START WITH 1, INCREMENT BY 1) CONSTRAINT PK_UNIDADE PRIMARY KEY,
  NOME VARCHAR(30),
  ENDERECO VARCHAR(30),
  BAIRRO VARCHAR(20),
  CIDADE VARCHAR(25),
  ESTADO VARCHAR(2),
  CEP VARCHAR(8),
  TELEFONE VARCHAR(11),
  EMAIL VARCHAR(30),
  ATIVO VARCHAR(1),
  DELETADO VARCHAR(1)
);

CREATE TABLE FORNECEDORES (
  CODIGO INT  NOT NULL GENERATED ALWAYS AS IDENTITY
          (START WITH 1, INCREMENT BY 1) CONSTRAINT PK_FORNECEDOR PRIMARY KEY,
  NOME VARCHAR(30) NOT NULL,
  ENDERECO VARCHAR(30),
  BAIRRO VARCHAR(25),
  CIDADE VARCHAR(20),
  ESTADO VARCHAR(2),
  CEP VARCHAR(8),
  TELEFONE VARCHAR(11),
  CELULAR VARCHAR(11),
  CADASTRO DATE,
  ATIVO VARCHAR(1),
  DELETADO VARCHAR(1)
);

CREATE TABLE UNIDADE_MEDIDAS (
    CODIGO INT  NOT NULL GENERATED ALWAYS AS IDENTITY
          (START WITH 1, INCREMENT BY 1) CONSTRAINT PK_UNIDADEMEDIDA PRIMARY KEY,
    DESCRICAO VARCHAR(20) NOT NULL
);

CREATE TABLE VENDEDORES (
  CODIGO INT  NOT NULL GENERATED ALWAYS AS IDENTITY
          (START WITH 1, INCREMENT BY 1) CONSTRAINT PK_VENDEDOR PRIMARY KEY,
  NOME VARCHAR(30) NOT NULL,
  ENDERECO VARCHAR(30),
  BAIRRO VARCHAR(25),
  CIDADE VARCHAR(20),
  ESTADO VARCHAR(2),
  CEP VARCHAR(8),
  TELEFONE VARCHAR(11),
  CELULAR VARCHAR(11),
  CADASTRO DATE,
  ATIVO VARCHAR(1),
  DELETADO VARCHAR(1)
);

CREATE TABLE ALMOXARIFADOS (
  CODIGO INT  NOT NULL GENERATED ALWAYS AS IDENTITY
          CONSTRAINT PK_ALMOXARIFADO PRIMARY KEY,
  DESCRICAO VARCHAR(30) NOT NULL,
  UNIDADES_CODIGO INT,
  CONSTRAINT FK_ALMOXARIFADOS_UNIDADES_CODIGO FOREIGN KEY(UNIDADES_CODIGO) REFERENCES UNIDADES(CODIGO)
);

CREATE TABLE PRODUTOS(
  CODIGO VARCHAR(10) NOT NULL 
          CONSTRAINT PK_PRODUTO PRIMARY KEY,
  DESCRICAO VARCHAR(30) NOT NULL,
  PRECO FLOAT,
  MARCA VARCHAR(15),
  CATEGORIAS_CODIGO INT,
  FORNECEDORES_CODIGO INT,
  UNIDADES_CODIGO INT,
  CONSTRAINT FK_PRODUTOS_CATEGORIAS_CODIGO FOREIGN KEY(CATEGORIAS_CODIGO) REFERENCES CATEGORIAS(CODIGO),
  CONSTRAINT FK_PRODUTOS_FORNECEDORES_CODIGO FOREIGN KEY(FORNECEDORES_CODIGO) REFERENCES FORNECEDORES(CODIGO),
  CONSTRAINT FK_PRODUTOS_UNIDADES_CODIGO FOREIGN KEY(UNIDADES_CODIGO) REFERENCES UNIDADES(CODIGO)
);

CREATE TABLE SALDOESTOQUES (
  CODIGO_PRODUTO VARCHAR(10),
  CODIGO_ALMOXARIFADO INT,
  QUANTIDADE FLOAT,
  CONSTRAINT FK_SALDOESTOQUES_PRODUTOS_CODIGO FOREIGN KEY(CODIGO_PRODUTO) REFERENCES PRODUTOS(CODIGO),
  CONSTRAINT FK_SALDOESTOQUES_ALMOXARIFADOS_CODIGO FOREIGN KEY(CODIGO_ALMOXARIFADO) REFERENCES ALMOXARIFADOS(CODIGO)
);

CREATE TABLE MOVIMENTOS (
  CODIGO INT  NOT NULL GENERATED ALWAYS AS IDENTITY
          CONSTRAINT PK_MOVIMENTO PRIMARY KEY,
  DATA DATE,
  PRODUTO VARCHAR(10),
  ALMOXARIFADO_ORIGEM INT,
  ALMOXARIFADO_DESTINO INT,
  QUANTIDADE FLOAT,
  CONSTRAINT FK_MOVIMENTOS_PRODUTOS FOREIGN KEY(PRODUTO) REFERENCES PRODUTOS(CODIGO),
  CONSTRAINT FK_MOVIMENTOS_ALMOXARIFADO_ORIGEM FOREIGN KEY(ALMOXARIFADO_ORIGEM) REFERENCES ALMOXARIFADOS(CODIGO),
  CONSTRAINT FK_MOVIMENTOS_ALMOXARIFADO_DESTINO FOREIGN KEY(ALMOXARIFADO_DESTINO) REFERENCES ALMOXARIFADOS(CODIGO)
);

CREATE TABLE VENDAS (
  CODIGO INT  NOT NULL GENERATED ALWAYS AS IDENTITY
          CONSTRAINT PK_VENDA PRIMARY KEY,
  DATA DATE,
  CLIENTE_CODIGO INT,
  VENDEDOR_CODIGO INT,
  PRODUTO VARCHAR(10),
  ALMOXARIFADO INT,
  QUANTIDADE FLOAT,
  CONSTRAINT FK_VENDAS_CLIENTE_CODIGO FOREIGN KEY(CLIENTE_CODIGO) REFERENCES CLIENTES(CODIGO),
  CONSTRAINT FK_VENDAS_VENDEDOR_CODIGO FOREIGN KEY(VENDEDOR_CODIGO) REFERENCES VENDEDORES(CODIGO),
  CONSTRAINT FK_VENDAS_PRODUTO FOREIGN KEY(PRODUTO) REFERENCES PRODUTOS(CODIGO),
  CONSTRAINT FK_VENDAS_ALMOXARIFADO FOREIGN KEY(ALMOXARIFADO) REFERENCES ALMOXARIFADOS(CODIGO)
);


CREATE TABLE COMPRAS (
  CODIGO INT  NOT NULL GENERATED ALWAYS AS IDENTITY
          CONSTRAINT PK_COMPRA PRIMARY KEY,
  DATA DATE,
  FORNECEDOR_CODIGO INT,
  PRODUTO VARCHAR(10),
  ALMOXARIFADO INT,
  QUANTIDADE FLOAT,
  CONSTRAINT FK_COMPRAS_FORNECEDOR_CODIGO FOREIGN KEY(FORNECEDOR_CODIGO) REFERENCES FORNECEDORES(CODIGO),
  CONSTRAINT FK_COMPRAS_PRODUTO FOREIGN KEY(PRODUTO) REFERENCES PRODUTOS(CODIGO),
  CONSTRAINT FK_COMPRAS_ALMOXARIFADO FOREIGN KEY(ALMOXARIFADO) REFERENCES ALMOXARIFADOS(CODIGO)
);
