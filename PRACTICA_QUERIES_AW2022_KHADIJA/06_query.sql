--06-¿Cual es el Coste total de las unidades rechazadas (RejectedQty) en todos los pedidos de compra [Purchasing].[PurchaseOrderDetail]?

USE AdventureWorks2022
SELECT SUM(RejectedQty * UnitPrice) TotalRechazadas FROM  Purchasing.PurchaseOrderDetail

