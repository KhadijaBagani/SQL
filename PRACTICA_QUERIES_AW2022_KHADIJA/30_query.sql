--30-¿Qué categoría de produtos ([Production].[ProductCategory]) tiene una subcategoría ([Production].[ProductSubcategory]) que supone el 0,79% del total de productos ([Production].[Product] ?
USE AdventureWorks2022
SELECT PPC.Name, Count(PP.ProductID) AS ProductosTotales, (COUNT(PP.ProductID) * 100.0 / (SELECT COUNT(*) FROM [Production].[Product])) AS Porcentaje 
FROM Production.Product PP
INNER JOIN Production.ProductSubcategory PPS
ON PPS.ProductSubcategoryID = PP.ProductSubcategoryID
INNER JOIN Production.ProductCategory  PPC
ON PPS.ProductCategoryID = PPC.ProductCategoryID
GROUP BY PPC.Name
HAVING (COUNT(PP.ProductID) * 100.0 / (SELECT COUNT(*) FROM [Production].[Product])) = 0.79
