USE [Pruebas2]
GO
/****** Object:  Table [dbo].[Seg_OpcionesMenu]    Script Date: 08/02/2016 15:06:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seg_OpcionesMenu](
	[idOpcion] [int] IDENTITY(1,1) NOT NULL,
	[TextoParaMostrar] [varchar](50) NOT NULL,
	[LinkDeAcceso] [varchar](255) NULL,
	[idOpcionPadre] [int] NOT NULL,
	[Estatus] [varchar](15) NOT NULL,
	[ULTIMAACT] [datetime] NULL,
	[ACTUALIZADO_POR] [nvarchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Seg_OpcionesPorRol]    Script Date: 08/02/2016 15:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seg_OpcionesPorRol](
	[idOpcion] [int] NOT NULL,
	[idRol] [int] NOT NULL,
	[Detalle] [nvarchar](50) NULL,
	[PuedeGrabar] [bit] NULL,
	[PuedeConsultar] [bit] NULL,
	[PuedeEliminar] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seg_Roles]    Script Date: 08/02/2016 15:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seg_Roles](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](30) NOT NULL,
	[Estatus] [varchar](10) NOT NULL,
	[ULTIMAACT] [datetime] NULL,
	[ACTUALIZADO_POR] [nvarchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Seg_Usuarios]    Script Date: 08/02/2016 15:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seg_Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](10) NOT NULL,
	[NumeroSocio] [char](6) NULL,
	[Nombres] [varchar](20) NULL,
	[Apellidos] [varchar](20) NULL,
	[Password] [varchar](15) NULL,
	[idRol] [int] NOT NULL,
	[Estatus] [varchar](10) NOT NULL,
	[ULTIMAACT] [datetime] NULL,
	[ACTUALIZADO_POR] [nvarchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
