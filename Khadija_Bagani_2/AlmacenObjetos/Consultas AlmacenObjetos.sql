---Crea una consulta para visualizar los objetos que hay en un espacio de una estantería.
Select NombreObjeto, EspacioFK, Estanteria_FK, Posicion, Columna FROM Objetos
inner join TipoObjeto as TObjetos
on TObjetos.TipoObjeto_PK = Objetos.TipoObjeto_FK
inner join Espacios as Esp
on Esp.Espacio_PK = Objetos.EspacioFK

---Haz una consulta que sume el valor de todos los objetos que hay en el almacén.
Select SUM(ValorCompra) as TotalAlmac  From Objetos
---Hay una consulta que sume el valor de los objetos de cada una de las 10 estanterías.
Select Sum(ValorCompra) as Total, Estanteria_FK From  Objetos
inner join Espacios as Esp
on Esp.Espacio_PK = Objetos.EspacioFK
Group by Estanteria_FK