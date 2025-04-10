
--8.BusinessEntityContact en 3.5NF
CREATE TABLE Person_BusinessEntityContactType(
	BusinessEntityContactType [int] PRIMARY KEY IDENTITY (1, 1) NOT NULL,
	[BusinessEntityID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[ContactTypeID] [int] NOT NULL,

);
CREATE TABLE Person_BusinessEntityContact(
	BusinessEntityContact [int] PRIMARY KEY IDENTITY (1, 1) NOT NULL,
	[BusinessEntityContactTypeID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 FOREIGN KEY(BusinessEntityContactTypeID) REFERENCES Person_BusinessEntityContactType (BusinessEntityContactType)
);

