CREATE DATABASE MafeBD2

USE [MafeDB2]
GO

CREATE TABLE [dbo].[Cargo](
	[id_cargo] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cargo] [varchar](50) NOT NULL,
	[jerarquia] [hierarchyid] NOT NULL,
 CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED 
(
	[id_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Empleado](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[documento_identificacion] [varchar](20) NOT NULL,
	[nombre_empleado] [varchar](50) NOT NULL,
	[apellido_empleado] [varchar](50) NOT NULL,
	[fecha_contratacion] [date] NOT NULL,
	[id_cargo] [int] NOT NULL,
	[telefono_empleado] [varchar](10) NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Cargo] FOREIGN KEY([id_cargo])
REFERENCES [dbo].[Cargo] ([id_cargo])
GO

ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Cargo]
GO

CREATE TABLE [dbo].[Proveedor](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre_proveedor] [varchar](50) NOT NULL,
	[apellido_proveedor] [varchar](50) NOT NULL,
	[telefono_proveedor] [varchar](10) NOT NULL,
	[direccion_proveedor] [varchar](200) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] IDENTITY(0,1) NOT NULL,
	[nombre_cliente] [varchar](50) NOT NULL,
	[apellido_cliente] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Compra](
	[id_compra] [int] IDENTITY(1,1) NOT NULL,
	[fecha_compra] [date] NOT NULL,
	[id_empleado] [int] NOT NULL,
	[id_proveedor] [int] NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleado] ([id_empleado])
GO

ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Empleado]
GO

ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[Proveedor] ([id_proveedor])
GO

ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Proveedor]
GO

CREATE TABLE [dbo].[Venta](
	[id_venta] [int] IDENTITY(1,1) NOT NULL,
	[fecha_venta] [date] NOT NULL,
	[id_empleado] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO

ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO

ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleado] ([id_empleado])
GO

ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Empleado]
GO

CREATE TABLE [dbo].[Item](
	[id_item] [int] IDENTITY(1,1) NOT NULL,
	[nombre_item] [varchar](200) NOT NULL,
	[cantidad_item] [int] NOT NULL,
	[valor_unidad_item] [money] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[id_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CompraItem](
	[id_compra] [int] NOT NULL,
	[id_item] [int] NOT NULL,
	[cantidad_comprada] [int] NOT NULL,
	[subtotal_compra] [money] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CompraItem]  WITH CHECK ADD  CONSTRAINT [FK_CompraItem_Compra] FOREIGN KEY([id_compra])
REFERENCES [dbo].[Compra] ([id_compra])
GO

ALTER TABLE [dbo].[CompraItem] CHECK CONSTRAINT [FK_CompraItem_Compra]
GO

ALTER TABLE [dbo].[CompraItem]  WITH CHECK ADD  CONSTRAINT [FK_CompraItem_Item] FOREIGN KEY([id_item])
REFERENCES [dbo].[Item] ([id_item])
GO

ALTER TABLE [dbo].[CompraItem] CHECK CONSTRAINT [FK_CompraItem_Item]
GO

CREATE TABLE [dbo].[VentaItem](
	[id_venta] [int] NOT NULL,
	[id_item] [int] NOT NULL,
	[cantidad_vendida] [int] NOT NULL,
	[subtotal_venta] [money] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[VentaItem]  WITH CHECK ADD  CONSTRAINT [FK_VentaItem_Item] FOREIGN KEY([id_item])
REFERENCES [dbo].[Item] ([id_item])
GO

ALTER TABLE [dbo].[VentaItem] CHECK CONSTRAINT [FK_VentaItem_Item]
GO

ALTER TABLE [dbo].[VentaItem]  WITH CHECK ADD  CONSTRAINT [FK_VentaItem_Venta] FOREIGN KEY([id_venta])
REFERENCES [dbo].[Venta] ([id_venta])
GO

ALTER TABLE [dbo].[VentaItem] CHECK CONSTRAINT [FK_VentaItem_Venta]
GO