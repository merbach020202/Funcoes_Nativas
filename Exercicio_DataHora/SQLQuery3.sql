--DQL
/*
--Selecionar eventos nos pr�ximos 7 dias
--Calcular a diferen�a em DIAS do pr�ximo evento
--Atualizar o nome de um evento espec�fico para " - Adiado"
*/
USE DataHora

SELECT *
FROM Eventos
WHERE DataEvento BETWEEN GETDATE() AND DATEADD(DAY,7, GETDATE())



SELECT 
    Nome,
    DATEDIFF(DAY, GETDATE(),DataEvento)AS Dias
FROM Eventos



UPDATE Eventos
SET nome = CONCAT( Nome,'- Adiado')
WHERE IdEvento = 1;

SELECT*FROM Eventos