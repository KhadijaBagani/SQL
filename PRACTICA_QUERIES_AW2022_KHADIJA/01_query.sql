
--01- ¿Cuántos empleados de la tabla HumanResources.Employee tienen más de 17 años trabajando en la empresa? 
USE AdventureWorks2022
SELECT COUNT(*) NºEmpleados FROM HumanResources.Employee
WHERE DATEDIFF(YEAR,HireDate, GETDATE()) > 17