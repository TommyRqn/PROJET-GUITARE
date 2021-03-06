USE [master]
GO
/****** Object:  Database [GUITARE]    Script Date: 16/04/2021 12:15:15 ******/
CREATE DATABASE [GUITARE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GUITARE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GUITARE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GUITARE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GUITARE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GUITARE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GUITARE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GUITARE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GUITARE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GUITARE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GUITARE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GUITARE] SET ARITHABORT OFF 
GO
ALTER DATABASE [GUITARE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GUITARE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GUITARE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GUITARE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GUITARE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GUITARE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GUITARE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GUITARE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GUITARE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GUITARE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GUITARE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GUITARE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GUITARE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GUITARE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GUITARE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GUITARE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GUITARE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GUITARE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GUITARE] SET  MULTI_USER 
GO
ALTER DATABASE [GUITARE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GUITARE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GUITARE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GUITARE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GUITARE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GUITARE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GUITARE] SET QUERY_STORE = OFF
GO
USE [GUITARE]
GO
/****** Object:  User [AUTORITE NT\Système]    Script Date: 16/04/2021 12:15:16 ******/
CREATE USER [AUTORITE NT\Système] FOR LOGIN [AUTORITE NT\Système] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [AUTORITE NT\Système]
GO
/****** Object:  Table [dbo].[Bois]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bois](
	[idBois] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NULL,
	[Origine] [varchar](50) NULL,
	[Stock] [int] NULL,
 CONSTRAINT [PK__Bois__D80296ED615B8E4A] PRIMARY KEY CLUSTERED 
(
	[idBois] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[idClient] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NULL,
	[Prenom] [varchar](50) NULL,
	[Adresse] [varchar](50) NULL,
	[MotDePasse] [varchar](50) NULL,
	[Telephone] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK__Client__A6A610D4A3E700D2] PRIMARY KEY CLUSTERED 
(
	[idClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guitare]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guitare](
	[idGuitare] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NULL,
	[Etat] [varchar](50) NULL,
	[idMicrophone_Neck] [int] NULL,
	[idMicrophone_Centrale] [int] NULL,
	[idVibrato] [int] NOT NULL,
	[idClient] [int] NULL,
	[idMicrophone_Bridge] [int] NULL,
	[idBois_Manche] [int] NOT NULL,
	[idBois_Corps] [int] NOT NULL,
	[idBois_Touche] [int] NOT NULL,
 CONSTRAINT [PK__Guitare__BAC5E7DA47CAF2EC] PRIMARY KEY CLUSTERED 
(
	[idGuitare] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Microphone]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Microphone](
	[idMicrophone] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NULL,
	[Reference_Construceteur] [varchar](50) NULL,
	[Marque] [varchar](50) NULL,
	[Stock] [int] NULL,
 CONSTRAINT [PK__Micropho__114B8C032DA666FC] PRIMARY KEY CLUSTERED 
(
	[idMicrophone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vibrato]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vibrato](
	[idVibrato] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NULL,
	[Modele] [varchar](50) NULL,
	[Marque] [varchar](50) NULL,
	[Stock] [int] NULL,
 CONSTRAINT [PK__Vibrato__79E490314483E490] PRIMARY KEY CLUSTERED 
(
	[idVibrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bois] ON 

INSERT [dbo].[Bois] ([idBois], [Nom], [Origine], [Stock]) VALUES (1, N'Frêne                          ', N'Europee                         ', 50)
INSERT [dbo].[Bois] ([idBois], [Nom], [Origine], [Stock]) VALUES (2, N'Acajou                                            ', N'Amérique du Sud                                   ', 50)
INSERT [dbo].[Bois] ([idBois], [Nom], [Origine], [Stock]) VALUES (3, N'Peuplier                                          ', N'Oui                                               ', 50)
SET IDENTITY_INSERT [dbo].[Bois] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([idClient], [Nom], [Prenom], [Adresse], [MotDePasse], [Telephone], [Email]) VALUES (1, N'Test1', N'Test2', N'100 Rue Georges Besse                             ', N'123456789                                         ', N'0123456789', N'test@test.com')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Guitare] ON 

INSERT [dbo].[Guitare] ([idGuitare], [Nom], [Etat], [idMicrophone_Neck], [idMicrophone_Centrale], [idVibrato], [idClient], [idMicrophone_Bridge], [idBois_Manche], [idBois_Corps], [idBois_Touche]) VALUES (65, N'Jeu d''essai', N'En cours', 2, 3, 1, 1, 1, 1, 2, 3)
SET IDENTITY_INSERT [dbo].[Guitare] OFF
GO
SET IDENTITY_INSERT [dbo].[Microphone] ON 

INSERT [dbo].[Microphone] ([idMicrophone], [Nom], [Reference_Construceteur], [Marque], [Stock]) VALUES (1, N'Aucun', N'00000000', N'Séléction pour aucune microphone', 50)
INSERT [dbo].[Microphone] ([idMicrophone], [Nom], [Reference_Construceteur], [Marque], [Stock]) VALUES (2, N'Original Vintage Tele PU        ', N'12345623569295                  ', N'Fender                          ', 50)
INSERT [dbo].[Microphone] ([idMicrophone], [Nom], [Reference_Construceteur], [Marque], [Stock]) VALUES (3, N'57 Classic Vintage BK                             ', N'123456789                                         ', N'Gibson                                            ', 50)
SET IDENTITY_INSERT [dbo].[Microphone] OFF
GO
SET IDENTITY_INSERT [dbo].[Vibrato] ON 

INSERT [dbo].[Vibrato] ([idVibrato], [Nom], [Modele], [Marque], [Stock]) VALUES (1, N'Tremolo 57/62                                     ', N'Tremolo                                           ', N'Fender                                            ', 50)
INSERT [dbo].[Vibrato] ([idVibrato], [Nom], [Modele], [Marque], [Stock]) VALUES (6, N'Tremolo 60/70 ', N'Tremolo                                           ', N'Fender                                            ', 50)
SET IDENTITY_INSERT [dbo].[Vibrato] OFF
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idBois___30F848ED] FOREIGN KEY([idBois_Manche])
REFERENCES [dbo].[Bois] ([idBois])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idBois___30F848ED]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idBois___31EC6D26] FOREIGN KEY([idBois_Corps])
REFERENCES [dbo].[Bois] ([idBois])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idBois___31EC6D26]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idBois___32E0915F] FOREIGN KEY([idBois_Touche])
REFERENCES [dbo].[Bois] ([idBois])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idBois___32E0915F]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idClien__2F10007B] FOREIGN KEY([idClient])
REFERENCES [dbo].[Client] ([idClient])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idClien__2F10007B]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idMicro__2C3393D0] FOREIGN KEY([idMicrophone_Neck])
REFERENCES [dbo].[Microphone] ([idMicrophone])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idMicro__2C3393D0]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idMicro__2D27B809] FOREIGN KEY([idMicrophone_Centrale])
REFERENCES [dbo].[Microphone] ([idMicrophone])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idMicro__2D27B809]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idMicro__300424B4] FOREIGN KEY([idMicrophone_Bridge])
REFERENCES [dbo].[Microphone] ([idMicrophone])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idMicro__300424B4]
GO
ALTER TABLE [dbo].[Guitare]  WITH CHECK ADD  CONSTRAINT [FK__Guitare__idVibra__2E1BDC42] FOREIGN KEY([idVibrato])
REFERENCES [dbo].[Vibrato] ([idVibrato])
GO
ALTER TABLE [dbo].[Guitare] CHECK CONSTRAINT [FK__Guitare__idVibra__2E1BDC42]
GO
/****** Object:  StoredProcedure [dbo].[Add_Bois]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Add_Bois](@P_Nom as nchar(50), @P_Origine as nchar(50), @P_Stock as int) as begin
	insert into Bois(Nom, Origine, Stock) values (@P_Nom, @P_Origine, @P_Stock);
 end;
GO
/****** Object:  StoredProcedure [dbo].[Add_Client]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Add_Client](@P_Nom as nchar(50), @P_Prenom as nchar(50), @P_Adresse as nchar(50), @P_MotDePasse as nchar(50), @P_Telephone as nchar(50), @P_Email as nchar(100)) as begin
	insert into Client(Nom, Prenom, Adresse, MotDePasse, Telephone, Email) values (@P_Nom, @P_Prenom, @P_Adresse, @P_MotDePasse, @P_Telephone, @P_Email);
 end;
GO
/****** Object:  StoredProcedure [dbo].[Add_Guitare]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Add_Guitare](@P_Nom as nchar(50), @P_idMicrophoneNeck as int, @P_idMicrophoneCentrale as int, @P_idVibrato as int, @P_idClient as int, @P_idMicrophoneBridge as int, @P_idBoisManche as int, @P_idBoisCorps as int, @P_idBoisTouche as int) as begin
	insert into Guitare(Nom, idMicrophone_Neck, idMicrophone_Centrale, idVibrato, idClient, idMicrophone_Bridge, idBois_Manche, idBois_Corps, idBois_Touche) values (@P_Nom, @P_idMicrophoneNeck, @P_idMicrophoneCentrale, @P_idVibrato, @P_idClient, @P_idMicrophoneBridge, @P_idBoisManche, @P_idBoisCorps, @P_idBoisTouche);
 end;
GO
/****** Object:  StoredProcedure [dbo].[Add_Guitare_No_Bridge]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Guitare_No_Bridge](@P_Nom as nchar(50), @P_idMicrophoneNeck as int, @P_idMicrophoneCentrale as int, @P_idVibrato as int, @P_idClient as int, @P_idBoisManche as int, @P_idBoisCorps as int, @P_idBoisTouche as int) as begin
	insert into Guitare(Nom, idMicrophone_Neck, idMicrophone_Centrale, idVibrato, idClient, idBois_Manche, idBois_Corps, idBois_Touche) values (@P_Nom, @P_idMicrophoneNeck, @P_idMicrophoneCentrale, @P_idVibrato, @P_idClient, @P_idBoisManche, @P_idBoisCorps, @P_idBoisTouche);
 end;
GO
/****** Object:  StoredProcedure [dbo].[Add_Guitare_No_Centrale]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Guitare_No_Centrale](@P_Nom as nchar(50), @P_idMicrophoneNeck as int, @P_idVibrato as int, @P_idClient as int, @P_idMicrophoneBridge as int, @P_idBoisManche as int, @P_idBoisCorps as int, @P_idBoisTouche as int) as begin
	insert into Guitare(Nom, idMicrophone_Neck, idVibrato, idClient, idMicrophone_Bridge, idBois_Manche, idBois_Corps, idBois_Touche) values (@P_Nom, @P_idMicrophoneNeck, @P_idVibrato, @P_idClient, @P_idMicrophoneBridge, @P_idBoisManche, @P_idBoisCorps, @P_idBoisTouche);
 end;
GO
/****** Object:  StoredProcedure [dbo].[Add_Guitare_No_Neck]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Guitare_No_Neck](@P_Nom as nchar(50), @P_idMicrophoneCentrale as int, @P_idVibrato as int, @P_idClient as int, @P_idMicrophoneBridge as int, @P_idBoisManche as int, @P_idBoisCorps as int, @P_idBoisTouche as int) as begin
	insert into Guitare(Nom, idMicrophone_Centrale, idVibrato, idClient, idMicrophone_Bridge, idBois_Manche, idBois_Corps, idBois_Touche) values (@P_Nom, @P_idMicrophoneCentrale, @P_idVibrato, @P_idClient, @P_idMicrophoneBridge, @P_idBoisManche, @P_idBoisCorps, @P_idBoisTouche);
 end;
GO
/****** Object:  StoredProcedure [dbo].[Add_Microphone]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Add_Microphone](@P_Nom as nchar(50), @P_ReferenceConstructeur as nchar(50), @P_Marque as nchar(50), @P_Stock as int) as begin
	insert into Microphone(Nom, Reference_Construceteur, Marque, Stock) values (@P_Nom, @P_ReferenceConstructeur, @P_Marque, @P_Stock);
 end;
GO
/****** Object:  StoredProcedure [dbo].[Add_Vibrato]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Vibrato](@P_Nom as nchar(50), @P_Modele as nchar(50), @P_Marque as nchar(50), @P_Stock as int) as begin
    insert into Vibrato(Nom, Modele, Marque, Stock) values (@P_Nom, @P_Modele, @P_Marque, @P_Stock);
 end;
GO
/****** Object:  StoredProcedure [dbo].[Delete_Bois_By_Id]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Delete_Bois_By_Id](@P_Id as int) as begin
	 delete Bois where idBois = @P_Id;
 end;
GO
/****** Object:  StoredProcedure [dbo].[Delete_Microphone_By_Id]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Delete_Microphone_By_Id](@P_Id as int) as begin
	 delete Microphone where idMicrophone = @P_Id;
 end;
GO
/****** Object:  StoredProcedure [dbo].[Delete_Vibrato_By_Id]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Delete_Vibrato_By_Id](@P_Id as int) as begin
	 delete Vibrato where idVibrato = @P_Id;
 end;
GO
/****** Object:  StoredProcedure [dbo].[Edit_Bois]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Edit_Bois](@P_Id as int, @P_Nom as nchar(32), @P_Origine as nchar(32), @P_Stock as int) as begin
	update Bois SET Nom = @P_Nom, Origine = @P_Origine, Stock = @P_Stock where idBois = @P_Id;
 end;
GO
/****** Object:  StoredProcedure [dbo].[Edit_Guitare]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Edit_Guitare](@P_Id as int, @P_Etat as nchar(50)) as begin
	update Guitare SET Etat = @P_Etat where idGuitare = @P_Id;
 end;
GO
/****** Object:  StoredProcedure [dbo].[Edit_Microphone]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Edit_Microphone](@P_Id as int, @P_Nom as nchar(32), @P_Reference as nchar(32), @P_Marque as nchar(32), @P_Stock as int) as begin
	update Microphone SET Nom = @P_Nom, Reference_Construceteur = @P_Reference, Marque = @P_Marque, Stock = @P_Stock where idMicrophone = @P_Id;
 end;
GO
/****** Object:  StoredProcedure [dbo].[Edit_Vibrato]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Edit_Vibrato](@P_Id as int, @P_Nom as nchar(32), @P_Modele as nchar(32), @P_Marque as nchar(32), @P_Stock as int) as begin
	update Vibrato SET Nom = @P_Nom, Modele = @P_Modele, Marque = @P_Marque, Stock = @P_Stock where idVibrato = @P_Id;
 end;
GO
/****** Object:  StoredProcedure [dbo].[Get_All_Bois]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_All_Bois] as begin
	SELECT * FROM Bois;
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_All_Client]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_All_Client] as begin
	SELECT * FROM Client;
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_All_Guitare]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_All_Guitare] as begin
	SELECT * FROM Guitare;
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_All_Microphone]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_All_Microphone] as begin
	SELECT * FROM Microphone;
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_All_Vibrato]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_All_Vibrato] as begin
	SELECT * FROM Vibrato;
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_Bois_By_Id]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Bois_By_Id](@P_Id as int) as begin
	SELECT * FROM Bois WHERE idBois = @P_Id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_Client_By_Id]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Client_By_Id](@P_Id as int) as begin
	SELECT * FROM Client WHERE idClient=@P_Id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_Guitare_By_Client_Id]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Guitare_By_Client_Id](@P_Id as int) as begin
	SELECT * FROM Guitare WHERE idClient = @P_Id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_Guitare_By_Nom_Prenom]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Guitare_By_Nom_Prenom](@P_Prenom nchar(32), @P_Nom nchar(32)) as begin
	SELECT G.* FROM Guitare G, Client C WHERE C.idClient=G.idClient AND C.Nom=@P_Nom AND C.Prenom=@P_Prenom;
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_Microphone_By_Id]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Microphone_By_Id](@P_Id as int) as begin
	SELECT * FROM Microphone WHERE idMicrophone = @P_Id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_Vibrato_By_Id]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Vibrato_By_Id](@P_Id as int) as begin
	SELECT * FROM Vibrato WHERE idVibrato = @P_Id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login] (@P_Email as nchar(100), @P_Password as nchar(50)) as begin
	SELECT * FROM Client WHERE Client.Email = @P_Email AND Client.MotDePasse = @P_Password;
end;
GO
/****** Object:  Trigger [dbo].[FillNullMicroAndEtat]    Script Date: 16/04/2021 12:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[FillNullMicroAndEtat]
ON [dbo].[Guitare]
FOR INSERT, UPDATE AS

DECLARE @Etat varchar(50)
DECLARE @Neck int
DECLARE @Centrale int
DECLARE @Bridge int

SELECT @Etat = Etat FROM Guitare
SELECT @Neck = idMicrophone_Neck FROM Guitare
SELECT @Centrale = idMicrophone_Centrale FROM Guitare
SELECT @Bridge = idMicrophone_Bridge FROM Guitare

IF(@Etat IS NULL)
	UPDATE Guitare
	SET Etat = 'En cours'
	FROM Guitare

IF(@Neck IS NULL)
	UPDATE Guitare
	SET idMicrophone_Neck = 1
	FROM GUITARE
	
IF(@Centrale IS NULL)
	UPDATE Guitare
	SET idMicrophone_Centrale = 1
	FROM GUITARE
	
IF(@Bridge IS NULL)
	UPDATE Guitare
	SET idMicrophone_Bridge = 1
	FROM GUITARE
GO
ALTER TABLE [dbo].[Guitare] ENABLE TRIGGER [FillNullMicroAndEtat]
GO
/****** Object:  Trigger [dbo].[SubStock]    Script Date: 16/04/2021 12:15:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[SubStock]
ON [dbo].[Guitare]
FOR INSERT AS

DECLARE @Neck int
DECLARE @Centrale int
DECLARE @Bridge int
DECLARE @Manche int
DECLARE @Corps int
DECLARE @Touche int
DECLARE @Vibrato int

SELECT @Neck = idMicrophone_Neck FROM Guitare
SELECT @Centrale = idMicrophone_Centrale FROM Guitare
SELECT @Bridge = idMicrophone_Bridge FROM Guitare
SELECT @Manche = idBois_Manche FROM Guitare
SELECT @Corps = idBois_Corps FROM Guitare
SELECT @Touche = idBois_Touche FROM Guitare
SELECT @Vibrato = idVibrato FROM Guitare

IF(@Neck IS NOT NULL)
	UPDATE Microphone
	SET Stock -= 1
	FROM GUITARE
	WHERE Microphone.idMicrophone = @Neck
	
IF(@Centrale IS NOT NULL)
	UPDATE Microphone
	SET Stock -= 1
	FROM GUITARE
	WHERE Microphone.idMicrophone = @Centrale
	
IF(@Bridge IS NOT NULL)
	UPDATE Microphone
	SET Stock -= 1
	FROM GUITARE
	WHERE Microphone.idMicrophone = @Bridge

IF(@Manche IS NOT NULL)
	UPDATE Bois
	SET Stock -= 1
	FROM GUITARE
	WHERE Bois.idBois = @Manche

IF(@Corps IS NOT NULL)
	UPDATE Bois
	SET Stock -= 1
	FROM GUITARE
	WHERE Bois.idBois = @Corps

IF(@Touche IS NOT NULL)
	UPDATE Bois
	SET Stock -= 1
	FROM GUITARE
	WHERE Bois.idBois = @Touche

IF(@Vibrato IS NOT NULL)
	UPDATE Vibrato
	SET Stock -= 1
	FROM GUITARE
	WHERE Vibrato.idVibrato = @Vibrato
GO
ALTER TABLE [dbo].[Guitare] ENABLE TRIGGER [SubStock]
GO
USE [master]
GO
ALTER DATABASE [GUITARE] SET  READ_WRITE 
GO
