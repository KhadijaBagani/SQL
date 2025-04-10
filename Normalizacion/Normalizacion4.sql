
--4.Sales en 2NF
 CREATE TABLE #Sales_StoreDemographics(
	[DemographicID] [int] PRIMARY KEY NOT NULL,
	[Demographic] [xml] NOT NULL,

);
CREATE TABLE #Sales_Store(
	[BusinessEntityID] [int] PRIMARY KEY NOT NULL,
	[Name] [varchar] (70) NOT NULL,
	[SalesPersonID] [int] NOT NULL,
	[DemographicID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	FOREIGN KEY (DemographicID) REFERENCES #Sales_StoreDemographics(DemographicID)
);

