
---Ordenar los apellidos de las personas alfabéticamente en cada país

Select c.name, p.LastName from  [Person].[Person] as p
	Inner join [Person].[BusinessEntity] as be

on be.BusinessEntityID = p.BusinessEntityID
	Inner join [Person].[BusinessEntityAddress] as bea

On bea.BusinessEntityID = be.BusinessEntityID
	Inner join [Person].[Address] as a

on a.AddressID = bea.AddressID
	inner join [Person].[StateProvince] as s

on s.StateProvinceID = a.StateProvinceID
	inner join [Person].[CountryRegion] as c

on c.CountryRegionCode = s.CountryRegionCode
Order by c.name, p.Lastname


----Lista apellido, nombre  y la dirección de los clientes franceses, indicando en nombre de la provincia.

Select person.LastName + ',' + Person.FirstName as FullName, Adress.AddressLine1, Adress.City, Adress. PostalCode, Pais.Name, StadosProv.Name from [Person].[Person] as person
	Inner join [Person].[BusinessEntity] as businessE

on businessE.BusinessEntityID = person.BusinessEntityID
	Inner join [Person].[BusinessEntityAddress] as businessEnA

on businessEnA.BusinessEntityID = businessE.BusinessEntityID
	Inner join [Person].[Address] as Adress

on Adress.AddressID = businessEnA.AddressID
	Inner join [Person].[StateProvince] as StadosProv

on StadosProv.StateProvinceID = Adress.StateProvinceID

Inner join [Person].[CountryRegion] as Pais
on Pais.CountryRegionCode = StadosProv.CountryRegionCode

Where Pais.Name = 'France'

---
Select Person.LastName, Pais.Name, Count(*) as total from [Person].[Person] as person
	Inner join [Person].[BusinessEntity] as businessE

on businessE.BusinessEntityID = person.BusinessEntityID
	Inner join [Person].[BusinessEntityAddress] as businessEnA

on businessEnA.BusinessEntityID = businessE.BusinessEntityID
	Inner join [Person].[Address] as Adress

on Adress.AddressID = businessEnA.AddressID
	Inner join [Person].[StateProvince] as StadosProv

on StadosProv.StateProvinceID = Adress.StateProvinceID

Inner join [Person].[CountryRegion] as Pais
on Pais.CountryRegionCode = StadosProv.CountryRegionCode
Group by person.LastName, Pais.Name


---Identifica el store de Canada que tiene dos direcciones. ¿Cuantos stores tienen dos direcciones?

select Count(Name), Person.BusinessEntityID, Pais.Name From [Person].[Person] as Person, [Sales].[Store] as store
	Inner join Person.BusinessEntity as BusinessE

on BusinessE.BusinessEntityID = store.BusinessEntityID
	Inner join [Person].[BusinessEntityAddress] as businessEnA

on businessEnA.BusinessEntityID = businessE.BusinessEntityID
	Inner join [Person].[Address] as Adress

on Adress.AddressID = businessEnA.AddressID
	Inner join [Person].[StateProvince] as StadosProv

on StadosProv.StateProvinceID = Adress.StateProvinceID

Inner join [Person].[CountryRegion] as Pais
on Pais.CountryRegionCode = StadosProv.CountryRegionCode

Where pais.Name = 'Canada'
group by Person.BusinessEntityID, Adress.AddressLine1, Pais.Name;




---Que pais tiene mas ingresos de televisiones de 2017 en oceania?

Select Sum(Ingresos) ingresos, pais.Pais_txt from [Datos$] as datos
inner join [Productos$] as producto 
on producto.Producto_PK = datos.Producto_FK


Inner join [Paises$] pais
on pais.Pais_PK = datos.Pais_FK

inner join [Continentes$] as continente
on continente.Continente_PK = pais.Continente_FK

Where producto.[Tipo Producto] = 'TV' and Year(datos.fecha) = 2017 and continente = 'Oceanía'
Group by Pais_txt;


---Con que categoria gano mas dinero el continente americano en 2017?

Select top 1 Sum(Ingresos - Gastos) ventas, categoria.Categoria_Name  from [Datos$] as datos
inner join [Productos$] as producto 
on producto.Producto_PK = datos.Producto_FK

inner join [Categorias$] as categoria 
on producto.Categoría_FK = categoria.Categoría_PK

Inner join [Paises$] pais
on pais.Pais_PK = datos.Pais_FK

inner join [Continentes$] as continente
on continente.Continente_PK = pais.Continente_FK

Where Year(datos.fecha) = 2017 and continente = 'América'
Group by Categoria_Name
order by ventas DEsc;

