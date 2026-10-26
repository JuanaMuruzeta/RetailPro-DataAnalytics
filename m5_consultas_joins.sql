
-- =============================================
-- PRE-ENTREGA 5: CONSULTAS SQL CON JOINS
-- Proyecto: RetailPro
-- Motor: SQL Server
-- Base de datos: Ventas_Tech_DB
-- =============================================

USE Ventas_Tech_DB;
GO

-- =============================================
-- CONSULTA 1: Vista base del proyecto (INNER JOIN)
-- Proposito: combinar ventas con clientes, productos
-- y categorias para obtener una vista enriquecida.
-- =============================================

SELECT
    v.id_venta,
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.ciudad,
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM dbo.ventas AS v
INNER JOIN dbo.clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN dbo.productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN dbo.categorias AS cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;

-- Hallazgo: Las 16 ventas registradas pueden
-- relacionarse con sus clientes, productos y
-- categorias. La vista permite analizar la
-- facturacion por ciudad y categoria.


-- =============================================
-- CONSULTA 2: Clientes sin ventas (LEFT JOIN)
-- Proposito: identificar clientes registrados
-- que nunca realizaron una compra.
-- =============================================

SELECT
    c.id_cliente,
    c.nombre,
    c.email,
    c.fecha_registro
FROM dbo.clientes AS c
LEFT JOIN dbo.ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL
ORDER BY c.id_cliente;

-- Hallazgo: Se identifican 2 clientes sin compras:
-- Lucia Fernandez y Martin Rodriguez.
-- Son clientes registrados que el area de CRM
-- podria contactar para incentivar su primera compra.


-- =============================================
-- CONSULTA 3: Productos sin ventas (LEFT JOIN)
-- Proposito: detectar productos del catalogo
-- que todavia no registraron ventas.
-- =============================================

SELECT
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM dbo.productos AS p
LEFT JOIN dbo.ventas AS v
    ON p.id_producto = v.id_producto
LEFT JOIN dbo.categorias AS cat
    ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL
ORDER BY p.id_producto;

-- Hallazgo: Se identifican 2 productos sin ventas:
-- Webcam HD y Parlante Bluetooth.
-- El area comercial podria revisar su promocion
-- para incentivar las ventas de estos articulos.


-- =============================================
-- CONSULTA 4: Consolidado por periodo (UNION ALL)
-- Proposito: comparar la facturacion de marzo
-- con la de los otros meses registrados.
-- La columna periodo se crea como texto fijo.
-- =============================================

SELECT
    periodo,
    SUM(total) AS total_periodo
FROM (
    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Marzo' AS periodo
    FROM dbo.ventas
    WHERE MONTH(fecha_venta) = 3

    UNION ALL

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Otros meses' AS periodo
    FROM dbo.ventas
    WHERE MONTH(fecha_venta) <> 3

) AS consolidado
GROUP BY periodo
ORDER BY total_periodo DESC;

-- Hallazgo: Marzo registro una facturacion de 6444,
-- mientras que enero, febrero y abril sumaron 2519.
-- Marzo concentra aproximadamente el 71,9%
-- de la facturacion total de 8963.
-- Esto evidencia una concentracion de las
-- ventas en ese periodo.

-- =============================================
-- FIN DE LA PRE-ENTREGA 5
-- =============================================
