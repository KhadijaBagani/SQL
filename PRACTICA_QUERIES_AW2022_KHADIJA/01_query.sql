
--01- �Cu�ntos empleados de la tabla HumanResources.Employee tienen m�s de 17 a�os trabajando en la empresa? 
USE AdventureWorks2022
SELECT COUNT(*) N�Empleados FROM HumanResources.Employee
WHERE DATEDIFF(YEAR,HireDate, GETDATE()) > 17