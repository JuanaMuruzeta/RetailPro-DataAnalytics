
-- PRE-ENTREGA 5: DATOS ADICIONALES
-- Proyecto: RetailPro
-- Motor: SQL Server

USE Ventas_Tech_DB;
GO

-- Clientes sin compras

IF NOT EXISTS (
    SELECT 1 FROM dbo.clientes WHERE id_cliente = 6
)
INSERT INTO dbo.clientes
(id_cliente, nombre, email, ciudad, fecha_registro)
VALUES
(6, 'Lucía Fernández', 'lucia@mail.com',
 'Buenos Aires', '2024-04-10');

IF NOT EXISTS (
    SELECT 1 FROM dbo.clientes WHERE id_cliente = 7
)
INSERT INTO dbo.clientes
(id_cliente, nombre, email, ciudad, fecha_registro)
VALUES
(7, 'Martín Rodríguez', 'martin@mail.com',
 'Córdoba', '2024-04-15');

-- Productos sin ventas

IF NOT EXISTS (
    SELECT 1 FROM dbo.productos WHERE id_producto = 7
)
INSERT INTO dbo.productos
(id_producto, nombre_producto, id_categoria, precio, stock, activo)
VALUES
(7, 'Webcam HD', 2, 75.00, 20, 1);

IF NOT EXISTS (
    SELECT 1 FROM dbo.productos WHERE id_producto = 8
)
INSERT INTO dbo.productos
(id_producto, nombre_producto, id_categoria, precio, stock, activo)
VALUES
(8, 'Parlante Bluetooth', 3, 85.00, 15, 1);
