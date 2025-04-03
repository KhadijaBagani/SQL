USE recetas_para_probar;

SELECT temporadas.temporada_nombre AS temporada, COUNT(ingredientes.ingrediente_PK) AS 'Número Ingredientes'
FROM ingredientes 
JOIN temporadas 
ON  ingredientes.temporada_FK = temporadas.temporada_PK
GROUP BY temporadas.temporada_nombre
