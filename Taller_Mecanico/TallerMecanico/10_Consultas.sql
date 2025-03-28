--- 8. Crea una consulta para saber el valor de todas las reparaciones de un vehículo.

SELECT SUM(Importe_Total) ValorTotal from Reparaciones
where Matricula_FK = '1234ABC'

---9. Crea una consulta para saber las reparaciones pendientes de facturar.

SELECT Reparacion_PK, Descripcion, Matricula_FK, FACTURA_FK FROM Reparaciones
WHERE Factura_FK IS  NULL

---10. Crea una consulta para saber qué vehículos aún no han sido reparados.

SELECT Matricula_PK, Marca, Modelo FROM Vehiculos
LEFT join Reparaciones
on Vehiculos.Matricula_PK = Reparaciones.Matricula_FK
WHERE Reparacion_PK  IS NULL

