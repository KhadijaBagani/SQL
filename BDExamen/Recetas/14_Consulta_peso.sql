
USE recetas_para_probar

SELECT nombre_receta AS RECETA, SUM(cantidad_gramos) AS PESO
FROM recetas
JOIN ingredientes_recetas 
ON recetas.receta_PK = ingredientes_recetas.receta_FK
GROUP BY nombre_receta;