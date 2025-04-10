
--5.Custom.FidelityCard en 2NF
DROP TABLE #Custom_FidelityCard
GO

CREATE TABLE #Custom_FidelityCard (
	[PK_Custom.FidelityCard] [int] PRIMARY KEY IDENTITY (1, 1),
	[PersonID] [int]  NOT NULL,
	[StoreID] [int] NOT NULL,
	[NameInCard] [varchar](20) NOT NULL,
	[LastNameInCard] [varchar](20) NOT NULL,
);

SELECT*FROM #Custom_FidelityCard 