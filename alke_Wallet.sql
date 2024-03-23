 create schema alke_wallet;
 use alke_wallet;

-- Creación de la tabla Usuario
   CREATE TABLE Usuario (
    usuario_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo_electronico VARCHAR(100),
    contrasena VARCHAR(100),
    saldo DECIMAL(10,2)
);

-- Creación de la tabla Moneda
    CREATE TABLE Moneda (
    currency_id INT PRIMARY KEY,
    currency_name VARCHAR(100),
    currency_symbol VARCHAR(5)
);

-- Creación de la tabla Transacción
    CREATE TABLE Transaccion (
    transaccion_id INT PRIMARY KEY,
    remitente_usuario_id INT,
    receptor_usuario_id INT,
    importe DECIMAL(10,2),
    transaccion_date DATE,
    currency_id INT,
    FOREIGN KEY (remitente_usuario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (receptor_usuario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (currency_id) REFERENCES Moneda(currency_id)
);

-- Aca ingresamos datos para que nuestra base de datos no este vacia xD
INSERT INTO Usuario (usuario_id, nombre, correo_electronico, contrasena, saldo)
VALUES
    (1, 'Jose', 'Jose1@example.com', 'contrasena1', 5000.00),
    (2, 'Thomas', 'Thomas2@example.com', 'contrasena2', 500.00),
    (3, 'Valeria', 'Valeria3@example.com', 'contrasena3', 750.00);

-- hacemos una consulta de prueba para ver que los datos ingresados aparezcan en la tabla xD
 select * from usuario;

-- realizamos un insert en la tabla Moneda 
INSERT INTO Moneda (currency_id, currency_name, currency_symbol)
VALUES
    (1, 'Dólar', '$'),
    (2, 'Euro', '€'),
    (3, 'Bolivar', 'Bs');
-- hacemos otra consulta  para verificar que este todo bien en la tabla moneda xD
    select * from moneda;
    
-- realizamos otro insert pero esta vez en la tabla de las transacciones
INSERT INTO Transaccion (transaccion_id, remitente_usuario_id, receptor_usuario_id, importe, transaccion_date, currency_id)
VALUES
    (1, 1, 2, 1000.00, '2024-03-22', 1),
    (2, 2, 3, 150.00, '2024-03-23', 2),
    (3, 3, 1, 350.00, '2024-03-24', 3);
-- verificamos nuevamente con otra consulta xD
select * from transaccion;  

  -- Consulta para obtener el nombre de la moneda elegida por un usuario específico
SELECT Moneda.currency_name
FROM Usuario
JOIN Transaccion ON Usuario.usuario_id = Transaccion.remitente_usuario_id OR Usuario.usuario_id = Transaccion.receptor_usuario_id
JOIN Moneda ON Transaccion.currency_id = Moneda.currency_id
WHERE Usuario.nombre = 'Jose';

-- Consulta para obtener todas las transacciones registradas
select * from transaccion;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico
SELECT *
FROM Transaccion
WHERE remitente_usuario_id = '1' OR receptor_usuario_id = '3';

-- Realizacion de la Sentencia DML para modificar el campo correo electrónico de un usuario específico
UPDATE Usuario
SET correo_electronico = 'Jose29@example.com'
WHERE usuario_id = '1';

-- por ultimo sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
DELETE FROM Transaccion
WHERE transaccion_id = '3';

-- profe no me ponga cero xD... agradecido siempre con sus enseñanzas y su gran paciencia.


