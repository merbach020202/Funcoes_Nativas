--DDL CRIAR TABELAS E BANCO DE DADOS

--CRIAR BANCO 
CREATE DATABASE DataHora

--USAR BANCO
USE DataHora

--CRIAR TABELAS

--Manipula��o de Datas e Horas


CREATE TABLE Eventos (
    IdEvento INT PRIMARY KEY IDENTITY,
    Nome TEXT NOT NULL,
    DataEvento DATE NOT NULL,
    HoraEvento TIME NOT NULL
);