
--1. Detecta todas las tablas de la vista que no cumplen la 1NF y devuelve sus nombres como una lista ordenada alfabéticamente. 
--Usa los nombres tal y como aparecen en la siguiente query. Indica además las que crees que resulta debatible si están en una categoría u otra.


SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME IN ('Person','Store', 'SalesPerson', 'Employee', 'EmployeeDepartmentHistory', 'JobCandidate')




