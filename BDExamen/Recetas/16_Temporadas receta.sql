USE recetas_para_probar;

SELECT temporadas.temporada_nombre AS Temporada
FROM recetas 
JOIN ingredientes_recetas
ON recetas.receta_PK = ingredientes_recetas.receta_FK
JOIN ingredientes  
ON ingredientes_recetas.ingrediente_FK = ingredientes.ingrediente_PK
JOIN temporadas 
ON ingredientes.temporada_FK = temporadas.temporada_PK
GROUP BY temporadas.temporada_nombre;