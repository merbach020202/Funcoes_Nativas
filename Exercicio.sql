--Exerc�cio: Sistema de Gerenciamento de Alunos

--Suponha que voc� esteja desenvolvendo um sistema de gerenciamento de alunos para uma escola. Voc� foi encarregado de criar um banco de dados para armazenar informa��es sobre alunos, cursos e notas. Vamos criar as tabelas, inserir alguns dados e realizar algumas consultas.

--Crie as tabelas:

--a. Tabela de Alunos:

--IdAluno (Chave Prim�ria)
--Nome (Texto)
--Idade (N�mero Inteiro)

--b. Tabela de Cursos:

--IdCurso (Chave Prim�ria)
--NomeCurso (Texto)

--c. Tabela de Notas:

--IdNota (Chave Prim�ria)
--IdAluno (Chave Estrangeira referenciando a tabela de Alunos)
--IdCurso (Chave Estrangeira referenciando a tabela de Cursos)
--Nota (N�mero Decimal)

--Insira alguns dados nas tabelas:

--Insira informa��es de alunos em Alunos.
--Insira informa��es de cursos em Cursos.
--Insira notas de alunos em Notas, relacionando-os com alunos e cursos existentes.
--Realize as seguintes consultas:

--a. Liste o nome e a idade de todos os alunos.

--b. Liste os cursos dispon�veis.

--c. Liste o nome do aluno, o nome do curso e a nota para todos os alunos e cursos.

--d. Calcule a m�dia das notas de todos os alunos em cada curso.

--e. Liste o nome do aluno e o nome do curso em que eles obtiveram a nota mais alta.

-- Tabela de Alunos
CREATE TABLE Alunos (
    IdAluno INT PRIMARY KEY,
    Nome VARCHAR(50),
    Idade INT
);

-- Tabela de Cursos
CREATE TABLE Cursos (
    IdCurso INT PRIMARY KEY,
    NomeCurso VARCHAR(50)
);

-- Tabela de Notas
CREATE TABLE Notas (
    IdNota INT PRIMARY KEY,
    IdAluno INT,
    IdCurso INT,
    Nota DECIMAL(5, 2),
    FOREIGN KEY (IdAluno) REFERENCES Alunos(IdAluno),
    FOREIGN KEY (IdCurso) REFERENCES Cursos(IdCurso)
);


-- Inserir dados na tabela Alunos
INSERT INTO Alunos (IdAluno, Nome, Idade) VALUES
    (1, 'Jo�o', 20),
    (2, 'Maria', 22),
    (3, 'Carlos', 19);

-- Inserir dados na tabela Cursos
INSERT INTO Cursos (IdCurso, NomeCurso) VALUES
    (1, 'Matem�tica'),
    (2, 'Hist�ria'),
    (3, 'Ci�ncias');

-- Inserir dados na tabela Notas
INSERT INTO Notas (IdNota, IdAluno, IdCurso, Nota) VALUES
    (1, 1, 1, 8.5),
    (2, 1, 2, 9.0),
    (3, 2, 1, 7.8),
    (4, 2, 3, 8.2),
    (5, 3, 2, 6.5);


-- a. Listar nome e idade de todos os alunos
SELECT Nome, Idade FROM Alunos;

-- b. Listar cursos dispon�veis
SELECT NomeCurso FROM Cursos;

-- c. Listar nome do aluno, nome do curso e nota
SELECT Alunos.Nome, Cursos.NomeCurso, Notas.Nota
FROM Alunos
JOIN Notas ON Alunos.IdAluno = Notas.IdAluno
JOIN Cursos ON Notas.IdCurso = Cursos.IdCurso;

-- d. Calcular a m�dia das notas de todos os alunos em cada curso
SELECT Alunos.Nome, Cursos.NomeCurso, AVG(Notas.Nota) AS MediaNota
FROM Alunos
JOIN Notas ON Alunos.IdAluno = Notas.IdAluno
JOIN Cursos ON Notas.IdCurso = Cursos.IdCurso
GROUP BY Alunos.Nome, Cursos.NomeCurso;

-- e. Listar nome do aluno e nome do curso da nota mais alta
SELECT Alunos.Nome, Cursos.NomeCurso, MAX(Notas.Nota) AS MaiorNota
FROM Alunos
JOIN Notas ON Alunos.IdAluno = Notas.IdAluno
JOIN Cursos ON Notas.IdCurso = Cursos.IdCurso
GROUP BY Alunos.Nome, Cursos.NomeCurso;
