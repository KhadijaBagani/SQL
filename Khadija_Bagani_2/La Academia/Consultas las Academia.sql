---Cuantos alumnos hay en cada aula

SELECT Count (Alumno_FK) NºAlumno, Aula_FK FROM [Entradas/Salidas] 
  Group by Aula_FK

---cuantos alumnos han venido a la academia hoy (NoEs Es Nulo)

SELECT Count (*) FROM [Entradas/Salidas] 
  where Year([Fecha/Hora_Entrada]) = 2024 and Day([Fecha/Hora_Entrada]) = 20 and MONTH([Fecha/Hora_Entrada]) = 05

  ---cuantos alumnos no han venido hoy (Es Nulo)

  SELECT Count (*) NºAlumnos FROM [Entradas/Salidas] 
  where [Fecha/Hora_Entrada] is null