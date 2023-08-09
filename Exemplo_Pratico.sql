CREATE DATABASE Exemplo_Pratico 

USE Exemplo_Pratico

-- Tabela de Alunos
CREATE TABLE Alunos (
    IdAluno INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(50) NOT NULL,
    Idade INT NOT NULL
);

-- Tabela de Vendas
CREATE TABLE Vendas (
    IdVenda INT PRIMARY KEY IDENTITY,
    Valor_Venda DECIMAL(10, 2) NOT NULL,
    Data_Venda DATE NOT NULL
);

-- Tabela de Notas
CREATE TABLE Notas (
    IdNota INT PRIMARY KEY IDENTITY,
    IdAluno INT FOREIGN KEY REFERENCES Alunos(IdAluno) NOT NULL,
    Nota DECIMAL(5, 2) NOT NULL,
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    IdProdutos INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    IdCliente INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(100) NOT NULL
);

-- Tabela de Funcionários
CREATE TABLE Funcionarios (
    IdFuncionario INT PRIMARY KEY IDENTITY,
    Primeiro_Nome VARCHAR(50)NOT NULL,
    Ultimo_Nome VARCHAR(50) NOT NULL
);


-- Inserindo dados na tabela de Alunos
INSERT INTO Alunos (Nome, Idade) 
VALUES
    ('João', 20),
    ('Maria', 22),
    ('Carlos', 19);

-- Inserindo dados na tabela de Vendas
INSERT INTO Vendas (Valor_Venda, Data_Venda) 
VALUES
    (100.00, '2023-08-01'),
    (150.50, '2023-08-02'),
    (200.75, '2023-08-03');

-- Inserindo dados na tabela de Notas
INSERT INTO Notas (IdAluno, Nota) 
VALUES
    (1, 8.5),
    (2, 9.0),
    (3, 7.8);

-- Inserindo dados na tabela de Produtos
INSERT INTO produtos (Nome, Preco) 
VALUES
    ('Camiseta', 25.99),
    ('Calça', 49.99),
    ('Tênis', 89.99);

-- Inserindo dados na tabela de Clientes
INSERT INTO clientes (Nome) 
VALUES
    ('Ana'),
    ('Paulo'),
    ('Julia');

-- Inserindo dados na tabela de Funcionários
INSERT INTO Funcionarios (Primeiro_Nome, Ultimo_Nome) 
VALUES
    ('Fernanda', 'Silva'),
    ('Rafael', 'Santos'),
    ('Carolina', 'Lima');



--COUNT() - Contar Registros:
--Suponha que você tenha uma tabela chamada Alunos e queira contar quantos alunos estão registrados:
SELECT COUNT(*) AS Total_Alunos FROM Alunos;

--SUM() - Soma dos Valores:
--Suponha que você tenha uma tabela chamada vendas e queira calcular o total das vendas realizadas:
SELECT SUM(Valor_Venda) AS Total_Vendas FROM Vendas;

--AVG() - Média dos Valores:
--Para calcular a média das notas dos alunos em uma tabela chamada notas:
SELECT AVG(Nota) AS Media_Notas FROM Notas;

--MAX() e MIN() - Valor Máximo e Mínimo:
--Para encontrar o preço máximo e mínimo dos produtos em uma tabela chamada produtos:
SELECT MAX(preco) AS preco_maximo, MIN(preco) AS preco_minimo FROM produtos;

--UPPER() e LOWER() - Conversão de Texto:
--Para obter os nomes dos clientes em letras maiúsculas da tabela clientes:
SELECT UPPER(nome) AS nome_maiusculo FROM clientes;

--CONCAT() - Concatenação de Strings:
--Para criar uma lista de nomes completos a partir das tabelas funcionarios com primeiro e último nome:
SELECT CONCAT(primeiro_nome, ' ', ultimo_nome) AS nome_completo FROM funcionarios;

--DATE_FORMAT() - Formatação de Datas:
--Para exibir as datas de vendas no formato "dd/mm/aaaa" a partir da tabela vendas:
SELECT FORMAT(data_venda, 'dd/MM/yyyy') AS data_formatada FROM vendas;

-- LENGTH() - Tamanho de Strings:
-- Para obter o tamanho dos nomes dos produtos da tabela produtos:
SELECT Nome, LEN(Nome) AS Tamanho_Nome FROM Produtos;

-- SUBSTRING() - Substring de Strings:
-- Para extrair parte do nome de um cliente da tabela clientes:
SELECT Nome, SUBSTRING(Nome, 1, 3) AS Nome_Reduzido FROM Clientes;

-- COALESCE() - Tratamento de Valores Nulos:
-- Para exibir o nome do aluno e sua idade, tratando valores nulos na idade:
SELECT Nome, COALESCE(Idade, 'Idade não disponível') AS Idade FROM Alunos;

-- LEFT() e RIGHT() - Partes da String:
-- Para obter os primeiros e últimos caracteres do nome do funcionário:
SELECT Primeiro_Nome, LEFT(Primeiro_Nome, 1) AS Primeira_Letra, RIGHT(Ultimo_Nome, 3) AS Ultimas_Tres_Letras FROM Funcionarios;

-- DATEADD() - Adição de Intervalos de Tempo:
-- Para adicionar 7 dias à data de venda da tabela vendas:
SELECT Data_Venda, DATEADD(day, 7, Data_Venda) AS Data_Venda_Modificada FROM Vendas;

-- DATEDIFF() - Diferença entre Datas:
-- Para calcular a diferença em dias entre duas datas da tabela vendas:
SELECT Data_Venda, DATEDIFF(day, Data_Venda, GETDATE()) AS Dias_Passados FROM Vendas;

-- GROUP BY e HAVING - Agrupamento e Filtros em Grupos:
-- Para calcular a média das notas dos alunos por idade, apenas para idades maiores que 20:
SELECT Idade, AVG(Nota) AS Media_Notas FROM Alunos
JOIN Notas ON Alunos.IdAluno = Notas.IdAluno
GROUP BY Idade
HAVING Idade > 20;


