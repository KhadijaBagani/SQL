
--1. Detecta todas las tablas de la vista que no cumplen la 1NF y devuelve sus nombres como una lista ordenada alfab�ticamente. 
--Usa los nombres tal y como aparecen en la siguiente query. Indica adem�s las que crees que resulta debatible si est�n en una categor�a u otra.


SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME IN ('Person','Store', 'SalesPerson', 'Employee', 'EmployeeDepartmentHistory', 'JobCandidate')




