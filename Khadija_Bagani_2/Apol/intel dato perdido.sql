Update Intel 
set NANOMETROS = 450
Where AÑO_PK = 2009

insert into Intel values (1971, 'Intel 4004', 1000, 108000, 2300)

---Sumar 100años a Año Intel

Update Intel 
set AÑO_PK = AÑO_PK + 100;

Update Intel 
set AÑO_PK = AÑO_PK - 100;