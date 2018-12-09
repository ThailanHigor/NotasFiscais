USE [master]
GO
/****** Object:  Database [ProvaFabio]    Script Date: 06/12/2018 23:07:00 ******/
CREATE DATABASE [ProvaFabio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProvaFabio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MYDB\MSSQL\DATA\ProvaFabio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProvaFabio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MYDB\MSSQL\DATA\ProvaFabio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProvaFabio] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProvaFabio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProvaFabio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProvaFabio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProvaFabio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProvaFabio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProvaFabio] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProvaFabio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProvaFabio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProvaFabio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProvaFabio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProvaFabio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProvaFabio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProvaFabio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProvaFabio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProvaFabio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProvaFabio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProvaFabio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProvaFabio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProvaFabio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProvaFabio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProvaFabio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProvaFabio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProvaFabio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProvaFabio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProvaFabio] SET  MULTI_USER 
GO
ALTER DATABASE [ProvaFabio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProvaFabio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProvaFabio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProvaFabio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProvaFabio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProvaFabio] SET QUERY_STORE = OFF
GO
USE [ProvaFabio]
GO
/****** Object:  Table [dbo].[CabecalhoNFE]    Script Date: 06/12/2018 23:07:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CabecalhoNFE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumNF] [varchar](9) NULL,
	[Id_for] [int] NULL,
	[TipoNFE] [varchar](1) NULL,
	[DataEmissao] [date] NULL,
	[DataEntrada] [date] NULL,
	[HoraEntrada] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 06/12/2018 23:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](40) NULL,
	[CPF] [varchar](15) NULL,
	[RG] [varchar](15) NULL,
	[Endereco] [varchar](40) NULL,
	[Bairro] [varchar](20) NULL,
	[Cidade] [varchar](30) NULL,
	[Estado] [varchar](2) NULL,
	[CEP] [varchar](9) NULL,
	[Telefone] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CorpoNFE]    Script Date: 06/12/2018 23:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorpoNFE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_NFE] [int] NULL,
	[NumNFE] [varchar](9) NULL,
	[Id_prod] [int] NULL,
	[Quantidade] [decimal](7, 2) NULL,
	[CustoUnit] [decimal](13, 2) NULL,
	[IPI] [decimal](5, 2) NULL,
	[ICMS] [decimal](5, 2) NULL,
	[ISS] [decimal](5, 2) NULL,
	[ValorTotal] [decimal](13, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fornecedores]    Script Date: 06/12/2018 23:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecedores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RazaoSocial] [varchar](40) NULL,
	[CNPJ] [varchar](15) NULL,
	[InscEstadual] [varchar](15) NULL,
	[Endereco] [varchar](40) NULL,
	[Bairro] [varchar](20) NULL,
	[Cidade] [varchar](30) NULL,
	[Estado] [varchar](2) NULL,
	[CEP] [varchar](9) NULL,
	[Contato] [varchar](40) NULL,
	[Telefone] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 06/12/2018 23:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Grupo] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 06/12/2018 23:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](10) NULL,
	[Id_Grupo] [int] NULL,
	[Descricao] [varchar](40) NULL,
	[UN] [varchar](2) NULL,
	[Quantidade] [decimal](7, 2) NULL,
	[CustoIni] [decimal](13, 2) NULL,
	[CustoAtu] [decimal](13, 2) NULL,
	[OBS] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CabecalhoNFE] ON 
GO
INSERT [dbo].[CabecalhoNFE] ([Id], [NumNF], [Id_for], [TipoNFE], [DataEmissao], [DataEntrada], [HoraEntrada]) VALUES (1, N'025000', 1, N'E', CAST(N'2018-11-30' AS Date), CAST(N'2018-11-30' AS Date), CAST(N'18:24:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[CabecalhoNFE] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [CPF], [RG], [Endereco], [Bairro], [Cidade], [Estado], [CEP], [Telefone], [Email]) VALUES (1, N'Teste', N'123', N'123', N'123', N'123', N'123', N'RJ', N'123', N'123', N'123')
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[CorpoNFE] ON 
GO
INSERT [dbo].[CorpoNFE] ([Id], [Id_NFE], [NumNFE], [Id_prod], [Quantidade], [CustoUnit], [IPI], [ICMS], [ISS], [ValorTotal]) VALUES (19, 1, N'025000', 2, CAST(50.00 AS Decimal(7, 2)), CAST(3.00 AS Decimal(13, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(150.18 AS Decimal(13, 2)))
GO
SET IDENTITY_INSERT [dbo].[CorpoNFE] OFF
GO
SET IDENTITY_INSERT [dbo].[Fornecedores] ON 
GO
INSERT [dbo].[Fornecedores] ([Id], [RazaoSocial], [CNPJ], [InscEstadual], [Endereco], [Bairro], [Cidade], [Estado], [CEP], [Contato], [Telefone], [Email]) VALUES (1, N'Fornecedor Teste', N'12.123.12', N'123.123.123.123', N'Rua teste', N'bairro teste', N'cidade ', N'RJ', N'123', N'99992', N'9999', N'teste@teste.com')
GO
INSERT [dbo].[Fornecedores] ([Id], [RazaoSocial], [CNPJ], [InscEstadual], [Endereco], [Bairro], [Cidade], [Estado], [CEP], [Contato], [Telefone], [Email]) VALUES (2, N'Microsoft', N'123123', N'123123', N'Rua A', N'B', N'Volta Redonda', N'RJ', N'123123', N'Tem não', N'999999999', N'microsoft@teste.com')
GO
SET IDENTITY_INSERT [dbo].[Fornecedores] OFF
GO
SET IDENTITY_INSERT [dbo].[Grupo] ON 
GO
INSERT [dbo].[Grupo] ([Id], [Grupo]) VALUES (1, N'Alimentos')
GO
INSERT [dbo].[Grupo] ([Id], [Grupo]) VALUES (2, N'Vestuário')
GO
SET IDENTITY_INSERT [dbo].[Grupo] OFF
GO
SET IDENTITY_INSERT [dbo].[Produtos] ON 
GO
INSERT [dbo].[Produtos] ([Id], [Codigo], [Id_Grupo], [Descricao], [UN], [Quantidade], [CustoIni], [CustoAtu], [OBS]) VALUES (2, N'F943', 1, N'Feijão', N'KG', CAST(60.00 AS Decimal(7, 2)), CAST(5.00 AS Decimal(13, 2)), CAST(3.18 AS Decimal(13, 2)), NULL)
GO
SET IDENTITY_INSERT [dbo].[Produtos] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Cabecalh__E33EB1C301F29879]    Script Date: 06/12/2018 23:07:01 ******/
ALTER TABLE [dbo].[CabecalhoNFE] ADD UNIQUE NONCLUSTERED 
(
	[NumNF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NumNFE_IDPROD]    Script Date: 06/12/2018 23:07:01 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NumNFE_IDPROD] ON [dbo].[CorpoNFE]
(
	[NumNFE] ASC,
	[Id_prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Forneced__8FB5718712A7A28B]    Script Date: 06/12/2018 23:07:01 ******/
ALTER TABLE [dbo].[Fornecedores] ADD UNIQUE NONCLUSTERED 
(
	[InscEstadual] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Forneced__AA57D6B4D3AD8EC1]    Script Date: 06/12/2018 23:07:01 ******/
ALTER TABLE [dbo].[Fornecedores] ADD UNIQUE NONCLUSTERED 
(
	[CNPJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Produtos__06370DAC48861E8E]    Script Date: 06/12/2018 23:07:01 ******/
ALTER TABLE [dbo].[Produtos] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CabecalhoNFE]  WITH CHECK ADD  CONSTRAINT [CabecalhoNFE_Fornecedores] FOREIGN KEY([Id_for])
REFERENCES [dbo].[Fornecedores] ([Id])
GO
ALTER TABLE [dbo].[CabecalhoNFE] CHECK CONSTRAINT [CabecalhoNFE_Fornecedores]
GO
ALTER TABLE [dbo].[CorpoNFE]  WITH CHECK ADD  CONSTRAINT [CorpoNFE_CabecalhoNFE] FOREIGN KEY([Id_NFE])
REFERENCES [dbo].[CabecalhoNFE] ([Id])
GO
ALTER TABLE [dbo].[CorpoNFE] CHECK CONSTRAINT [CorpoNFE_CabecalhoNFE]
GO
ALTER TABLE [dbo].[CorpoNFE]  WITH CHECK ADD  CONSTRAINT [CorpoNFE_Produtos] FOREIGN KEY([Id_prod])
REFERENCES [dbo].[Produtos] ([Id])
GO
ALTER TABLE [dbo].[CorpoNFE] CHECK CONSTRAINT [CorpoNFE_Produtos]
GO
ALTER TABLE [dbo].[Produtos]  WITH CHECK ADD  CONSTRAINT [Produtos_Grupo] FOREIGN KEY([Id_Grupo])
REFERENCES [dbo].[Grupo] ([Id])
GO
ALTER TABLE [dbo].[Produtos] CHECK CONSTRAINT [Produtos_Grupo]
GO
USE [master]
GO
ALTER DATABASE [ProvaFabio] SET  READ_WRITE 
GO
