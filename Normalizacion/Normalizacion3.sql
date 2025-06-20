--3.ProductModel en 1NF (Salvo el atributo CatalogDescription)
DROP TABLE #ProductModel
GO

CREATE TABLE #ProductModel_Instruction (
	    [InstructionID] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
		[Instruction] [xml] NOT NULL,
);

CREATE TABLE #ProductModel (
	[ProductModelID] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CatalogDescription] [xml] NULL,
	[InstructionID] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedTime] [time] NOT NULL,
FOREIGN KEY (InstructionID) REFERENCES #ProductModel_Instruction (InstructionID)
);


SELECT*FROM #ProductModel