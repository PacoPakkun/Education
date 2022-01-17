USE [LIQUOR STORE]

-- dirty reads

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRAN
SELECT * FROM Clienti
WAITFOR DELAY '00:00:15'
SELECT * FROM Clienti
COMMIT TRAN

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRAN
SELECT * FROM Clienti
WAITFOR DELAY '00:00:15'
SELECT * FROM Clienti
COMMIT TRAN

SELECT * FROM Clienti

-- nonrepeatable reads

UPDATE Clienti SET
nr_telefon=555555555 WHERE id = 257
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRAN
SELECT * FROM Clienti
WAITFOR DELAY '00:00:15'
SELECT * FROM Clienti
COMMIT TRAN

UPDATE Clienti SET
nr_telefon=555555555 WHERE id = 257
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
SELECT * FROM Clienti
WAITFOR DELAY '00:00:15'
SELECT * FROM Clienti
COMMIT TRAN

-- phantom reads

DELETE FROM Clienti WHERE id=265
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
SELECT * FROM Clienti
WAITFOR DELAY '00:00:15'
SELECT * FROM Clienti
COMMIT TRAN

DELETE FROM Clienti WHERE id=265
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
SELECT * FROM Clienti
WAITFOR DELAY '00:00:15'
SELECT * FROM Clienti
COMMIT TRAN

-- deadlock

--SET DEADLOCK_PRIORITY low
begin tran
update Furnizori set nume='Bolt' where id=4
waitfor delay '00:00:10'
update Clienti set prenume='Daniel' where id=264
commit tran

select * from Clienti
select * from Furnizori