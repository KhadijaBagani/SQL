
--2.ProductReview en 1NF
DROP TABLE #ProductReview;
go

CREATE TABLE #ProductReview (
	[ProductReviewID] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ReviewerName] [nvarchar](50) NOT NULL,
	[ReviewDate] [datetime] NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[Rating] [int] NOT NULL,
	[Comments] [text] NULL,
	[ModifiedDate] [datetime] NOT NULL, 
	[ModifiedTime] [time] NOT NULL, 
);

SELECT*FROM #ProductReview