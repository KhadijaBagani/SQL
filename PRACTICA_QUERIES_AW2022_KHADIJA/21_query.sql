--21-Para los pedidos (Sales.SalesOrderHeader) realizados después del 1 de enero de 2012 (OrderDate) 
--¿Qué número de cliente (CustomerID) tiene una suma de las ventas (TotalDue) en el rango 19 000 y 19 500?
USE AdventureWorks2022
SELECT CustomerID FROM Sales.SalesOrderHeader
WHERE OrderDate > '2012-01-01'
GROUP BY CustomerID
HAVING SUM(TotalDue) BETWEEN 19000 AND 19500;