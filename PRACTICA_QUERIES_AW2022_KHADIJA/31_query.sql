--31-Resume todos los registros de la tabla de empleados [HumanResources].[Employee] para saber cuántas personas de cada género (Gender) se contratan cada mes (HireDate) de forma que puedas aislar el mes en el que se han contratado menos mujeres para poder contestar a las pregunta: ¿En que mes se han contratado menos mujeres?
USE AdventureWorks2022
SELECT TOP 1 MONTH(HireDate) Mes, Gender, COUNT(*) TOTAL FROM HumanResources.Employee 
GROUP BY MONTH(HireDate), Gender
HAVING Gender = 'F'
ORDER BY Total