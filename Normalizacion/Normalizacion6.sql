
--6.PurchaseOrderDetail en 2NF e introduce los primeros 5 valores
DROP TABLE #Purchasing_PurchaseOrderDetail
GO
DROP TABLE #Purchasing_PurchaseOrderID
GO
CREATE TABLE #Purchasing_PurchaseOrderDetail (
	[PurchaseOrderDetailID] [int]  PRIMARY KEY  IDENTITY(1,1) NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[OrderQty] [smallint] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[LineTotal]  AS (isnull([OrderQty]*[UnitPrice],(0.00))),
	[ReceivedQty] [decimal](8, 2) NOT NULL,
	[RejectedQty] [decimal](8, 2) NOT NULL,
	[StockedQty]  AS (isnull([ReceivedQty]-[RejectedQty],(0.00))),
	[ModifiedDate] [date] NOT NULL,
	[ModifiedTime] [time] NOT NULL,
);
CREATE TABLE #Purchasing_PurchaseOrderID (
			[PurchaseOrderID] [int] PRIMARY KEY  IDENTITY(1,1) NOT NULL,
			[DueDate] [date] NOT NULL,
	        [DueHours] [time] NOT NULL,
			
);

INSERT INTO #Purchasing_PurchaseOrderDetail ( PurchaseOrderID, OrderQty, ProductID, UnitPrice, ReceivedQty, 
RejectedQty, ModifiedDate, ModifiedTime)
VALUES ( 1,  4, 1, 50.26, 3.00, 0.00,  '2011-04-23', '00:00'), 
(2, 3,	359, 45.12,	3.00,	0.00,		'2011-04-23', '00:00'),
(2,		3,	360, 45.5805,	3.00,	0.00,		'2011-04-23', '00:00'),
(3,		550, 530,	16.086,	550.00,	0.00,	'2011-04-23', '00:00'),
(4,		3,	4,	57.0255, 2.00,	1.00,		'2011-04-23', '00:00')

INSERT INTO #Purchasing_PurchaseOrderID ( DueDate, DueHours)
VALUES ( '2011-04-30', '00:00'), 
(  '2011-04-30', '00:00'),
(	'2011-04-30', '00:00'),
(	 '2011-04-30',' 00:00'),
('2011-04-30', '00:00')

