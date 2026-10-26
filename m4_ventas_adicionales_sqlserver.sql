
-- PRE-ENTREGA 4: VENTAS ADICIONALES
-- Proyecto: RetailPro
-- Motor: SQL Server

USE Ventas_Tech_DB;
GO

-- Agregar ventas de enero, febrero y abril
-- sin duplicar registros existentes.

INSERT INTO dbo.ventas
    (id_venta, id_cliente, id_producto,
     cantidad, precio_unitario, fecha_venta)
SELECT
    v.id_venta, v.id_cliente, v.id_producto,
    v.cantidad, v.precio_unitario, v.fecha_venta
FROM (VALUES
    (11, 1, 1, 1, 1200.00, CAST('2024-01-10' AS DATE)),
    (12, 2, 2, 3, 28.00, CAST('2024-01-20' AS DATE)),
    (13, 3, 3, 1, 450.00, CAST('2024-02-05' AS DATE)),
    (14, 4, 4, 2, 120.00, CAST('2024-02-18' AS DATE)),
    (15, 5, 5, 2, 130.00, CAST('2024-04-08' AS DATE)),
    (16, 1, 6, 3, 95.00, CAST('2024-04-15' AS DATE))
) AS v(id_venta, id_cliente, id_producto,
       cantidad, precio_unitario, fecha_venta)
WHERE NOT EXISTS (
    SELECT 1
    FROM dbo.ventas AS existente
    WHERE existente.id_venta = v.id_venta
);
GO
