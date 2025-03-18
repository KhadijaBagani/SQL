SELECT MONTH(HIREDATE), Gender, COUNT(*),
	Coalesce(Gender,'Subtotal mes') as genero,
	Count(*) as totalempleados,
	GROUPING(Gender) as Genero,
	GROUPING(MONTH(Hiredate))
 FROM [AdventureWorks2022].[HumanResources].[Employee]

 Group BY ROLLUP(MONTH(Hiredate), Gender)

--- Cuantas personas tienen el midel name A 

Select MiddleName, Count(*)
From [AdventureWorks2022].[Person].[Person]
Where MiddleName = 'A'
Group by MiddleName



Select 
Year(ShipDate) as Año,
ShipMethodID as tipoenvio,
Format(SUM(Subtotal), 'C', 'uk-gb') as Total,
Grouping(Year(ShipDate)) as agrupadoporaño,
grouping(ShipMethodID) as agrupadoporEnvio

From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Group by Rollup(Year(ShipDate), ShipMethodID);



Select Title, PersonType, year(ModifiedDate) as year, count(BusinessEntityID),
	GROUPING(Title) as AgrupadoPorTitulo,
    GROUPING Year(ModifiedDate) as AgrupadoPorAño
FROM [AdventureWorks2022].[Person].[Person]
Where Title in ('Mr', 'Ms.') and PersonType = 'EM' and year((modifiedDate)


--- Cuantos empleados tienen 40 horas de vacaciones y son de nivel de organizacion 4?
Select OrganizationLevel, VacationHours
	FROM [AdventureWorks2022].[HumanResources].[Employee]
Where OrganizationLevel = 4 and VacationHours = 40

---Cuantas combinaciones tienen 3 empleados que sean de nivel de organización 4?
select distinct VacationHours FROM [AdventureWorks2022].[HumanResources].[Employee]

Select OrganizationLevel, VacationHours, Count(*) TotalEmpleados,
	GROUPING(OrganizationLevel) as AgrupadoPorNivel,
    GROUPING(VacationHours) as AgrupadoPorHoraVacaciones
FROM [AdventureWorks2022].[HumanResources].[Employee]
Group by Rollup (OrganizationLevel, VacationHours)
Having count(*) = 3


Select Title, PersonType, year(ModifiedDate) as year, count(BusinessEntityID),
	GROUPING(Title) as AgrupadoPorTitulo,
    GROUPING Year(ModifiedDate) as AgrupadoPorAño
FROM [AdventureWorks2022].[Person].[Person]
Where Title in ('Mr', 'Ms.') and PersonType = 'EM' and year((modifiedDate);