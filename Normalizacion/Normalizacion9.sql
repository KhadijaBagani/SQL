
--9.Document en 3NF

CREATE TABLE Production_DocumentDetail(
	[DocumentNode] [hierarchyid] PRIMARY KEY NOT NULL,
	[DocumentLevel]  AS ([DocumentNode].[GetLevel]()),
	[Title] [nvarchar](50) NOT NULL,
	[FileExtension] [nvarchar](8) NOT NULL,
	[FolderFlag] [bit] NOT NULL,
	[ChangeNumber] [int] NOT NULL,
	[DocumentSummary] [text] NULL,
	[Document] [text] NULL,
	[ModifiedDate] [datetime] NOT NULL,
 );
 CREATE TABLE Production_Document(
	[DocumentNode] [hierarchyid] PRIMARY KEY NOT NULL,
	[Owner] [int] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 );
	
	


