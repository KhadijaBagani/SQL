CREATE TABLE Prestamos (

Prestamo_PK INT PRIMARY KEY IDENTITY(1,1),
    Socio_FK TINYINT,
    Libro_FK TINYINT,
    Fecha_Retiro DATE NOT NULL,
    Fecha_Devolucion DATE,
    CONSTRAINT FK_Prestamos_Socios FOREIGN KEY (Socio_FK) REFERENCES Socios(Socio_PK),
    CONSTRAINT FK_Prestamos_Libros FOREIGN KEY (Libro_FK) REFERENCES Datos_Libros(Libro_PK),
    CONSTRAINT CK_FechaDevolucion CHECK (Fecha_Devolucion IS NULL OR Fecha_Devolucion >= Fecha_Retiro)
);


