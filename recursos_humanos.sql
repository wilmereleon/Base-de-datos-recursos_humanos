-- Crear la base de datos
CREATE DATABASE recursos_humanos;

-- Usar la base de datos
USE recursos_humanos;

-- Crear la tabla PAISES
CREATE TABLE PAISES (
    pais_ID INT PRIMARY KEY,
    pais_nombre VARCHAR(255) NOT NULL
);

-- Insertar datos de prueba en la tabla PAISES
INSERT INTO PAISES (pais_ID, pais_nombre) VALUES
(1, 'Colombia'),
(2, 'Argentina'),
(3, 'Brasil'),
(4, 'Chile'),
(5, 'Perú');

-- Crear la tabla CIUDADES
CREATE TABLE CIUDADES (
    ciud_ID INT PRIMARY KEY,
    ciud_nombre VARCHAR(255) NOT NULL,
    ciud_pais_ID INT,
    FOREIGN KEY (ciud_pais_ID) REFERENCES PAISES(pais_ID)
);

-- Insertar datos de prueba en la tabla CIUDADES
INSERT INTO CIUDADES (ciud_ID, ciud_nombre, ciud_pais_ID) VALUES
(1, 'Bogotá', 1),
(2, 'Buenos Aires', 2),
(3, 'São Paulo', 3),
(4, 'Santiago', 4),
(5, 'Lima', 5);

-- Crear la tabla LOCACIONES
CREATE TABLE LOCACIONES (
    localiz_ID INT PRIMARY KEY,
    localiz_direccion VARCHAR(255) NOT NULL,
    localiz_ciudad_ID INT,
    FOREIGN KEY (localiz_ciudad_ID) REFERENCES CIUDADES(ciud_ID)
);

-- Insertar datos de prueba en la tabla LOCACIONES
INSERT INTO LOCACIONES (localiz_ID, localiz_direccion, localiz_ciudad_ID) VALUES
(1, 'Calle 123', 1),
(2, 'Avenida 456', 2),
(3, 'Rua 789', 3),
(4, 'Calle 101', 4),
(5, 'Avenida 202', 5);

-- Crear la tabla DEPARTAMENTOS
CREATE TABLE DEPARTAMENTOS (
    dpto_ID INT PRIMARY KEY,
    dpto_nombre VARCHAR(255) NOT NULL,
    dpto_localiz_ID INT,
    FOREIGN KEY (dpto_localiz_ID) REFERENCES LOCACIONES(localiz_ID)
);

-- Insertar datos de prueba en la tabla DEPARTAMENTOS
INSERT INTO DEPARTAMENTOS (dpto_ID, dpto_nombre, dpto_localiz_ID) VALUES
(1, 'Recursos Humanos', 1),
(2, 'Finanzas', 2),
(3, 'Marketing', 3),
(4, 'Ventas', 4),
(5, 'IT', 5);

-- Crear la tabla CARGOS
CREATE TABLE CARGOS (
    cargo_ID INT PRIMARY KEY,
    cargo_nombre VARCHAR(255) NOT NULL,
    cargo_sueldo_minimo DECIMAL(10, 2) NOT NULL,
    cargo_sueldo_maximo DECIMAL(10, 2) NOT NULL
);

-- Insertar datos de prueba en la tabla CARGOS
INSERT INTO CARGOS (cargo_ID, cargo_nombre, cargo_sueldo_minimo, cargo_sueldo_maximo) VALUES
(1, 'Gerente', 5000.00, 10000.00),
(2, 'Analista', 3000.00, 6000.00),
(3, 'Desarrollador', 4000.00, 8000.00),
(4, 'Vendedor', 2000.00, 5000.00),
(5, 'Soporte Técnico', 2500.00, 5500.00);

-- Crear la tabla EMPLEADOS
CREATE TABLE EMPLEADOS (
    empl_ID INT PRIMARY KEY,
    empl_primer_nombre VARCHAR(255) NOT NULL,
    empl_segundo_nombre VARCHAR(255),
    empl_email VARCHAR(255) NOT NULL,
    empl_fecha_nac DATE NOT NULL,
    empl_sueldo DECIMAL(10, 2) NOT NULL,
    empl_comision DECIMAL(10, 2),
    empl_cargo_ID INT,
    empl_Gerente_ID INT,
    empl_dpto_ID INT,
    FOREIGN KEY (empl_cargo_ID) REFERENCES CARGOS(cargo_ID),
    FOREIGN KEY (empl_Gerente_ID) REFERENCES EMPLEADOS(empl_ID),
    FOREIGN KEY (empl_dpto_ID) REFERENCES DEPARTAMENTOS(dpto_ID)
);

-- Insertar datos de prueba en la tabla EMPLEADOS
INSERT INTO EMPLEADOS (empl_ID, empl_primer_nombre, empl_segundo_nombre, empl_email, empl_fecha_nac, empl_sueldo, empl_comision, empl_cargo_ID, empl_Gerente_ID, empl_dpto_ID) VALUES
(1, 'Juan', 'Perez', 'juan.perez@example.com', '1980-01-01', 7000.00, 500.00, 1, NULL, 1),
(2, 'Maria', 'Gomez', 'maria.gomez@example.com', '1985-02-02', 4500.00, 300.00, 2, 1, 2),
(3, 'Carlos', 'Lopez', 'carlos.lopez@example.com', '1990-03-03', 5000.00, 400.00, 3, 1, 3),
(4, 'Ana', 'Martinez', 'ana.martinez@example.com', '1995-04-04', 3500.00, 200.00, 4, 2, 4),
(5, 'Luis', 'Garcia', 'luis.garcia@example.com', '2000-05-05', 4000.00, 250.00, 5, 3, 5);

-- Crear la tabla HISTORICOS
CREATE TABLE HISTORICOS (
    emphist_ID INT PRIMARY KEY,
    emphist_fecha_retiro DATE NOT NULL,
    emphist_cargo_ID INT,
    emphist_dpto_ID INT,
    FOREIGN KEY (emphist_cargo_ID) REFERENCES CARGOS(cargo_ID),
    FOREIGN KEY (emphist_dpto_ID) REFERENCES DEPARTAMENTOS(dpto_ID)
);

-- Insertar datos de prueba en la tabla HISTORICOS
INSERT INTO HISTORICOS (emphist_ID, emphist_fecha_retiro, emphist_cargo_ID, emphist_dpto_ID) VALUES
(1, '2020-01-01', 1, 1),
(2, '2020-02-02', 2, 2),
(3, '2020-03-03', 3, 3),
(4, '2020-04-04', 4, 4),
(5, '2020-05-05', 5, 5);

-- Ver el contenido de la tabla PAISES
SELECT * FROM PAISES;

-- Ver el contenido de la tabla CIUDADES
SELECT * FROM CIUDADES;

-- Ver el contenido de la tabla LOCACIONES
SELECT * FROM LOCACIONES;

-- Ver el contenido de la tabla DEPARTAMENTOS
SELECT * FROM DEPARTAMENTOS;

-- Ver el contenido de la tabla CARGOS
SELECT * FROM CARGOS;

-- Ver el contenido de la tabla EMPLEADOS
SELECT * FROM EMPLEADOS;

-- Ver el contenido de la tabla HISTORICOS
SELECT * FROM HISTORICOS;
