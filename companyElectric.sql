CREATE DATABASE company_energy;

USE company_energy;

CREATE TABLE Clientes(
    clienteid INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100),
    direccion NVARCHAR(200),
    telefono NVARCHAR(15),
    email NVARCHAR(100)
);

CREATE TABLE mes(
    mesid INT PRIMARY KEY,
    nombre NVARCHAR(20)
);

INSERT INTO mes (mesid, nombre) VALUES
(1, 'Enero'),
(2, 'Febrero'),
(3, 'Marzo'),
(4, 'Abril'),
(5, 'Mayo'),
(6, 'Junio'),
(7, 'Julio'),
(8, 'Agosto'),
(9, 'Septiembre'),
(10, 'Octubre'),
(11, 'Noviembre'),
(12, 'Diciembre');

CREATE TABLE Consumos(
    consumoid INT IDENTITY(1,1) PRIMARY KEY,
    clienteid INT,
    mesid INT,
    anio INT,
    consumo DECIMAL(10,2),
    FOREIGN KEY (clienteid) REFERENCES Clientes(clienteid),
    FOREIGN KEY (mesid) REFERENCES mes(mesid)
);

CREATE TABLE consumoFactura(
    consumofacturaid INT IDENTITY(1,1) PRIMARY KEY,
    consumoid INT,
    facturaid INT,
    monto_kwt DECIMAL(10,2),
    monto_subtotal DECIMAL(10,2),
    FOREIGN KEY (consumoid) REFERENCES Consumos(consumoid),
    FOREIGN KEY (facturaid) REFERENCES Facturas(facturasid)
);

CREATE TABLE Facturas(
    facturaid INT IDENTITY(1,1) PRIMARY KEY,
    clienteid INT,
    fecha_emision DATE,
    monto_total DECIMAL(10,2),
    estado NVARCHAR(50),
    FOREIGN KEY (clienteid) REFERENCES Clientes(Clienteid)
);