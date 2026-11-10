# RetailPro – Proyecto de Data Analytics

## Descripción del proyecto

RetailPro es un proyecto de Data Analytics que analiza las ventas de una empresa de productos tecnológicos mediante SQL Server y Power BI.

Su objetivo es identificar tendencias de facturación, productos con mejor desempeño y comportamiento de los clientes, utilizando información comercial para facilitar la toma de decisiones.

## Herramientas utilizadas

- **SQL Server:** creación de la base de datos y ejecución de consultas SQL.
- **Visual Studio Code:** desarrollo y ejecución de scripts SQL.
- **Power BI Desktop:** modelado y visualización de datos.
- **Power Query:** limpieza y transformación de datos mediante procesos ETL.
- **DAX:** creación de medidas para el análisis comercial.
- **GitHub:** almacenamiento, organización y documentación del proyecto.

## Estructura de la base de datos

El proyecto utiliza cuatro tablas principales:

- `clientes`: información de los clientes.
- `productos`: catálogo de productos tecnológicos.
- `categorias`: clasificación de productos.
- `ventas`: registro de transacciones comerciales.

Estas tablas permiten relacionar las ventas con los clientes, productos y categorías correspondientes.

## Análisis realizados

Se desarrollaron consultas SQL para realizar los siguientes análisis:

1. **Resumen ejecutivo mensual:** facturación total, cantidad de pedidos y ticket promedio.
2. **Ranking de productos:** identificación de los cinco productos con mayor facturación.
3. **Clientes recurrentes:** análisis de clientes que realizaron múltiples compras.
4. **Comparación mensual:** identificación de meses con ventas superiores o inferiores al promedio.
5. **Consultas JOIN:** combinación de información de ventas, clientes, productos y categorías.

En Power BI se realizó la limpieza de datos, la creación de relaciones entre tablas y la construcción de medidas DAX para analizar el desempeño comercial.

## Transformación y modelado de datos

Mediante Power Query se realizaron transformaciones para mejorar la calidad de los datos:

- Eliminación de registros duplicados.
- Tratamiento de valores nulos.
- Corrección de tipos de datos.
- Combinación de tablas mediante Merge.

Se organizaron los datos en tablas de dimensiones y una tabla de hechos:

- `Dim_Clientes`
- `Dim_Productos`
- `Dim_Categorias`
- `Dim_Fechas`
- `Fact_Ventas`

También se creó una tabla `_Medidas` con indicadores DAX como ventas totales, ventas online, ventas acumuladas y crecimiento anual.

## Cómo ejecutar los scripts SQL

1. Iniciar una instancia de Microsoft SQL Server y conectarse utilizando Visual Studio Code con la extensión MSSQL.
2. Ejecutar `ventas_tech_db_sqlserver.sql` para preparar la base de datos y las tablas con sus registros iniciales.
3. Seleccionar la base de datos `Ventas_Tech_DB`.
4. Ejecutar `m4_consultas_negocio_sqlserver.sql` para analizar las ventas mensuales y el ranking de productos.
5. Ejecutar `m5_consultas_joins.sql` para combinar información de las diferentes tablas.

**Importante:** el script de creación puede contener instrucciones para eliminar y recrear tablas existentes. Por este motivo, se recomienda ejecutarlo únicamente en un entorno de práctica o sobre una base de datos de prueba.

## Objetivo final

El objetivo final es desarrollar un dashboard ejecutivo en Power BI que permita monitorear indicadores comerciales, analizar la evolución de las ventas e identificar oportunidades de mejora para RetailPro.

Este proyecto integra SQL, procesos ETL, modelado de datos y visualización para transformar información comercial en conocimiento útil para la toma de decisiones.
