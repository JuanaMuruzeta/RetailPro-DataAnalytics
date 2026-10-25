
-- PRE-ENTREGA 4: CONSULTAS SQL DE NEGOCIO
-- Proyecto: RetailPro
-- Base de datos: ventas_tech_db
-- Motor: PostgreSQL
-- Todas las consultas utilizan exclusivamente
-- la tabla public.ventas.
-- En PostgreSQL, EXTRACT(MONTH FROM fecha_venta)
-- equivale a MONTH(fecha_venta).


-- =============================================
-- CONSULTA 1: Resumen ejecutivo mensual
-- =============================================

SELECT
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    ROUND(AVG(cantidad * precio_unitario), 2) AS ticket_promedio
FROM public.ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta)
ORDER BY mes;


-- =============================================
-- CONSULTA 2: Ranking de productos (TOP 5)
-- =============================================

SELECT
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM public.ventas
GROUP BY id_producto
ORDER BY total_facturado DESC
LIMIT 5;


-- =============================================
-- CONSULTA 3: Clientes recurrentes
-- =============================================

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM public.ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY cantidad_pedidos DESC, total_gastado DESC;


-- =============================================
-- CONSULTA 4: Meses por encima/debajo del promedio
-- =============================================

WITH ventas_mensuales AS (
    SELECT
        EXTRACT(MONTH FROM fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM public.ventas
    GROUP BY EXTRACT(MONTH FROM fecha_venta)
)
SELECT
    mes,
    total_facturado,
    ROUND(AVG(total_facturado) OVER (), 2)
        AS promedio_mensual_general,
    CASE
        WHEN total_facturado >=
             AVG(total_facturado) OVER ()
            THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM ventas_mensuales
ORDER BY mes;


-- =============================================
-- HALLAZGOS DE NEGOCIO
-- =============================================

-- 1. Entre enero y abril de 2024 se facturaron
--    8963 en total. El promedio mensual fue de
--    2240,75. Marzo concentro 6444 y fue el
--    unico mes que supero ese promedio; los
--    otros tres meses quedaron por debajo.

-- 2. El producto 1 genero 4800, aproximadamente
--    el 53,6 % de toda la facturacion, lo que
--    muestra una alta concentracion de ingresos
--    en un solo producto. El producto 2 acumulo
--    16 unidades vendidas.

-- 3. Los cinco clientes realizaron mas de un
--    pedido. El cliente 1 realizo cuatro pedidos
--    y gasto 4125, mientras que los otros cuatro
--    clientes hicieron tres pedidos cada uno.
--    Todos califican como recurrentes.
