USE [master]
GO
/****** Object:  Database [QuanLyTour]    Script Date: 23/12/2016 11:40:29 CH ******/
CREATE DATABASE [QuanLyTour]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyTour', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuanLyTour.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyTour_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuanLyTour_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyTour] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyTour].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyTour] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyTour] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyTour] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyTour] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyTour] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyTour] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyTour] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyTour] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyTour] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyTour] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyTour] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyTour] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyTour] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyTour] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyTour] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyTour] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyTour] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyTour] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyTour] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyTour] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyTour] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyTour] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyTour] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyTour] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyTour] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyTour] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyTour] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyTour] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyTour] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyTour]
GO
/****** Object:  StoredProcedure [dbo].[DanhSachTour]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DanhSachTour]
AS
BEGIN
	select * from Tour
END


GO
/****** Object:  StoredProcedure [dbo].[GetDoan]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDoan]
	@ngaydi date,
	@ngaykt date
AS
BEGIN
	select * from Doan where NgayDi=@ngaydi and NgayKT=@ngaykt
END


GO
/****** Object:  StoredProcedure [dbo].[ThemCTTour]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ThemCTTour]
	@matour int,
	@madd int
AS
BEGIN
	insert into ChiTietTour values (@matour,@madd)
END


GO
/****** Object:  StoredProcedure [dbo].[ThemDiaDiem]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ThemDiaDiem]
	@tendd nvarchar(100),
	@thongtindd nvarchar(250),
	@tinh nvarchar(100),
	@nuoc nvarchar(100)
AS
BEGIN
	insert into DiaDiem values (@tendd,@thongtindd,@tinh,@nuoc);
END


GO
/****** Object:  StoredProcedure [dbo].[ThemDoan]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ThemDoan]	
	@tendoan nvarchar(250),
	@noidung nvarchar(250),
	@ngaydi date,
	@ngaykt date,
	@matour int
AS
BEGIN
	insert into Doan values(@tendoan,@noidung,@ngaydi,@ngaykt,@matour);
END


GO
/****** Object:  StoredProcedure [dbo].[ThemKhachHang]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ThemKhachHang]	
	@tenkh nvarchar(250),
	@cmnd nvarchar(250),
	@diachi nvarchar(250),
	@gioitinh nvarchar(250),
	@sodt nvarchar(20),
	@madoan int
AS
BEGIN
	insert into KhachHang values(@tenkh,@cmnd,@diachi,@gioitinh,@sodt,@madoan);
END


GO
/****** Object:  StoredProcedure [dbo].[ThemTour]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ThemTour]	
	@tentour nvarchar(100),
	@thongtintour nvarchar(250),
	@giatour decimal(18,0)
AS
BEGIN
	insert into Tour values(@tentour,@thongtintour,@giatour);
END


GO
/****** Object:  Table [dbo].[ChiTietDoan]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDoan](
	[Ma_CTDoan] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[MaDoan] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Ma_CTDoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietTour]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietTour](
	[MaCTTour] [int] IDENTITY(1,1) NOT NULL,
	[MaTour] [int] NOT NULL,
	[MaDiaDiem] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietTour] PRIMARY KEY CLUSTERED 
(
	[MaCTTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiaDiem]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaDiem](
	[MaDiaDiem] [int] IDENTITY(1,1) NOT NULL,
	[TenDiaDiem] [nvarchar](100) NULL,
	[ThongTinDD] [nvarchar](250) NULL,
	[Tinh] [nvarchar](100) NULL,
	[Nuoc] [nvarchar](100) NULL,
 CONSTRAINT [PK_DiaDiem] PRIMARY KEY CLUSTERED 
(
	[MaDiaDiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doan]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doan](
	[MaDoan] [int] IDENTITY(1,1) NOT NULL,
	[TenDoan] [nvarchar](250) NULL,
	[NoiDung] [nvarchar](250) NULL,
	[NgayDi] [date] NULL,
	[NgayKT] [date] NULL,
	[MaTour] [int] NULL,
	[TinhTrang] [nvarchar](100) NULL,
 CONSTRAINT [PK_Doan] PRIMARY KEY CLUSTERED 
(
	[MaDoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](250) NULL,
	[CMND] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[SoDT] [nvarchar](20) NULL,
 CONSTRAINT [PK_Table_1_1] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuaTrinhTour]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuaTrinhTour](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[TenTour] [nvarchar](100) NULL,
	[ThongTinTour] [nvarchar](255) NULL,
	[GiaTour] [decimal](18, 0) NULL,
	[NgayDi] [date] NULL,
	[NgayKT] [date] NULL,
 CONSTRAINT [PK_QuaTrinhTour] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tour]    Script Date: 23/12/2016 11:40:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[MaTour] [int] IDENTITY(1,1) NOT NULL,
	[TenTour] [nvarchar](100) NULL,
	[ThongTinTour] [nvarchar](255) NULL,
	[GiaTour] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[MaTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ChiTietDoan] ON 

GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (1, 1, 5)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (2, 2, 5)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (3, 3, 5)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (4, 4, 5)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (5, 5, 5)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (6, 6, 4)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (7, 7, 4)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (8, 8, 4)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (9, 9, 4)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (10, 10, 4)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (11, 11, 3)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (12, 12, 3)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (13, 13, 3)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (14, 14, 3)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (15, 15, 3)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (16, 16, 3)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (17, 1, 1)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (18, 2, 1)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (19, 3, 1)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (20, 4, 1)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (21, 5, 1)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (22, 6, 1)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (23, 7, 1)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (24, 8, 1)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (25, 1, 2)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (26, 2, 2)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (27, 3, 2)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (28, 4, 2)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (29, 5, 2)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (30, 21, 2)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (31, 6, 10)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (32, 7, 10)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (33, 8, 10)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (34, 9, 10)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (35, 10, 10)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (36, 16, 11)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (37, 17, 11)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (38, 18, 11)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (39, 19, 8)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (40, 20, 8)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (41, 19, 6)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (42, 20, 6)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (43, 17, 6)
GO
INSERT [dbo].[ChiTietDoan] ([Ma_CTDoan], [MaKH], [MaDoan]) VALUES (44, 18, 6)
GO
SET IDENTITY_INSERT [dbo].[ChiTietDoan] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietTour] ON 

GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (55, 2, 4)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (56, 2, 2)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (57, 2, 1)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (61, 4, 10)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (62, 4, 11)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (63, 4, 12)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (64, 4, 13)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (65, 5, 14)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (66, 5, 12)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (67, 5, 10)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (68, 6, 25)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (69, 6, 23)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (70, 6, 22)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (71, 6, 21)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (72, 7, 14)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (73, 7, 16)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (74, 7, 12)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (75, 8, 16)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (76, 8, 17)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (77, 8, 18)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (78, 9, 18)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (79, 9, 17)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (80, 9, 19)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (81, 10, 20)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (82, 10, 21)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (83, 10, 18)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (84, 11, 21)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (85, 11, 22)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (86, 12, 18)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (87, 12, 19)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (90, 14, 25)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (91, 14, 21)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (99, 15, 3)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (100, 15, 2)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (101, 16, 20)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (102, 16, 19)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (103, 16, 18)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (106, 13, 21)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (107, 13, 25)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (108, 17, 8)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (109, 17, 5)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (110, 18, 17)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (111, 18, 16)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (112, 1, 1)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (113, 1, 2)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (114, 1, 3)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (115, 3, 7)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (116, 3, 9)
GO
INSERT [dbo].[ChiTietTour] ([MaCTTour], [MaTour], [MaDiaDiem]) VALUES (117, 3, 6)
GO
SET IDENTITY_INSERT [dbo].[ChiTietTour] OFF
GO
SET IDENTITY_INSERT [dbo].[DiaDiem] ON 

GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (1, N'Khu di tích Pắc Bó', N'Có cảnh quan thiên nhiên tuyệt đẹp và có ý nghĩa Lịch sử, thăm quan hang Cốc Pó, suối Lê Nin, núi Các Mác…', N'Cao Bằng', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (2, N'Khu du lịch Hồ Ba Bể', N'Một trong 20 hồ tự nhiên lớn của thế giới, có vẻ đẹp tự nhiên và thẩm mỹ đặc biệt. Một số món đặc sản như thịt lớn gác bếp, xôi nếp nướng, miến dong, bánh coóc mò.', N'Bắc Kạn', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (3, N'Vịnh Hạ Long', N'Phong cảnh thiên nhiên được tạo hóa dựng nên một cách tự nhiên vô cùng tráng lệ. Du khách được đi thuyền trên vịnh để ngắm hàng loạt các hòn đảo đá vôi và phiến thạch có cấu trúc và hình dáng hùng vĩ.', N'Quảng Ninh', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (4, N'Đảo Cát Bà', N'Được mệnh danh là hòn ngọc của thành phố Hải Phòng, với những bãi tắm đẹp, thơ mộng với cát trắng mịn trải dài bên nhựng vách núi, nước biển trong xanh, song đều và khá mạnh.', N'Hải Phòng', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (5, N'Hoàng thành Thăng Long', N'Quần thể di tích gắn với lịch sử kinh thành Thăng Long – Hà Nội bắt đầu từ thời kỳ từ tiền Thăng Long. Là quần thể công trình kiến trúc đồ sộ được các triều vua xây dựng trong nhiều giai đoạn lịch sử..', N'Hà Nội', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (6, N'Cố đô Hoa Lư', N'Là kinh thành xưa của việt Nam dưới triều Đinh, Tam Cốc là một thắng cảnh tuyệt đẹp của tự nhiên, được ví như một Hạ Long thu nhỏ với hai bên là cảnh sông núi hữu tình.', N'Ninh Bình', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (7, N'Vườn quốc gia Phong Nha - Kẻ Bàng', N'Bên cạnh giá trị về lịch sử địa chất, địa hình, địa mạo, Phong Nha – Kẻ Bàng còn được thiên nhiên ưu đãi ban tặng cho những cảnh quan kì bí, hùng vĩ, ẩn chứa bao điều bí ẩn của tự nhiên.', N'Quảng Bình', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (8, N'Quần thể di tích Cố đô Huế', N'Đại Nội Huế (Hoàng Cung của 13 vị vua triều Nguyễn, triều đại phong kiến cuối cùng của Việt Nam: Ngọ Môn, Điện Thái Hoà, Tử Cấm Thành, Thế Miếu, Hiển Lâm Các, Cửu Đỉnh) và Chùa Thiên Mụ cổ kính, Chùa Huyền Không, Chùa Từ Đàm, Chùa Thiền Lâm', N'Huế', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (9, N'Bán đảo Sơn Trà', N'Sơn Trà là tên một bán đảo hình cây nấm, du khách được “lên rừng, xuống biển”, tắm biển ở bãi tắm Mỹ Khê, bãi Bụt; tham gia câu cá cùng ngư dân, lặn biển ngắm san hô; thăm hải đăng Tiên Sa.', N'Đà Nẵng', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (10, N'Đèo Hải Vân', N'Nổi tiếng là đường đèo đẹp nhất và cũng hiểm trở nhất Việt Nam, những phong cảnh ấn tượng về dải vờ biển tuyệt đẹp.', N'Đà Nẵng', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (11, N'Núi Bà Nà', N'Du khách sẽ được cảm nhận 4 mùa riêng biệt trong 1 ngày: Sáng – xuân, trưa- hạ, chiều – thu, tối – đông và luôn khô ráo vì ít khi bị mưa.', N'Đà Nẵng', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (12, N'Cù Lao Chàm', N'Khí hậu quanh năm mát mẻ, hệ động thực vật phong phú, đặc biệt là nguồn hải sản và nguồn tài nguyên yến sào, có rạn san hô đẹp.', N'Quảng Nam', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (13, N'Thánh địa Mỹ Sơn', N'Một trong những di sản văn hóa thế giới. Thánh địa Mỹ Sơn mang trong mình một vẻ đẹp cổ kính với hơn 70 công trình kiến trúc là các đền tháp của nền văn hóa Chăm Pa cũ vẫn trường tồn theo thời gian, được chiêm ngưỡng vẻ đẹp của điệu múa.', N'Quảng Nam', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (14, N'Phố cổ Hội An', N'Đô thị cổ Hội An ngày nay là một điển hình đặc biệt về cảng thị truyền thống ở Đông Nam Á được bảo tồn nguyên vẹn và chu đáo. Phần lớn những ngôi nhà ở đây là những kiến trúc truyền thống, phần bố dọc theo những trục phố nhỏ hẹp.', N'Quảng Nam', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (16, N'Biển Nha Trang', N'Biển Nha Trang tuyệt vời với Vinpearl Nha Trang 5* sang trọng, hòn Mun Hòn Tằm nước trong veo và san hô lộng lẫy, cùng với vịnh Ninh Vân, vịnh Vân Phong hoang sơ và thuần khiết. ', N'Khánh Hòa', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (17, N'Đà Lạt', N'Đà Lạt là thủ phủ của tỉnh Lâm Đồng, từng một thời nổi tiếng với các điểm tham quan như Thung lũng Tình Yêu, Hồ Than Thở, Đồi Thông Hai Mộ, Thác Voi…', N'Lâm Đồng', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (18, N'Mũi Né – Phan Thiết', N'Nơi đây nổi tiếng với những con đường rợp bóng dừa, những bãi biển đẹp, những vách đá nơi sóng biển không thôi vỗ về, những cồn cát rực rỡ trong nắng – là nguồn cảm hứng vô tận của nghệ sỹ nghiếp.', N'Bình Thuận', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (19, N'Côn Đảo', N'Côn Đảo được nhiều du khách đánh giá là thiên đường của nghỉ dưỡng và khám phá thiên nhiên (rừng và biển). Có giá trị di tích lịch sử quan trọng, bãi biển đẹp, nước biển trong xanh, rừng xanh ngát, ẩm thực và hải sản phong phú.', N'Bà Rịa-Vũng Tàu', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (20, N'Di tích lịch sử Dinh Độc Lập', N'Nơi in đậm dấu ấn thời gian và lịch sửa nhưng cũng rất nên thơ và lãng mạn…. Vẻ đẹp kiến trúc của dinh còn được thể hiện bởi hệ thống rèm hoa đá, mang hình dáng những đốt trúc thanh tao.', N'TP.Hồ Chí Minh', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (21, N'Vườn quốc gia Tràm Chim

', N'Được bao phủ bởi màu xanh ngút ngàn của những cánh rừng Tràm,  loài chim Sếu đầu đỏ nổi tiếng trên thế giới và vô vàn loài động thực vật quý hiếm khác.', N'Đồng Tháp', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (22, N'Chợ nổi Cái Răng', N'Là chợ nổi chuyên trao đổi, mua bán nông sản, các loại trái cây, hàng hóa, thực phẩm, ăn uống. Bên cạnh việc buôn bán nông sản, các dịch vụ như ở một khu chợ bình thường trên cạn cũng khá đầy đủ với ghe thuyền .', N'Cần Thơ', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (23, N'Đảo Phú Quốc', N'Phú Quốc là quần đảo xinh đẹp, hòn đảo lớn nhất của Việt Nam, Nước biển trong vắt, những dòng suối yên bình cùng nhiều hải sản độc đáo.', N'Kiên Giang', N'Việt Nam')
GO
INSERT [dbo].[DiaDiem] ([MaDiaDiem], [TenDiaDiem], [ThongTinDD], [Tinh], [Nuoc]) VALUES (25, N'Đất mũi Cà Mau', N'Là nơi cuối cùng của tổ quốc để cảm nhận hết cái “chất” của vùng Đồng Bằng Sông Cửu Long rộng lớn với hệ sinh thái rừng ngập mặn rất đa dạng và phong phú. Du khách được thăm cột mốc toạ độ quốc gia, ngắm rừng, ngắm biển, chiêm ngưỡng ráng chiều.', N'Cà Mau', N'Việt Nam')
GO
SET IDENTITY_INSERT [dbo].[DiaDiem] OFF
GO
SET IDENTITY_INSERT [dbo].[Doan] ON 

GO
INSERT [dbo].[Doan] ([MaDoan], [TenDoan], [NoiDung], [NgayDi], [NgayKT], [MaTour], [TinhTrang]) VALUES (1, N'Đoàn 5', N'Đi chơi', CAST(0x263C0B00 AS Date), CAST(0x293C0B00 AS Date), 1, N'Chờ')
GO
INSERT [dbo].[Doan] ([MaDoan], [TenDoan], [NoiDung], [NgayDi], [NgayKT], [MaTour], [TinhTrang]) VALUES (2, N'Đoàn 3', N'Đi chơi', CAST(0x2D3C0B00 AS Date), CAST(0x363C0B00 AS Date), 1, N'Đang đi')
GO
INSERT [dbo].[Doan] ([MaDoan], [TenDoan], [NoiDung], [NgayDi], [NgayKT], [MaTour], [TinhTrang]) VALUES (3, N'Đoàn 4', N'Đi chơi', CAST(0x273C0B00 AS Date), CAST(0x483C0B00 AS Date), 1, N'Kết thúc')
GO
INSERT [dbo].[Doan] ([MaDoan], [TenDoan], [NoiDung], [NgayDi], [NgayKT], [MaTour], [TinhTrang]) VALUES (4, N'Đoàn N', N'Đi chơi', CAST(0x3A3C0B00 AS Date), CAST(0x3D3C0B00 AS Date), 1, N'Kết thúc')
GO
INSERT [dbo].[Doan] ([MaDoan], [TenDoan], [NoiDung], [NgayDi], [NgayKT], [MaTour], [TinhTrang]) VALUES (5, N'Đoàn 10', N'DL', CAST(0x383C0B00 AS Date), CAST(0x3F3C0B00 AS Date), 1, N'Chờ')
GO
INSERT [dbo].[Doan] ([MaDoan], [TenDoan], [NoiDung], [NgayDi], [NgayKT], [MaTour], [TinhTrang]) VALUES (6, N'Đoàn 1', N'Du Lịch', CAST(0x0C3C0B00 AS Date), CAST(0x0F3C0B00 AS Date), 3, N'Chờ')
GO
INSERT [dbo].[Doan] ([MaDoan], [TenDoan], [NoiDung], [NgayDi], [NgayKT], [MaTour], [TinhTrang]) VALUES (7, N'Đoàn 2', N'Du Lịch', CAST(0x353C0B00 AS Date), CAST(0x393C0B00 AS Date), 4, N'Chờ')
GO
INSERT [dbo].[Doan] ([MaDoan], [TenDoan], [NoiDung], [NgayDi], [NgayKT], [MaTour], [TinhTrang]) VALUES (8, N'Đoàn 2', N'Du lịch di động', CAST(0x353C0B00 AS Date), CAST(0x383C0B00 AS Date), 3, N'Chờ')
GO
INSERT [dbo].[Doan] ([MaDoan], [TenDoan], [NoiDung], [NgayDi], [NgayKT], [MaTour], [TinhTrang]) VALUES (9, N'Đoàn 1', N'Du Lịch', CAST(0x343C0B00 AS Date), CAST(0x373C0B00 AS Date), 4, N'Chờ')
GO
INSERT [dbo].[Doan] ([MaDoan], [TenDoan], [NoiDung], [NgayDi], [NgayKT], [MaTour], [TinhTrang]) VALUES (10, N'Đoàn 1', N'Du lịch gia đình', CAST(0x053C0B00 AS Date), CAST(0x083C0B00 AS Date), 2, N'Kết thúc')
GO
INSERT [dbo].[Doan] ([MaDoan], [TenDoan], [NoiDung], [NgayDi], [NgayKT], [MaTour], [TinhTrang]) VALUES (11, N'Đoàn 2', N'Du Lịch', CAST(0x083C0B00 AS Date), CAST(0x0A3C0B00 AS Date), 2, N'Đang đi')
GO
SET IDENTITY_INSERT [dbo].[Doan] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (1, N'Đào Văn Tý', N'123456789', N'TPHCM', N'Nam', N'0123456789')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (2, N'Nguyễn Văn Tèo', N'321654987', N'TPHCM', N'Nam', N'0967582469')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (3, N'Lê Thị Mận', N'357489621', N'TPHCM', N'Nữ', N'0125587963')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (4, N'Phạm Trần Du', N'333555999', N'TPHCM', N'Nam', N'0908345621')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (5, N'Trần Thị Nga', N'123123123', N'TPHCM', N'Nữ', N'0919564234')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (6, N'Lê Văn Ba', N'111222333', N'Hà Nội', N'Nam', N'0164523789')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (7, N'Nguyễn Thị Ba', N'666555444', N'Đà Nẵng', N'Nữ', N'0166987523')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (8, N'Lê Văn Bốn', N'359786543', N'Huế', N'Nam', N'0168954623')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (9, N'Lê Văn Hai', N'364589216', N'Khánh Hòa', N'Nam', N'05646486423')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (10, N'Đào Thị Duyên', N'365498756', N'Bắc Ninh', N'Nữ', N'0975689452')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (11, N'Đào Thị Phương Duyên', N'369875241', N'Hà Nội', N'Nữ', N'0169845264')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (12, N'Trần Thị Thu Thủy', N'396548365', N'Hà Nội', N'Nữ', N'01658899444')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (13, N'Trần Văn Nhân', N'369875243', N'Đà Nẵng', N'Nam', N'01236448997')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (14, N'Phạm Tuấn Dư', N'369875212', N'Hà Nội', N'Nam', N'0132564895')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (15, N'Nguyễn Thị Thanh Nhàn', N'312564895', N'Khánh Hòa', N'Nữ', N'0123695487')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (16, N'Nguyễn Thị Mơ', N'362154236', N'Huế', N'Nữ', N'0826545689')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (17, N'Đào Thị Mộng Mơ', N'956423145', N'Bắc Ninh', N'Nữ', N'0123654897')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (18, N'Phan Huy Lâm', N'369852147', N'Bắc Ninh', N'Nam', N'0123951235')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (19, N'Phan Khải Toàn', N'951753842', N'Khánh Hòa', N'Nam', N'0962125896')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (20, N'Nguyễn Văn Khuyết', N'123852963', N'Huế', N'Nam', N'01645879520')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [DiaChi], [GioiTinh], [SoDT]) VALUES (21, N'Lê Văn Vũ', N'123845962', N'Đà Nẵng', N'Nam', N'0635946582')
GO
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[QuaTrinhTour] ON 

GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (1, 16, N'Tour Đảo Cát Bà-Hồ Ba Bể-Pắc Bó', N'Du lịch gia đình', CAST(5000000 AS Decimal(18, 0)), CAST(0x083C0B00 AS Date), CAST(0x0A3C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (2, 17, N'Tour Đảo Cát Bà-Hồ Ba Bể-Pắc Bó', N'Du lịch gia đình', CAST(5000000 AS Decimal(18, 0)), CAST(0x083C0B00 AS Date), CAST(0x0A3C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (3, 18, N'Tour Đảo Cát Bà-Hồ Ba Bể-Pắc Bó', N'Du lịch gia đình', CAST(5000000 AS Decimal(18, 0)), CAST(0x083C0B00 AS Date), CAST(0x0A3C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (4, 1, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x2D3C0B00 AS Date), CAST(0x363C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (5, 2, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x2D3C0B00 AS Date), CAST(0x363C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (6, 3, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x2D3C0B00 AS Date), CAST(0x363C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (7, 4, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x2D3C0B00 AS Date), CAST(0x363C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (8, 5, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x2D3C0B00 AS Date), CAST(0x363C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (9, 21, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x2D3C0B00 AS Date), CAST(0x363C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (10, 6, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x3A3C0B00 AS Date), CAST(0x3D3C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (11, 7, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x3A3C0B00 AS Date), CAST(0x3D3C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (12, 8, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x3A3C0B00 AS Date), CAST(0x3D3C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (13, 9, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x3A3C0B00 AS Date), CAST(0x3D3C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (14, 10, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x3A3C0B00 AS Date), CAST(0x3D3C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (15, 11, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x273C0B00 AS Date), CAST(0x483C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (16, 12, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x273C0B00 AS Date), CAST(0x483C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (17, 13, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x273C0B00 AS Date), CAST(0x483C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (18, 14, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x273C0B00 AS Date), CAST(0x483C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (19, 15, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x273C0B00 AS Date), CAST(0x483C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (20, 16, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x273C0B00 AS Date), CAST(0x483C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (21, 1, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x2D3C0B00 AS Date), CAST(0x363C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (22, 2, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x2D3C0B00 AS Date), CAST(0x363C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (23, 3, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x2D3C0B00 AS Date), CAST(0x363C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (24, 4, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x2D3C0B00 AS Date), CAST(0x363C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (25, 5, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x2D3C0B00 AS Date), CAST(0x363C0B00 AS Date))
GO
INSERT [dbo].[QuaTrinhTour] ([Ma], [MaKH], [TenTour], [ThongTinTour], [GiaTour], [NgayDi], [NgayKT]) VALUES (26, 21, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)), CAST(0x2D3C0B00 AS Date), CAST(0x363C0B00 AS Date))
GO
SET IDENTITY_INSERT [dbo].[QuaTrinhTour] OFF
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (1, N'Tour Pắc Bó-Hồ Ba Bể-Vịnh Hạ Long', N'Du lịch', CAST(1000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (2, N'Tour Đảo Cát Bà-Hồ Ba Bể-Pắc Bó', N'Du lịch gia đình', CAST(5000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (3, N'Tour Phong Nha Kẻ Bàng-Sơn Trà-Hoa Lư', N'Du lịch xã hội và lịch sử', CAST(3500000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (4, N'Tour Hải Vân-Bà Nà-Cù Lao Chàm-Mỹ Sơn', N'Du lịch xã hội và gia đình', CAST(3500000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (5, N'Tour Hội An-Cù Lao Chàm-Hải Vân', N'Du lịch xã hội và lịch sử', CAST(6000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (6, N'Tour Cà Mau-Phú Quốc-Cái Răng-Tràm Chim', N'Du lịch sông nước', CAST(4500000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (7, N'Tour Hội An-Nha Trang-Cù Lao Chàm', N'Du lịch', CAST(4000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (8, N'Tour Nha Trang-Đà Lạt-Mũi Né Phan Thiết', N'Du lịch nghỉ mát', CAST(1500000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (9, N'Tour Mũi Né Phan Thiết-Đà Lạt-Côn Đảo', N'Du lịch nghỉ mát', CAST(2500000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (10, N'Tour Dinh Độc Lập-Tràm Chim- Mũi Né Phan Thiết', N'Du lịch lịch sử', CAST(3500000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (11, N'Tour Tràm Chim-Cái Răng', N'Du lịch sông nước', CAST(6000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (12, N'Tour Mũi Né Phan Thiết-Côn Đảo', N'Du lịch biển', CAST(1000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (13, N'Tour Tràm Chim-Cà Mau', N'Du lịch sinh thái', CAST(2000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (14, N'Tour Cà Mau-Tràm Chim', N'Du lịch sinh thái', CAST(2000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (15, N'Tour Vịnh Hạ Long-Hồ Ba Bể', N'Du lịch gia đình', CAST(1500000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (16, N'Tour Dinh Độc Lập-Côn Đảo-Mũi Né Phan Thiết', N'Du lịch xã hội và lịch sử', CAST(3500000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (17, N'Tour Cố đô Huế-Thăng Long', N'Du lịch xã hội và lịch sử', CAST(3000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Tour] ([MaTour], [TenTour], [ThongTinTour], [GiaTour]) VALUES (18, N'Tour Đà Lạt-Nha Trang', N'Du lịch nghỉ mát', CAST(4000000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
ALTER TABLE [dbo].[ChiTietDoan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDoan_Doan] FOREIGN KEY([MaDoan])
REFERENCES [dbo].[Doan] ([MaDoan])
GO
ALTER TABLE [dbo].[ChiTietDoan] CHECK CONSTRAINT [FK_ChiTietDoan_Doan]
GO
ALTER TABLE [dbo].[ChiTietDoan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDoan_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[ChiTietDoan] CHECK CONSTRAINT [FK_ChiTietDoan_KhachHang]
GO
ALTER TABLE [dbo].[ChiTietTour]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietTour_DiaDiem] FOREIGN KEY([MaDiaDiem])
REFERENCES [dbo].[DiaDiem] ([MaDiaDiem])
GO
ALTER TABLE [dbo].[ChiTietTour] CHECK CONSTRAINT [FK_ChiTietTour_DiaDiem]
GO
ALTER TABLE [dbo].[ChiTietTour]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietTour_Tour] FOREIGN KEY([MaTour])
REFERENCES [dbo].[Tour] ([MaTour])
GO
ALTER TABLE [dbo].[ChiTietTour] CHECK CONSTRAINT [FK_ChiTietTour_Tour]
GO
ALTER TABLE [dbo].[Doan]  WITH CHECK ADD  CONSTRAINT [FK_Doan_Tour] FOREIGN KEY([MaTour])
REFERENCES [dbo].[Tour] ([MaTour])
GO
ALTER TABLE [dbo].[Doan] CHECK CONSTRAINT [FK_Doan_Tour]
GO
ALTER TABLE [dbo].[QuaTrinhTour]  WITH CHECK ADD  CONSTRAINT [FK_QuaTrinhTour_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[QuaTrinhTour] CHECK CONSTRAINT [FK_QuaTrinhTour_KhachHang]
GO
USE [master]
GO
ALTER DATABASE [QuanLyTour] SET  READ_WRITE 
GO
