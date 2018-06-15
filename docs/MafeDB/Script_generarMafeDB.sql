CREATE DATABASE MafeDB

USE [MafeDB]
GO

CREATE TABLE [dbo].[Empleado](
	[id_empleado] [int] NOT NULL,
	[documento_identificacion] [varchar](20) NOT NULL,
	[nombre_empleado] [varchar](50) NOT NULL,
	[apellido_empleado] [varchar](50) NOT NULL,
	[fecha_contratacion] [date] NOT NULL,
	[id_cargo] [int] NOT NULL,
	[telefono_empleado] [varchar](10) NULL,
	[email_empleado] [varchar](100) NULL,
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Cargo](
	[id_cargo] [int] NOT NULL,
	[cargo] [varchar](50) NOT NULL,
	[jerarquia] [hierarchyid] NOT NULL,
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] NOT NULL,
	[nombre_cliente] [varchar](50) NOT NULL,
	[apellido_cliente] [varchar](50) NOT NULL,
	[telefono_cliente] [varchar](10) NULL,
	[email_cliente] [varchar](100) NULL,
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Proveedor](
	[id_proveedor] [int] NOT NULL,
	[nombre_proveedor] [varchar](50) NOT NULL,
	[apellido_proveedor] [varchar](50) NOT NULL,
	[telefono_proveedor] [varchar](10) NOT NULL,
	[email_proveedor] [varchar](100) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Inventario](
	[id_item_inventario] [int] NOT NULL,
	[nombre_item_inventario] [varchar](100) NOT NULL,
	[cantidad_item_inventario] [int] NOT NULL,
	[valor_unidad_item] [money] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Venta](
	[id_venta] [int] NOT NULL,
	[fecha_venta] [date] NOT NULL,
	[id_cliente] [int] NULL,
	[id_empleado] [int] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[VentaInventario](
	[id_venta] [int] NOT NULL,
	[id_item] [int] NOT NULL,
	[cantidad_vendida] [int] NOT NULL,
	[subtotal_venta] [money] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Compra](
	[id_compra] [int] NOT NULL,
	[fecha_compra] [date] NOT NULL,
	[id_proveedor] [int] NULL,
	[id_empleado] [int] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CompraInventario](
	[id_compra] [int] NOT NULL,
	[id_item] [int] NOT NULL,
	[cantidad_comprada] [int] NOT NULL,
	[subtotal_compra] [money] NOT NULL
) ON [PRIMARY]
GO