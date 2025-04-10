
--7.EmailAddress en 3NF

CREATE TABLE #Person_EmailAddress(
	[BusinessEntityID] [int] NOT NULL,
	[EmailAddressID] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedTime] [time] NOT NULL,
 );