
CREATE VIEW Rating_Videos AS

	SELECT Id,
	Titulo,
	CAST(ROUND(Total_Votos*0.5/Cantidad_Votos, 2) AS DECIMAL(18,2)) AS Media_Votos
	FROM Customs.Videos
