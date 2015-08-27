CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [smallint] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Contrasena] [varchar](50) NULL,
	[FechaRegistro] [datetime] NULL,
	[Estado] [smallint] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO