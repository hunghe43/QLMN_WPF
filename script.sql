USE [master]
GO
/****** Object:  Database [QLMamNonTC]    Script Date: 2018/01/19 16:49:37 ******/
CREATE DATABASE [QLMamNonTC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLMamNonTC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLMamNonTC.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLMamNonTC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLMamNonTC_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLMamNonTC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLMamNonTC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLMamNonTC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLMamNonTC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLMamNonTC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLMamNonTC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLMamNonTC] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLMamNonTC] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLMamNonTC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLMamNonTC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLMamNonTC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLMamNonTC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLMamNonTC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLMamNonTC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLMamNonTC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLMamNonTC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLMamNonTC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLMamNonTC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLMamNonTC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLMamNonTC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLMamNonTC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLMamNonTC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLMamNonTC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLMamNonTC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLMamNonTC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLMamNonTC] SET  MULTI_USER 
GO
ALTER DATABASE [QLMamNonTC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLMamNonTC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLMamNonTC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLMamNonTC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLMamNonTC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLMamNonTC]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaChucVu] [varchar](20) NOT NULL,
	[TenChucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CT_DichVu_HocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_DichVu_HocSinh](
	[MaCT_DV_HS] [varchar](20) NOT NULL,
	[MaHocSinh] [varchar](20) NOT NULL,
	[MaDichVu] [varchar](20) NOT NULL,
	[ThangDangKy] [varchar](7) NOT NULL,
 CONSTRAINT [PK_CT_DichVu_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaCT_DV_HS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CT_NgayTheoDoi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_NgayTheoDoi](
	[MaPhieuTheoDoi] [int] NOT NULL,
	[MaHocSinh] [varchar](20) NOT NULL,
	[DDVang] [bit] NOT NULL CONSTRAINT [DF_CT_NgayTheoDoi_DDVang]  DEFAULT ((0)),
	[DDAnSang] [bit] NOT NULL CONSTRAINT [DF_CT_NgayTheoDoi_DDAnSang]  DEFAULT ((0)),
	[DDAnTrua] [bit] NOT NULL CONSTRAINT [DF_CT_NgayTheoDoi_DDAnTrua]  DEFAULT ((0)),
	[GhiChu] [nvarchar](100) NULL,
	[ChiPhi] [money] NULL,
 CONSTRAINT [PK_CT_NgayTheoDoi] PRIMARY KEY CLUSTERED 
(
	[MaPhieuTheoDoi] ASC,
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CT_PhieuThu_HocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_PhieuThu_HocSinh](
	[MaCT_PhieuThu_HocSinh] [varchar](20) NOT NULL,
	[TenLoaiPhi] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[ChiPhi] [money] NULL,
	[MaPhieuThu] [varchar](20) NULL,
 CONSTRAINT [PK_CT_PhieuThu_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaCT_PhieuThu_HocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DichVuNgoai]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DichVuNgoai](
	[MaDichVu] [varchar](20) NOT NULL,
	[TenDV] [nvarchar](50) NOT NULL,
	[ChiPhi] [money] NULL CONSTRAINT [DF_DichVuNgoai_ChiPhi]  DEFAULT ((0)),
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_DichVuNgoai] PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HocPhi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocPhi](
	[MaHocPhi] [varchar](20) NOT NULL,
	[TenHocPhi] [nvarchar](50) NOT NULL,
	[ChiPhi] [money] NOT NULL CONSTRAINT [DF_HocPhi_ChiPhi]  DEFAULT ((0)),
	[GhiChu] [nvarchar](100) NULL,
	[LoaiHocphi] [varchar](20) NULL,
 CONSTRAINT [PK_HocPhi] PRIMARY KEY CLUSTERED 
(
	[MaHocPhi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocSinh](
	[MaHocSinh] [varchar](20) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[ChieuCao] [int] NULL,
	[CanNang] [int] NULL,
	[TenPhuHuynh] [nvarchar](50) NULL,
	[SoCmt] [nvarchar](50) NULL,
	[Sdt] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[NgaySinhPhuHuynh] [date] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[MaLop] [varchar](20) NULL,
	[DoiTuongMTA] [bit] NULL CONSTRAINT [DF_HocSinh_DoiTuongMTA]  DEFAULT ((0)),
	[TrangThai] [bit] NULL CONSTRAINT [DF_HocSinh_TrangThai]  DEFAULT ((0)),
 CONSTRAINT [PK_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiHocPhi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiHocPhi](
	[MaLoai] [varchar](20) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_LoaiHocPhi] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [varchar](20) NOT NULL,
	[TenLop] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
	[SiSo] [int] NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [varchar](20) NOT NULL CONSTRAINT [DF_NhanVien_MaNhanVien]  DEFAULT ('DBO.AUTO_IDNhanVien'),
	[TenNhanVien] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Sdt] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[MaChucVu] [varchar](20) NULL,
	[MaLop] [varchar](20) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuChiTieu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuChiTieu](
	[MaPhieuChiTieu] [varchar](20) NOT NULL,
	[NgayTaoPhieu] [date] NULL,
	[MaNhanVien] [varchar](20) NULL,
	[LyDo] [nvarchar](100) NULL,
	[ChiPhi] [money] NULL,
	[ChungTu] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhieuChiTieu] PRIMARY KEY CLUSTERED 
(
	[MaPhieuChiTieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuTheoDoi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuTheoDoi](
	[MaPhieuTheoDoi] [int] IDENTITY(1,1) NOT NULL,
	[MaGiaoVien] [varchar](20) NOT NULL,
	[NgayTheoDoi] [date] NOT NULL,
	[ChiPhiDuTinh] [money] NULL,
 CONSTRAINT [PK_PhieuTheoDoi_1] PRIMARY KEY CLUSTERED 
(
	[MaPhieuTheoDoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuThu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuThu](
	[MaPhieuThu] [varchar](20) NOT NULL,
	[NgayTaoPhieu] [varchar](7) NOT NULL,
	[MaHocSinh] [varchar](20) NOT NULL,
	[MaNhanVien] [varchar](20) NOT NULL,
	[GhiChu] [varchar](100) NULL,
 CONSTRAINT [PK_PhieuThu] PRIMARY KEY CLUSTERED 
(
	[MaPhieuThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [varchar](50) NOT NULL,
	[MoTa] [nvarchar](50) NULL,
	[ParentId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quyen_ChucVu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quyen_ChucVu](
	[MaChucVu] [varchar](20) NOT NULL,
	[MaQuyen] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Quyen_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC,
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'ADMIN', N'SupperAdmin')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'asdasd', N'asdsdwd')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'GVC', N'Giáo viên chính')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'GVP', N'Giáo viên phụ')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'KETOAN', N'kế toán')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'TONUOI', N'Tổ nuôi')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-13EAF9', N'5', N'DV-506', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-1D9CAA', N'1', N'DV-506', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-22EF2C', N'2', N'DV-507', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-2347CE', N'1', N'DV-516', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-3C3B36', N'5', N'DV-516', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-6B1141', N'2', N'DV-516', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-E1B09B', N'5', N'DV-507', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-E29A88', N'3', N'DV-507', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-E922E4', N'1', N'DV-507', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-F81C06', N'2', N'DV-506', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-FDB108', N'3', N'DV-506', N'12/2017')
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (62, N'2', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (62, N'4', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (62, N'5', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (62, N'HS-8CC', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (62, N'HS-ADF', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (63, N'2', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (63, N'4', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (63, N'5', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (63, N'HS-8CC', 1, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (63, N'HS-ADF', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-4DF7', N'Học phí', 1, 300.0000, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-4EF2', N'Bán trú', 1, 50.0000, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-8A8F', N'Aerobic', 1, 100.0000, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-97DD', N'Ăn trưa', 10, 15.0000, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-B152', N'Ăn sáng', 10, 15.0000, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-D762', N'Vắng', 4, 15.0000, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-F149', N'Môn Vẽ', 1, 100.0000, NULL)
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'DV-506', N'Môn Vẽ', 100.0000, N'Môn vẽ nghệ thuật, tăng khả năng sáng tạo..')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'DV-507', N'Aerobic', 100.0000, N'môn nghệ thuật aerobic')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'DV-516', N'Môn tạo hình', 100.0000, N'Môn tạo hình tăng khả năng sáng tạo và tư duy')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'DV-938', N'Học thêm thứ 7', 100.0000, N'Học bồi dưỡng thêm vào cuối tuần')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'DV-BCD', N'Môn tiếng Anh', 100.0000, N'bổ sung kiến thức môn tiếng anh')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'DV-506', N'Môn Vẽ', 100.0000, NULL, N'LoaiHocPhi-472E')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'DV-507', N'Aerobic', 100.0000, NULL, N'LoaiHocPhi-472E')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'DV-516', N'Môn tạo hình', 100.0000, NULL, N'LoaiHocPhi-472E')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'DV-938', N'Học thêm thứ 7', 100.0000, NULL, N'LoaiHocPhi-472E')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'DV-BCD', N'Môn tiếng Anh', 100.0000, NULL, N'LoaiHocPhi-472E')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-373', N'Bán trú', 50.0000, NULL, N'LoaiHocPhi-2FAA')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-8BF', N'Ăn Trưa', 15.0000, NULL, N'LoaiHocPhi-4E')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-B48', N'Cơ sở vật chất', 200.0000, NULL, N'LoaiHocPhi-20D1')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-C5S', N'Học 1 buổi', 50.0000, NULL, N'LoaiHocPhi-4E')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-CC3', N'Ăn Sáng', 15.0000, NULL, N'LoaiHocPhi-4E')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-ED3', N'Học phí', 300.0000, NULL, N'LoaiHocPhi-2FAA')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-FCE', N'Xây dựng', 200.0000, NULL, N'LoaiHocPhi-20D1')
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'1', N'Nguyễn AKa', CAST(N'1994-01-12' AS Date), N'bé gầ', N'nam', N'học tập tốt, ngoan ngoan, nghe lời thầy cô', 75, 30, N'Nguyễn Cha A', N'173363724', N'01676983088', N'hungth11b@gmail', CAST(N'1966-11-02' AS Date), N'bé gầy và ăn ít, hay ho và ốm', N'MGLB', 0, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'111', N'John Hammond', CAST(N'1966-11-02' AS Date), N'', N'nam', N'tốt', 143, 45, N'hùng', N'123123123', N'167698388', N'hungth11b@gmail.com', CAST(N'1966-11-02' AS Date), N'', N'MGLB', 0, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'2', N'Nguyễn A1', CAST(N'2000-12-31' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa	', N'nghịch ngợm, lười ăn...', 160, 44, N'Nguyễn cha A1', N'173363724', N'1111111111', N'hung@gd.com', CAST(N'1966-12-31' AS Date), N'bé gầy và ăn ít, hay ho và ốm', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'222', N'John Hammond', CAST(N'1966-11-02' AS Date), N'nam', N'43 trần nhật duật', N'tốt', 143, 45, N'hùng', N'123123123', N'167698388', N'hungth11b@gmail.com', CAST(N'1966-11-02' AS Date), NULL, N'MGLA', 0, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'3', N'Nguyễn A3', CAST(N'1994-12-31' AS Date), N'thích', N'thích', N'học tập tốt, ngoan ngoan, nghe lời thầy cô', 130, 34, N'Nguyễn Cha A2', N'177372321', N'01676983088', N'hung@gds.com', CAST(N'1996-12-31' AS Date), N'thích ăn rau củ', N'MGLA', 0, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'333', N'John Hammond', CAST(N'1966-11-02' AS Date), N'', N'nam', N'tốt', 143, 45, N'hùng', N'123123123', N'167698388', N'hungth11b@gmail.com', CAST(N'1966-11-02' AS Date), N'', N'MGLA', 0, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'4', N'Nguyễn A4', CAST(N'1994-12-31' AS Date), N'Nam', N'Nguyễn ích khiêm', N'học tốt, ngon...', 130, 37, N'Nguyễn văn Dũng', N'87686', N'1231231231', N'hung@gd.com', CAST(N'1945-12-31' AS Date), N'thiếu cân, gầy', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'5', N'hung5', CAST(N'1999-12-31' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', N'học tốt', 133, 40, N'Nguyễn văn Cha a', N'1212312312', N'1231231231', N'hung@gd.com', CAST(N'1956-12-31' AS Date), NULL, N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'6', N'hùng 6', CAST(N'1999-12-31' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', N'tốt', 134, 43, N'nguyễn văn thiên a', N'87686', N'01676983088', N'hung@gd.com', CAST(N'1954-12-31' AS Date), N'không có j', N'MGLA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'7', N'hung7', CAST(N'2017-12-31' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', N'Học giỏi', 0, 0, N'nguyễn văn thiên aa', N'87686', N'01676983088', N'hung@gd.com', CAST(N'2017-12-31' AS Date), N'lười ăn', N'MGLA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'8', N'hùng 8', CAST(N'2000-12-31' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', N'chưa có thông tin', 123, 34, N'Nguyễn thị gái', N'1212312312', N'01676983088', N'hung@gda.com', CAST(N'1966-12-31' AS Date), N'chưa có thông tin', N'MGLA', 0, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'9', N'hùng 9', CAST(N'1993-12-31' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', NULL, 142, 44, N'nguyễn văn thành', N'87686', N'01676983088', N'hqung@gd.com', CAST(N'1988-12-31' AS Date), NULL, N'MGNA', 0, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'HS-8CC', N'hung2', CAST(N'1999-12-31' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', NULL, 145, 43, N'nguyễn văn thiên', N'1212312312', N'01676983088', N'hung@gmaia.com', CAST(N'1977-11-01' AS Date), NULL, N'BE', 0, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'HS-ADF', N'nguyễn thị lý', CAST(N'1994-12-31' AS Date), N'Nữ', N'43 trần quốc haonf', NULL, 55, 36, N'Nguyễn dương', N'1212312312', N'12312312321', N'h1ugnth11b@gmail.com', CAST(N'1966-12-31' AS Date), N'học sinh mới', N'BE', 0, 0)
INSERT [dbo].[LoaiHocPhi] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'LoaiHocPhi-20D1', N'Học phí đầu năm', N'Các khoản bắt buộc đóng đầu năm học, như tiền xây dựng, cơ sở vật chất')
INSERT [dbo].[LoaiHocPhi] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'LoaiHocPhi-2FAA', N'Đóng theo tháng', N'Các khoản bắt buộc đóng theo tháng, như học phí, đồ dùng cá nhân ...')
INSERT [dbo].[LoaiHocPhi] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'LoaiHocPhi-472E', N'Đóng theo nguyện vọng phụ huynh', N'Các khoản phụ thuộc vào sự đồng ý của các bậc phụ huynh, như học thêm, dịch vụ xã hội')
INSERT [dbo].[LoaiHocPhi] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'LoaiHocPhi-4E', N'Học phí mặc định', N'Các khoản ăn uống trong ngày')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'BE', N'Mẫu giáo bé', N'Các bé từ 25-36 tháng tuổi', 20)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'MGLA', N'Mẫu giáo lớn A', N'Các bé từ 4-5 tuổi', 25)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'MGLB', N'Mẫu giáo lớn B', N'Các bé từ 4-5 tuổi', 25)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'MGNA', N'Mẫu giáo nhỡ A', N'Các bé từ 3-4 tuổi', 27)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'MGNB', N'Mẫu giáo nhỡ B', N'Các bé từ 3-4 tuổi', 29)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'NHATREA', N'Lớp trẻ A ', N'Các bé từ 2-3 tuổi', 26)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'NHATREB', N'Lớp trẻ B ', N'Các bé từ 2-3 tuổi', 23)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'Admin', N'Admin', NULL, N'01676983088', N'admin@gmail.com', N'ADMIN', NULL, N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV1', N'Nguyễn Chính', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa ', N'01676983088 ', N'giaovien@gmail.com', N'GVC', N'BE', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV10', N'giáo viên 10', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'MGNB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV11', N'giáo viên 11', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'giaovienphunhob@gmail.com', N'GVP', N'MGNB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV12', N'giáo viên 12', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'NHATREA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV13', N'giáo viên13', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'NHATREA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV14', N'giáo viên14', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'NHATREB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV15', N'giáo viên15', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'NHATREB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV2', N'Nguyễn Phụ', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'giaovienphu@gmail.com', N'GVP', N'BE', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV3', N'Nguyễn Phụ Phụ', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'BE', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV4', N'giáo viên 4', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'MGLA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV5', N'giáo viên 5', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'MGLA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV6', N'giáo viên 6', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'MGLB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV7', N'giáo viên 7', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'MGLB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV8', N'giáo viên 8', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'MGNA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV9', N'giáo viên 9', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'MGNA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'KT1', N'kế toán', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'ketoan@gmail.com', N'KETOAN', NULL, N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'TN1', N'tổ nuôi', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'tonuoi@gmail.com', N'TONUOI', NULL, N'123123')
INSERT [dbo].[PhieuChiTieu] ([MaPhieuChiTieu], [NgayTaoPhieu], [MaNhanVien], [LyDo], [ChiPhi], [ChungTu]) VALUES (N'1', CAST(N'2017-12-19' AS Date), N'GV1', N'sdff', 0.0000, N'0')
INSERT [dbo].[PhieuChiTieu] ([MaPhieuChiTieu], [NgayTaoPhieu], [MaNhanVien], [LyDo], [ChiPhi], [ChungTu]) VALUES (N'2', CAST(N'2017-12-19' AS Date), N'GV2', N'sdff', 0.0000, N'0')
INSERT [dbo].[PhieuChiTieu] ([MaPhieuChiTieu], [NgayTaoPhieu], [MaNhanVien], [LyDo], [ChiPhi], [ChungTu]) VALUES (N'ChiTieu-090E', CAST(N'2018-01-10' AS Date), N'KT1', N'a', 4.0000, NULL)
INSERT [dbo].[PhieuChiTieu] ([MaPhieuChiTieu], [NgayTaoPhieu], [MaNhanVien], [LyDo], [ChiPhi], [ChungTu]) VALUES (N'ChiTieu-3920', CAST(N'2018-01-10' AS Date), N'KT1', N'a', 4.0000, NULL)
INSERT [dbo].[PhieuChiTieu] ([MaPhieuChiTieu], [NgayTaoPhieu], [MaNhanVien], [LyDo], [ChiPhi], [ChungTu]) VALUES (N'ChiTieu-80F9', CAST(N'2018-01-10' AS Date), N'KT1', N'a', 4.0000, NULL)
SET IDENTITY_INSERT [dbo].[PhieuTheoDoi] ON 

INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (62, N'GV1', CAST(N'2018-01-01' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (63, N'GV1', CAST(N'2018-01-02' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[PhieuTheoDoi] OFF
INSERT [dbo].[PhieuThu] ([MaPhieuThu], [NgayTaoPhieu], [MaHocSinh], [MaNhanVien], [GhiChu]) VALUES (N'PhieuThu-938', N'12/2017', N'1', N'KT1', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien', N'Nghiệp vụ giáo viên', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-DiemDanh', N'Giáo viên điển danh', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-Index', N'Xem trang chủ giáo viên', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-Partial_DanhSachHocSinh', N'GiaoVien xem danh sách học sinh', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-Partial_DiemDanhLop', N'Hiển thi điểm danh', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi', N'Quản lý học phí', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-AddHocPhi', N'Thêm mới học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-AddLoaiHocPhi', N'Thêm mới loại học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-DeleteHocPhi', N'Xóa học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-DeleteLoaiHocPhi', N'Xóa loại học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-Index', N'Xem trang chủ quản lý học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-UpdateHocPhi', N'Sửa học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-UpdateLoaiHocPhi', N'Sửa loại học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocSinh', N'Quản lý học sinh', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocSinh-Add', N'Thêm mới học sinh', N'HocSinh')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocSinh-Delete', N'Xóa học sinh', N'HocSinh')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocSinh-Detail', N'Xem chi tiết học sinh', N'HocSinh')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocSinh-Index', N'Xem trang chủ quản lý học sinh', N'HocSinh')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocSinh-Update', N'Sửa học sinh', N'HocSinh')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HomeAdmin', N'Nghiệp vụ Admin', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HomeAdmin-Index', N'Xem trang chủ quản trị', N'HomeAdmin')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HomeAdmin-PhanQuyenTheoChucVu', N'Xem phân quyền chức vụ', N'HomeAdmin')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HomeAdmin-Save', N'Cập nhật,chỉnh sửa quyền', N'HomeAdmin')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'KeToan', N'Nghiệp vụ kế toán', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'KeToan-DanhSachHocSinh', N'Xem danh sách học sinh', N'KeToan')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'KeToan-HocPhiHocSinh', N'Xem học phí học sinh', N'KeToan')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'KeToan-Index', N'Xem trang chủ kế toán', N'KeToan')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'KeToan-Partial_CT_HocPhi', N'Chi tiết học phí học sinh', N'KeToan')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'Lop', N'Quản lý lớp', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'Lop-Add', N'Thêm mới lớp', N'Lop')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'Lop-Delete', N'Xóa lớp', N'Lop')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'Lop-Detail', N'Xem chi tiết lớp', N'Lop')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'Lop-Index', N'Xem trang quản lý lớp', N'Lop')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'Lop-Update', N'Sửa lớp', N'Lop')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'NhanVien', N'Quản lý nhân viên', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'NhanVien-Add', N'Thêm mới nhân viên', N'NhanVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'NhanVien-Delete', N'Xóa nhân viên', N'NhanVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'NhanVien-Detail', N'Xem chi tiết nhân viên', N'NhanVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'NhanVien-Index', N'Xem trang quản lý nhân viên', N'NhanVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'NhanVien-Update', N'Sửa nhân viên', N'NhanVien')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'GiaoVien-DiemDanh')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'GiaoVien-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'GiaoVien-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'GiaoVien-Partial_DanhSachHocSinh')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'GiaoVien-Partial_DanhSachHocSinh')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'GiaoVien-Partial_DiemDanhLop')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'GiaoVien-Partial_DiemDanhLop')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'HocPhi-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'HocPhi-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'HocSinh-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'HocSinh-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'HocSinh-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'HocSinh-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'HocSinh-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'HocSinh-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'HomeAdmin-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'HomeAdmin-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'HomeAdmin-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'HomeAdmin-PhanQuyenTheoChucVu')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'HomeAdmin-PhanQuyenTheoChucVu')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'HomeAdmin-PhanQuyenTheoChucVu')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'KeToan-DanhSachHocSinh')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'KeToan-HocPhiHocSinh')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'KeToan-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'KeToan-Partial_CT_HocPhi')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'Lop-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'Lop-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'Lop-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'Lop-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'Lop-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'Lop-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'NhanVien-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'NhanVien-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'NhanVien-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'NhanVien-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'NhanVien-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'NhanVien-Index')
ALTER TABLE [dbo].[CT_DichVu_HocSinh]  WITH CHECK ADD  CONSTRAINT [FK_CT_DichVu_HocSinh_DichVuNgoai] FOREIGN KEY([MaDichVu])
REFERENCES [dbo].[DichVuNgoai] ([MaDichVu])
GO
ALTER TABLE [dbo].[CT_DichVu_HocSinh] CHECK CONSTRAINT [FK_CT_DichVu_HocSinh_DichVuNgoai]
GO
ALTER TABLE [dbo].[CT_DichVu_HocSinh]  WITH CHECK ADD  CONSTRAINT [FK_CT_DichVu_HocSinh_HocSinh] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HocSinh] ([MaHocSinh])
GO
ALTER TABLE [dbo].[CT_DichVu_HocSinh] CHECK CONSTRAINT [FK_CT_DichVu_HocSinh_HocSinh]
GO
ALTER TABLE [dbo].[CT_NgayTheoDoi]  WITH CHECK ADD  CONSTRAINT [FK_CT_NgayTheoDoi_HocSinh] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HocSinh] ([MaHocSinh])
GO
ALTER TABLE [dbo].[CT_NgayTheoDoi] CHECK CONSTRAINT [FK_CT_NgayTheoDoi_HocSinh]
GO
ALTER TABLE [dbo].[CT_NgayTheoDoi]  WITH CHECK ADD  CONSTRAINT [FK_CT_NgayTheoDoi_PhieuTheoDoi] FOREIGN KEY([MaPhieuTheoDoi])
REFERENCES [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi])
GO
ALTER TABLE [dbo].[CT_NgayTheoDoi] CHECK CONSTRAINT [FK_CT_NgayTheoDoi_PhieuTheoDoi]
GO
ALTER TABLE [dbo].[CT_PhieuThu_HocSinh]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuThu_HocSinh_PhieuThu1] FOREIGN KEY([MaPhieuThu])
REFERENCES [dbo].[PhieuThu] ([MaPhieuThu])
GO
ALTER TABLE [dbo].[CT_PhieuThu_HocSinh] CHECK CONSTRAINT [FK_CT_PhieuThu_HocSinh_PhieuThu1]
GO
ALTER TABLE [dbo].[HocPhi]  WITH CHECK ADD  CONSTRAINT [FK_HocPhi_LoaiHocPhi] FOREIGN KEY([LoaiHocphi])
REFERENCES [dbo].[LoaiHocPhi] ([MaLoai])
GO
ALTER TABLE [dbo].[HocPhi] CHECK CONSTRAINT [FK_HocPhi_LoaiHocPhi]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChucVu] FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[ChucVu] ([MaChucVu])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChucVu]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_Lop]
GO
ALTER TABLE [dbo].[PhieuChiTieu]  WITH CHECK ADD  CONSTRAINT [FK_PhieuChiTieu_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuChiTieu] CHECK CONSTRAINT [FK_PhieuChiTieu_NhanVien]
GO
ALTER TABLE [dbo].[PhieuTheoDoi]  WITH CHECK ADD  CONSTRAINT [FK_PhieuTheoDoi_NhanVien] FOREIGN KEY([MaGiaoVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuTheoDoi] CHECK CONSTRAINT [FK_PhieuTheoDoi_NhanVien]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_PhieuThu_HocSinh1] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HocSinh] ([MaHocSinh])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [FK_PhieuThu_HocSinh1]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_PhieuThu_NhanVien1] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [FK_PhieuThu_NhanVien1]
GO
ALTER TABLE [dbo].[Quyen_ChucVu]  WITH CHECK ADD  CONSTRAINT [FK_Quyen_ChucVu_ChucVu] FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[ChucVu] ([MaChucVu])
GO
ALTER TABLE [dbo].[Quyen_ChucVu] CHECK CONSTRAINT [FK_Quyen_ChucVu_ChucVu]
GO
ALTER TABLE [dbo].[Quyen_ChucVu]  WITH CHECK ADD  CONSTRAINT [FK_Quyen_ChucVu_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[Quyen_ChucVu] CHECK CONSTRAINT [FK_Quyen_ChucVu_Quyen]
GO
/****** Object:  StoredProcedure [dbo].[DeleteChucVu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create PROCEDURE [dbo].[DeleteChucVu]
@MaChucVu varchar(20)
as
BEGIN
	delete from ChucVu where MaChucVu=@MaChucVu
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteCT_DichVu_HocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeleteCT_DichVu_HocSinh]
(    
@MaCT_DV_HS varchar(20) 
)    
as     
Begin    
 Delete FROM CT_DichVu_HocSinh where MaCT_DV_HS=MaCT_DV_HS

End  



GO
/****** Object:  StoredProcedure [dbo].[DeleteCT_PhieuThu_HocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeleteCT_PhieuThu_HocSinh]
(    
@MaCT_PhieuThu_HocSinh varchar(20) 
)    
as     
Begin    
 Delete FROM CT_PhieuThu_HocSinh where MaCT_PhieuThu_HocSinh=@MaCT_PhieuThu_HocSinh

End  



GO
/****** Object:  StoredProcedure [dbo].[DeleteDichVuNgoai]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeleteDichVuNgoai]
(    
@MaDichVu varchar(20) 
)    
as     
Begin    
 Delete FROM DichVuNgoai where MaDichVu=@MaDichVu

End  



GO
/****** Object:  StoredProcedure [dbo].[DeleteHocPhi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeleteHocPhi]
(    
@MaHocPhi varchar(20) 
)    
as     
Begin    
 Delete FROM HocPhi where MaHocPhi=@MaHocPhi

End  



GO
/****** Object:  StoredProcedure [dbo].[DeleteHocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[DeleteHocSinh]
@MaHocSinh varchar(20)    
as     

Begin
if(exists(select MaHocSinh from HocSinh where MaHocSinh=@MaHocSinh and TrangThai=0))
	begin
		Delete FROM HocSinh where MaHocSinh=@MaHocSinh		
	end
else
	begin
		update HocSinh set TrangThai=0 where MaHocSinh=@MaHocSinh
	end
End  


GO
/****** Object:  StoredProcedure [dbo].[DeleteLoaiHocPhi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeleteLoaiHocPhi]
(    
@MaLoai varchar(20) 
)    
as     
Begin    
 Delete FROM LoaiHocPhi where MaLoai=@MaLoai

End  



GO
/****** Object:  StoredProcedure [dbo].[DeleteLop]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeleteLop]
(    
@MaLop varchar(20) 
)    
as     
Begin    
 Delete FROM Lop where MaLop=@MaLop   

End  



GO
/****** Object:  StoredProcedure [dbo].[DeleteNhanVien]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Delete Employee  
Create Procedure [dbo].[DeleteNhanVien]
(    
@MaNhanVien varchar(20) 
)    
as     
Begin    
 Delete NhanVien where MaNhanVien=@MaNhanVien;
End  



GO
/****** Object:  StoredProcedure [dbo].[DeletePhieuChiTieu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeletePhieuChiTieu]
(    
@MaPhieuChiTieu varchar(20) 
)    
as     
Begin    
 Delete FROM PhieuChiTieu where MaPhieuChiTieu=@MaPhieuChiTieu
End  



GO
/****** Object:  StoredProcedure [dbo].[DeletePhieuTheoDoi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeletePhieuTheoDoi]
(    
@MaPhieuTheoDoi varchar(20) 
)    
as     
Begin    
 Delete FROM PhieuTheoDoi where MaPhieuTheoDoi=@MaPhieuTheoDoi
End  



GO
/****** Object:  StoredProcedure [dbo].[DeletePhieuThu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeletePhieuThu]
(    
@MaPhieuThu varchar(20) 
)    
as     
Begin    
 Delete FROM PhieuThu where MaPhieuThu=@MaPhieuThu
End  



GO
/****** Object:  StoredProcedure [dbo].[DeleteQuyen]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeleteQuyen]
(        
@MaQuyen varchar(20) 
)    
as     
Begin    
 Delete FROM Quyen where MaQuyen=@MaQuyen
End  



GO
/****** Object:  StoredProcedure [dbo].[DeleteQuyen_ChucVu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeleteQuyen_ChucVu]
(    
@MaChucVu varchar(20),    
@MaQuyen varchar(20) 
)    
as     
Begin    
 Delete FROM Quyen_ChucVu where MaChucVu=@MaChucVu and MaQuyen=@MaQuyen
End  



GO
/****** Object:  StoredProcedure [dbo].[DiemDanhProc]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DiemDanhProc]
	@MaGiaoVien varchar(20),
	@NgayTheoDoi date,
	@MaHocSinh varchar(20),
	@ddVang bit,
	@ddAnSang bit,
	@ddAnTrua bit
AS
BEGIN
DECLARE	@maPhieuTheoDoi int

		if not exists( select * from PhieuTheoDoi ptd where MaGiaoVien=@MaGiaoVien and NgayTheoDoi=@NgayTheoDoi)
			begin
				insert into PhieuTheoDoi(MaGiaoVien,NgayTheoDoi) values (@MaGiaoVien,@NgayTheoDoi)
				
				set @maPhieuTheoDoi=( select MaPhieuTheoDoi from PhieuTheoDoi WHERE MaGiaoVien=@MaGiaoVien AND NgayTheoDoi=@NgayTheoDoi)
				insert into CT_NgayTheoDoi(MaPhieuTheoDoi, MaHocSinh, DDVang, DDAnSang,DDAnTrua) values (@maPhieuTheoDoi,@MaHocSinh,@ddVang,@ddAnSang,@ddAnTrua)	
			end
		else
			begin
				set @maPhieuTheoDoi=( select ptd.MaPhieuTheoDoi from PhieuTheoDoi ptd where MaGiaoVien=@MaGiaoVien and NgayTheoDoi=@NgayTheoDoi)
				if not exists (select * from CT_NgayTheoDoi where MaPhieuTheoDoi=@maPhieuTheoDoi and MaHocSinh=@MaHocSinh)
					begin
						insert into CT_NgayTheoDoi(MaPhieuTheoDoi, MaHocSinh, DDVang, DDAnSang,DDAnTrua) values (@maPhieuTheoDoi,@MaHocSinh,@ddVang,@ddAnSang,@ddAnTrua)	
					end
				else
					begin
						UPDATE CT_NgayTheoDoi
						SET DDVang=@ddVang,DDAnSang=@ddAnSang,DDAnTrua=@ddAnTrua
						WHERE MaPhieuTheoDoi=@maPhieuTheoDoi and MaHocSinh=@MaHocSinh
					end
			end
end	


GO
/****** Object:  StoredProcedure [dbo].[FindHocSinhInfor]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FindHocSinhInfor]
(
@id varchar(20)
)
as
BEGIN
	select hs.MaHocSinh,hs.Ten as TenHocSinh,hs.NgaySinh,hs.GioiTinh,hs.DiaChi,hs.TinhTrang,hs.ChieuCao,hs.CanNang,hs.TenPhuHuynh,hs.NgaySinhPhuHuynh,hs.Sdt as SdtPhuHuynh,hs.Email as EmailPhuHuynh,hs.GhiChu,lp.MaLop,lp.TenLop,nv.TenNhanVien as TenGiaoVien,nv.Sdt as SdtGiaoVien,nv.Email as EmailGiaoVien  
                                from HocSinh hs inner join Lop lp on hs.MaLop = lp.MaLop  
                                inner join NhanVien nv on lp.MaLop = nv.MaLop  
                                inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu  
                                and (cv.MaChucVu = 'GVC' or cv.MaChucVu='GVP') and hs.TrangThai = '1' and hs.MaHocSinh=@id								
END


GO
/****** Object:  StoredProcedure [dbo].[Get_Infor_TheoDoi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery8.sql|7|0|C:\Users\hungnv\AppData\Local\Temp\~vsD124.sql

CREATE PROCEDURE [dbo].[Get_Infor_TheoDoi]
	@MaHocSinh varchar(20),
	@date varchar(7)
AS
BEGIN	
	DECLARE @startDateString varchar(10);
	DECLARE @startDate date;
	DECLARE @endDate date;	
	set @startDateString='01/'+@date
	set @startDate=(SELECT convert(date, @startDateString, 103))
	set @endDate = DATEADD(month, 1, @startDate)

	begin
		WITH newtbl AS (
					select ct.*
					from PhieuTheoDoi ptd inner join CT_NgayTheoDoi ct on ptd.MaPhieuTheoDoi=ct.MaPhieuTheoDoi
					where ptd.NgayTheoDoi < @endDate  AND ptd.NgayTheoDoi >= @startDate
						and ct.MaHocSinh=@MaHocSinh
					)
		SELECT @date as NgayTaoPhieu,newtbl.MaHocSinh as MaHocSinh,(select COUNT(*) from newtbl where newtbl.DDVang=1) as SoNgayVang,(select COUNT(*) from newtbl where newtbl.DDAnSang=1) as SoNgayAnSang,(select COUNT(*) from newtbl where newtbl.DDAnTrua=1) as SoNgayAnTrua,0 as ChiPhi
		FROM  newtbl
		group by newtbl.MaHocSinh
	end
	
END

GO
/****** Object:  StoredProcedure [dbo].[getAll_CT_NgayTheoDoi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getAll_CT_NgayTheoDoi]
(
	@MaGiaoVien varchar(20),
	@NgayTheoDoi date
)
as
BEGIN
	select ct.* from PhieuTheoDoi ptd inner join CT_NgayTheoDoi ct on ptd.MaPhieuTheoDoi = ct.MaPhieuTheoDoi 
                where ptd.MaGiaoVien = @MaGiaoVien and ptd.NgayTheoDoi = @NgayTheoDoi	
END


GO
/****** Object:  StoredProcedure [dbo].[getAllChucVu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getAllChucVu]

as
BEGIN
	SELECT * FROM ChucVu
END


GO
/****** Object:  StoredProcedure [dbo].[getAllDichVuNgoai]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllDichVuNgoai]
as
BEGIN
	SELECT * FROM DichVuNgoai
END


GO
/****** Object:  StoredProcedure [dbo].[getAllhocPhi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getAllhocPhi]
as
BEGIN
	SELECT * FROM HocPhi
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllHocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetAllHocSinh]
as
BEGIN
	SELECT * FROM HocSinh where TrangThai=1
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllHocSinhDis]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetAllHocSinhDis]
as
BEGIN
	SELECT * FROM HocSinh where TrangThai=0
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllHocSinhForIdGiaoVien]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetAllHocSinhForIdGiaoVien]
(
@id varchar(20)
)
as
BEGIN
	select hs.MaHocSinh,hs.Ten,hs.NgaySinh,hs.GioiTinh,hs.DiaChi,hs.TinhTrang,hs.ChieuCao,hs.CanNang,hs.TenPhuHuynh,hs.SoCmt,hs.Sdt,hs.Email,hs.NgaySinhPhuHuynh,hs.GhiChu,hs.MaLop 
                                from(select lp.* 
                                    from NhanVien nv inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu 
                                    inner join Lop lp on nv.MaLop = lp.MaLop 
                                    and (cv.MaChucVu = 'GVC' or cv.MaChucVu='GVP') and nv.MaNhanVien = @id) as lopNew inner join HocSinh hs on hs.MaLop = lopNew.MaLop;
END


GO
/****** Object:  StoredProcedure [dbo].[getAllloaiHocPhi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getAllloaiHocPhi]
as
BEGIN
	SELECT * FROM LoaiHocPhi
END


GO
/****** Object:  StoredProcedure [dbo].[getAllLop]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getAllLop]

as
BEGIN
	SELECT * FROM Lop				
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllNhanVien]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllNhanVien]
as
BEGIN
	SELECT * FROM NhanVien where MaNhanVien!='Admin'
END


GO
/****** Object:  StoredProcedure [dbo].[GetChucVu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetChucVu]

@MaChucVu varchar(20) ='',
@TenChucVu nvarchar(50) =''
as
BEGIN
	SELECT * FROM ChucVu 
	where (MaChucVu=@MaChucVu or @MaChucVu='') and (TenChucVu like '%'+@TenChucVu+'%' or @TenChucVu='')
	
END

GO
/****** Object:  StoredProcedure [dbo].[getChucVuForId]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[getChucVuForId]

@MaChucVu varchar(20)='',
@TenChucVu varchar(20)=''


as
BEGIN
	SELECT * FROM ChucVu where (MaChucVu=@MaChucVu or @MaChucVu='') and (TenChucVu=@TenChucVu OR @TenChucVu='')	
END


GO
/****** Object:  StoredProcedure [dbo].[GetCT_DichVu_HocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetCT_DichVu_HocSinh]

@MaCT_DV_HS varchar(20) ='',
@MaHocSinh varchar(20) ='',
@MaDichVu varchar(20) ='',
@ThangDangKy varchar(7) =''
as
BEGIN
	SELECT * FROM CT_DichVu_HocSinh 
	where (MaCT_DV_HS=@MaCT_DV_HS or @MaCT_DV_HS='') and (MaHocSinh =@MaHocSinh or @MaHocSinh='')
	and (@MaDichVu=@MaDichVu or @MaDichVu='')and (@ThangDangKy like '%'+@ThangDangKy+'%' or @ThangDangKy='')

	
END

select* from HocSinh
select* from Lop

exec GetHocSinh '','','','','','','MGLA','',''
GO
/****** Object:  StoredProcedure [dbo].[GetCT_NgayTheoDoi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCT_NgayTheoDoi]

@MaPhieuTheoDoi varchar(20) ='',
@MaHocSinh varchar(20) =''
as
BEGIN
	SELECT * FROM CT_NgayTheoDoi 
	where (MaPhieuTheoDoi=@MaPhieuTheoDoi or @MaPhieuTheoDoi='') and (MaHocSinh =@MaHocSinh or @MaHocSinh='')	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCT_PhieuThu_HocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetCT_PhieuThu_HocSinh]

@MaCT_PhieuThu_HocSinh varchar(20) ='',
@TenLoaiPhi nvarchar(50) ='',
@MaPhieuThu varchar(20) =''
as
BEGIN
	SELECT * FROM CT_PhieuThu_HocSinh 
	where (MaCT_PhieuThu_HocSinh=@MaCT_PhieuThu_HocSinh or @MaCT_PhieuThu_HocSinh='') and (@TenLoaiPhi = '%'+@TenLoaiPhi+'%' or @TenLoaiPhi='')	
	and (MaPhieuThu = @MaPhieuThu or @MaPhieuThu='')	
END
GO
/****** Object:  StoredProcedure [dbo].[GetDichVu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetDichVu]

@MaDichVu varchar(20) ='',
@TenDV varchar(20) =''
as
BEGIN
	SELECT * FROM DichVuNgoai 
	where (MaDichVu=@MaDichVu or @MaDichVu='') and (TenDV = '%'+@TenDV+'%' or @TenDV='')	
END
GO
/****** Object:  StoredProcedure [dbo].[GetHocPhi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetHocPhi]

@MaHocPhi varchar(20) ='',
@TenhocPhi nvarchar(50) ='',
@LoaiHocPhi varchar(20) =''
as
BEGIN
	SELECT * FROM HocPhi 
	where (MaHocPhi=@MaHocPhi or @MaHocPhi='') and (TenhocPhi = '%'+@TenhocPhi+'%' or @TenhocPhi='')	
	and (LoaiHocPhi=@LoaiHocPhi or @LoaiHocPhi='')
END
GO
/****** Object:  StoredProcedure [dbo].[getHocPhiThang]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getHocPhiThang]
as
BEGIN
	select hp.* from HocPhi hp inner join LoaiHocPhi lhp on hp.LoaiHocphi=lhp.MaLoai and lhp.MaLoai='LoaiHocPhi-2FAA'
END


GO
/****** Object:  StoredProcedure [dbo].[GetHocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetHocSinh]

@MaHocSinh varchar(20) ='',
@Ten nvarchar(50) ='',
--@NgaySinh date='',
@DiaChi nvarchar(200)='',
@TenPhuHuynh nvarchar(50) ='',
@sdt nvarchar(50) ='',
@Email nvarchar(50) ='',
--@NgaySinhPhuHuynh date ='',
@MaLop varchar(20) ='',
@DoiTuongMTA bit ='',
@TrangThai bit =''
as
BEGIN
	SELECT * FROM HocSinh 
	where (MaHocSinh=@MaHocSinh or @MaHocSinh='')
	and (Ten like '%'+@Ten+'%' or @Ten='')
	and (DiaChi like '%'+@DiaChi+'%' or @DiaChi='') 
	and (TenPhuHuynh like '%'+@TenPhuHuynh+'%' or @TenPhuHuynh='') 
	and(sdt like '%'+@sdt+'%' or @sdt='') 
	and (MaLop=@MaLop or @MaLop='') 
	and (DoiTuongMTA = @DoiTuongMTA or @DoiTuongMTA='')
	and (TrangThai = @TrangThai or @TrangThai='')
END
GO
/****** Object:  StoredProcedure [dbo].[GetHocSinhForId]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetHocSinhForId]
(
@id varchar(20)
)
as
BEGIN
	SELECT * FROM HocSinh where MaHocSinh=@id
END


GO
/****** Object:  StoredProcedure [dbo].[GetListCT_DichVu_HocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListCT_DichVu_HocSinh]
as
BEGIN
	SELECT * FROM CT_DichVu_HocSinh
END


GO
/****** Object:  StoredProcedure [dbo].[GetListCT_NgayTheoDoi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListCT_NgayTheoDoi]
as
BEGIN
	SELECT * FROM CT_NgayTheoDoi
END


GO
/****** Object:  StoredProcedure [dbo].[GetListCT_PhieuThu_HocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListCT_PhieuThu_HocSinh]
as
BEGIN
	SELECT * FROM CT_PhieuThu_HocSinh
END


GO
/****** Object:  StoredProcedure [dbo].[getListDichVuNgoai_HocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getListDichVuNgoai_HocSinh]
(
	@MaHocSinh varchar(20),
	@Thang varchar(7)
)
as
BEGIN
	select dv.* from DichVuNgoai dv inner join CT_DichVu_HocSinh ct on dv.MaDichVu = ct.MaDichVu  
                inner join HocSinh hs on hs.MaHocSinh = ct.MaHocSinh where hs.MaHocSinh = @MaHocSinh and ct.ThangDangKy = @Thang
END


GO
/****** Object:  StoredProcedure [dbo].[GetListDV]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListDV]
as
BEGIN
	SELECT * FROM DichVuNgoai
END


GO
/****** Object:  StoredProcedure [dbo].[GetListHocPhi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListHocPhi]
as
BEGIN
	SELECT * FROM HocPhi
END


GO
/****** Object:  StoredProcedure [dbo].[GetListHocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListHocSinh]
as
BEGIN
	SELECT * FROM HocSinh
END


GO
/****** Object:  StoredProcedure [dbo].[GetListLoaiHocPhi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListLoaiHocPhi]
as
BEGIN
	SELECT * FROM LoaiHocPhi
END


GO
/****** Object:  StoredProcedure [dbo].[GetListLop]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListLop]
as
BEGIN
	SELECT * FROM Lop
END


GO
/****** Object:  StoredProcedure [dbo].[GetListNhanVien]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListNhanVien]
as
BEGIN
	SELECT * FROM NhanVien
END


GO
/****** Object:  StoredProcedure [dbo].[GetListPhieuChiTieu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListPhieuChiTieu]
as
BEGIN
	SELECT * FROM PhieuChiTieu
END

GO
/****** Object:  StoredProcedure [dbo].[GetListPhieuTheoDoi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListPhieuTheoDoi]
as
BEGIN
	SELECT * FROM PhieuTheoDoi
END


GO
/****** Object:  StoredProcedure [dbo].[GetListPhieuThu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListPhieuThu]
as
BEGIN
	SELECT * FROM PhieuThu
END


GO
/****** Object:  StoredProcedure [dbo].[GetListQuyen]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListQuyen]
as
BEGIN
	SELECT * FROM Quyen
END


GO
/****** Object:  StoredProcedure [dbo].[GetListQuyen_ChucVu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetListQuyen_ChucVu]
as
BEGIN
	SELECT * FROM Quyen_ChucVu
END


GO
/****** Object:  StoredProcedure [dbo].[GetLoaiHocPhi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetLoaiHocPhi]

@MaLoai varchar(20) ='',
@TenLoai nvarchar(50) =''
as
BEGIN
	SELECT * FROM LoaiHocPhi 
	where (MaLoai=@MaLoai or @MaLoai='') and (TenLoai = '%'+@TenLoai+'%' or @TenLoai='')	
END
GO
/****** Object:  StoredProcedure [dbo].[GetLop]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetLop]

@MaLop varchar(20) ='',
@TenLop nvarchar(50) =''
as
BEGIN
	SELECT * FROM Lop 
	where (MaLop=@MaLop or @MaLop='') and (TenLop = '%'+@TenLop+'%' or @TenLop='')	
END
GO
/****** Object:  StoredProcedure [dbo].[getLopForIdGiaoVien]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getLopForIdGiaoVien]
	@id varchar(20)
AS
BEGIN
	(select lp.* from Lop lp 
						inner join NhanVien nv1 on nv1.MaLop=lp.MaLop 
						and (nv1.MaChucVu='GVC' or nv1.MaChucVu='GVP') 
						and nv1.MaNhanVien=@id)
END


GO
/****** Object:  StoredProcedure [dbo].[GetNhanVien]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetNhanVien]

@MaNhanVien varchar(20)='',
@TenNhanVien varchar(20)='',
@DiaChi nvarchar(100)='',
@Sdt nvarchar(20)='',
@Email nvarchar(50)='',
@MaChucVu varchar(20)='',
@MaLop varchar(20)=''
as
BEGIN
	SELECT * FROM NhanVien where (MaNhanVien=@MaNhanVien or @MaNhanVien='')and (TenNhanVien like '%'+@TenNhanVien+'%' or @TenNhanVien='')
	and (DiaChi like '%'+@DiaChi+'%' or @DiaChi='') and (Sdt like '%'+Sdt+'%') and(MaChucVu like '%'+@MaChucVu+'%' or @MaChucVu='') and (MaLop like '%'+@MaLop+'%' or @MaLop='')
END

GO
/****** Object:  StoredProcedure [dbo].[getNhanVienLogin]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getNhanVienLogin]
(
	@email nvarchar(50),
	@password nvarchar(50)
)
as
BEGIN
	SELECT * FROM NhanVien where Email=@email and Password=@password
END


GO
/****** Object:  StoredProcedure [dbo].[GetPhieuChiTieu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPhieuChiTieu]

@MaPhieuChiTieu varchar(20) ='',
@NgayTaoPhieu date,
@MaNhanVien varchar(20) ='',
@LyDo nvarchar(100) =''
as
BEGIN
if(@NgayTaoPhieu <> null or @NgayTaoPhieu <> '' )
begin
	SELECT * FROM PhieuChiTieu
	where (MaPhieuChiTieu=@MaPhieuChiTieu or @MaPhieuChiTieu='') and (LyDo = '%'+@LyDo+'%' or @LyDo='')	
	and NgayTaoPhieu=@NgayTaoPhieu  and (MaNhanVien=@MaNhanVien or @MaNhanVien='') 
end
else
begin
	SELECT * FROM PhieuChiTieu
	where (MaPhieuChiTieu=@MaPhieuChiTieu or @MaPhieuChiTieu='') and (LyDo = '%'+@LyDo+'%' or @LyDo='')	
	and (MaNhanVien=@MaNhanVien or @MaNhanVien='') 
end
END
GO
/****** Object:  StoredProcedure [dbo].[GetPhieuTheoDoi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPhieuTheoDoi]
@NgayTheoDoi date,
@MaGiaoVien varchar(20)
as
BEGIN
	SELECT * FROM PhieuTheoDoi
	where NgayTheoDoi=@NgayTheoDoi  and MaGiaoVien=@MaGiaoVien  
END

GO
/****** Object:  StoredProcedure [dbo].[GetPhieuThu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetPhieuThu]

@MaPhieuThu varchar(20) ='',
@NgayTaoPhieu varchar(7)='',
@MaHocSinh varchar(20) ='',
@MaNhanVien varchar(20) =''
as
BEGIN
	SELECT * FROM PhieuThu
	where (MaPhieuThu=@MaPhieuThu or @MaPhieuThu='')and (NgayTaoPhieu=@NgayTaoPhieu or @NgayTaoPhieu='')
	 and (MaHocSinh=@MaHocSinh or @MaHocSinh='') and (MaNhanVien=@MaNhanVien or @MaNhanVien='')  
END
GO
/****** Object:  StoredProcedure [dbo].[GetPhieuThuForIdHocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[GetPhieuThuForIdHocSinh]
	@MaHocSinh varchar(20),
	@MaNhanVien varchar(20),
	@date varchar(7)
AS
BEGIN	
	DECLARE @startDateString varchar(10);
	DECLARE @startDate date;
	DECLARE @endDate date;	
	set @startDateString='01/'+@date
	set @startDate=(SELECT convert(date, @startDateString, 103))
	set @endDate = DATEADD(month, 1, @startDate)

	begin
		WITH newtbl AS (
					select ct.*
					from PhieuTheoDoi ptd inner join CT_NgayTheoDoi ct on ptd.MaPhieuTheoDoi=ct.MaPhieuTheoDoi
					where ptd.NgayTheoDoi < @endDate  AND ptd.NgayTheoDoi >= @startDate
						and ct.MaHocSinh=@MaHocSinh
					)
		SELECT @date as NgayTaoPhieu,newtbl.MaHocSinh as MaHocSinh,@MaNhanVien as MaNhanVien,(select COUNT(*) from newtbl where newtbl.DDVang=1) as SoNgayVang,(select COUNT(*) from newtbl where newtbl.DDAnSang=1) as SoNgayAnSang,(select COUNT(*) from newtbl where newtbl.DDAnTrua=1) as SoNgayAnTrua,0 as ChiPhi
		FROM  newtbl
		group by newtbl.MaHocSinh
	end
	
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_Ct_phieuThu_hocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Insert_Ct_phieuThu_hocSinh]
	@MaCT_PhieuThu_HocSinh varchar(20),
	@TenLoaiPhi nvarchar(50),
	@SoLuong int,
	@ChiPhi money,
	@MaPhieuThu varchar(20)
AS
BEGIN
	insert into CT_PhieuThu_HocSinh 
	values(@MaCT_PhieuThu_HocSinh,@TenLoaiPhi,@SoLuong,@ChiPhi,@MaPhieuThu)
END


GO
/****** Object:  StoredProcedure [dbo].[InsertChucVu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[InsertChucVu]

@MaChucVu varchar(20),
@TenChucVu varchar(20)
as
BEGIN
	insert into ChucVu values(@MaChucVu,@TenChucVu)
END


GO
/****** Object:  StoredProcedure [dbo].[InsertDichVu_HocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertDichVu_HocSinh]
(    
@MaCT_DV_HS varchar(20),    
@MaDichVu varchar(20),    
@MaHocSinh varchar(50),   
@thang varchar(7)
)    
As    
Begin
	if(not exists (select MaCT_DV_HS from CT_DichVu_HocSinh where MaDichVu=@MaDichVu and MaHocSinh=@MaHocSinh and ThangDangKy=@thang))
	begin
		Insert into CT_DichVu_HocSinh(MaCT_DV_HS,MaDichVu,MaHocSinh,ThangDangKy) values(@MaCT_DV_HS,@MaDichVu,@MaHocSinh,@thang);
	end
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertPhieuThu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPhieuThu]
	@MaPhieuThu varchar(20),
	@NgayTaoPhieu varchar(7),
	@MaHocSinh varchar(20),
	@MaNhanVien varchar(20),
	@GhiChu varchar(100)
AS
BEGIN
	insert into PhieuThu values(@MaPhieuThu,@NgayTaoPhieu,@MaHocSinh,@MaNhanVien,@GhiChu)
END


GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateChucVu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create PROCEDURE [dbo].[InsertUpdateChucVu]

@MaChucVu varchar(20),
@TenChucVu varchar(20),
@Action varchar(10)
as
BEGIN
	
if @Action='Insert'
Begin    
 insert into ChucVu values(@MaChucVu,@TenChucVu)  
End    
if @Action='Update'    
Begin    
 	update ChucVu set TenChucVu=@TenChucVu where MaChucVu=@MaChucVu
End    
End  


GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateCT_DichVu_HocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertUpdateCT_DichVu_HocSinh]
(    
@MaCT_DV_HS varchar(20),    
@MaHocSinh varchar(20),   
@MaDichVu varchar(20),   
@ThangDangKy varchar(7),
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into CT_DichVu_HocSinh(MaCT_DV_HS,MaHocSinh,MaDichVu,ThangDangKy) values(@MaCT_DV_HS,@MaHocSinh,@MaDichVu,@ThangDangKy);    
End    
if @Action='Update'    
Begin    
 Update CT_DichVu_HocSinh set MaHocSinh=@MaHocSinh,MaDichVu=@MaDichVu,ThangDangKy=@ThangDangKy where MaCT_DV_HS=@MaCT_DV_HS    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateCT_NgayTheoDoi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertUpdateCT_NgayTheoDoi]
(    
@MaPhieuTheoDoi varchar(20),    
@MaHocSinh varchar(20),   
@DDVang bit,   
@DDAnSang bit,
@DDAnTrua bit,
@GhiChu nvarchar(100),
@ChiPhi money,
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into CT_NgayTheoDoi(MaPhieuTheoDoi,MaHocSinh,DDVang,DDAnSang,DDAnTrua,GhiChu,ChiPhi) values(@MaPhieuTheoDoi,@MaHocSinh,@DDVang,@DDAnSang,@DDAnTrua,@GhiChu,@ChiPhi);    
End    
if @Action='Update'    
Begin    
 Update CT_NgayTheoDoi set MaHocSinh=@MaHocSinh,DDVang=@DDVang,DDAnSang=@DDVang,DDAnTrua=@DDAnTrua,GhiChu=@GhiChu,ChiPhi=@ChiPhi where MaPhieuTheoDoi=@MaPhieuTheoDoi    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateCT_PhieuThu_HocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertUpdateCT_PhieuThu_HocSinh]
(    
@MaCT_PhieuThu_HocSinh varchar(20),    
@TenLoaiPhi nvarchar(50),   
@SoLuong int,   
@ChiPhi money,
@MaPhieuThu varchar(20),
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into CT_PhieuThu_HocSinh(MaCT_PhieuThu_HocSinh,TenLoaiPhi,SoLuong,ChiPhi,MaPhieuThu) values(@MaCT_PhieuThu_HocSinh,@TenLoaiPhi,@SoLuong,@ChiPhi,@MaPhieuThu);    
End    
if @Action='Update'    
Begin    
 Update CT_PhieuThu_HocSinh set TenLoaiPhi=@TenLoaiPhi,SoLuong=@SoLuong,ChiPhi=@ChiPhi,MaPhieuThu=@MaPhieuThu where MaCT_PhieuThu_HocSinh=@MaCT_PhieuThu_HocSinh    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateDichVuNgoai]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertUpdateDichVuNgoai]
(    
@MaDichVu varchar(20),    
@TenDV nvarchar(50),   
@ChiPhi money,
@GhiChu nvarchar(100),
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into DichVuNgoai(MaDichVu,TenDV,ChiPhi,GhiChu) values(@MaDichVu,@TenDV,@ChiPhi,@GhiChu);
End    
if @Action='Update'    
Begin    
 Update DichVuNgoai set TenDV=@TenDV,ChiPhi=@ChiPhi,GhiChu=@GhiChu where MaDichVu=@MaDichVu    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateHocPhi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertUpdateHocPhi]
(    
@MaHocPhi varchar(20),    
@TenHocPhi nvarchar(50),   
@ChiPhi money,  
@GhiChu nvarchar(50),   
@LoaiHocPhi varchar(20) ,
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into HocPhi(MaHocPhi,TenHocPhi,ChiPhi,GhiChu,LoaiHocphi) values(@MaHocPhi,@TenHocPhi,@ChiPhi,@GhiChu,@LoaiHocPhi);    
End    
if @Action='Update'    
Begin    
 Update HocPhi set TenHocPhi=@TenHocPhi,ChiPhi=@ChiPhi,GhiChu=@GhiChu,LoaiHocPhi=@LoaiHocPhi where MaHocPhi=@MaHocPhi    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateHocSinh]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[InsertUpdateHocSinh]
(    
	@MaHocSinh   varchar(20)     ,
	@Ten   nvarchar (50)    ,
	@NgaySinh   date     ,
	@GioiTinh   nvarchar (5)  ,
	@DiaChi   nvarchar (200)    ,
	@TinhTrang   nvarchar (50)  ,
	@ChieuCao   int   ,
	@CanNang   int   ,
	@TenPhuHuynh   nvarchar (50)  ,
	@SoCmt   nvarchar (50)  ,
	@Sdt   nvarchar (50)  ,
	@Email   nvarchar (50)  ,
	@NgaySinhPhuHuynh   date   ,
	@GhiChu   nvarchar (50)  ,
	@MaLop   varchar (20)  ,
	@DoiTuongMta bit,
	@TrangThai   bit    ,
	@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into HocSinh(MaHocSinh,Ten, NgaySinh, GioiTinh , DiaChi , TinhTrang , ChieuCao , CanNang , TenPhuHuynh , SoCmt , Sdt , Email , NgaySinhPhuHuynh , GhiChu , MaLop ,DoiTuongMta, TrangThai) values(@MaHocSinh,@Ten, @NgaySinh, @GioiTinh , @DiaChi , @TinhTrang , @ChieuCao , @CanNang , @TenPhuHuynh , @SoCmt , @Sdt , @Email , @NgaySinhPhuHuynh , @GhiChu , @MaLop ,@DoiTuongMta, @TrangThai);    
End    
if @Action='Update'    
Begin    
 Update HocSinh set Ten=@Ten,NgaySinh=@NgaySinh,GioiTinh=@GioiTinh,DiaChi=@DiaChi,TinhTrang=@TinhTrang,ChieuCao=@ChieuCao,CanNang=@CanNang,TenPhuHuynh=@TenPhuHuynh,SoCmt=@SoCmt,Sdt=@Sdt,Email=@Email,NgaySinhPhuHuynh=@NgaySinhPhuHuynh,GhiChu=@GhiChu,MaLop=@MaLop,DoiTuongMta=@DoiTuongMta,TrangThai=@TrangThai
  where MaHocSinh=@MaHocSinh    
End      
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateLoaiHocPhi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateLoaiHocPhi]
(    
@MaLoai varchar(20),    
@TenLoai nvarchar(50),   
@GhiChu nvarchar(100),
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into LoaiHocPhi(MaLoai,TenLoai,GhiChu) values(@MaLoai,@TenLoai,@GhiChu);    
End    
if @Action='Update'    
Begin    
 Update LoaiHocPhi set TenLoai=@TenLoai,GhiChu=@GhiChu where MaLoai=@MaLoai    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateLop]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateLop]
(    
@MaLop varchar(20),    
@TenLop nvarchar(50),   
@GhiChu nvarchar(50),  
@SiSo int,    
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into Lop(MaLop,TenLop,GhiChu,SiSo) values(@MaLop,@TenLop,@GhiChu,@SiSo);    
End    
if @Action='Update'    
Begin    
 Update Lop set TenLop=@TenLop,GhiChu=@GhiChu,SiSo=@SiSo where MaLop=@MaLop    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateNhanVien]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateNhanVien]
(    
@MaNhanVien varchar(20),    
@TenNhanVien nvarchar(50),    
@DiaChi nvarchar(200),    
@Sdt nvarchar(50),    
@Email nvarchar(50),    
@MaChucVu varchar(10),
@MaLop varchar(20),
@Password nvarchar(50),
@Action varchar(10)
)    
As    
Begin
if(@MaChucVu!='GVC' and @MaChucVu !='GVP')
	begin
		set @MaLop=null
	end	
if @Action='Insert'
Begin  	
	Insert into NhanVien(MaNhanVien,TenNhanVien,DiaChi,Sdt,Email,MaChucVu,MaLop,Password) values(@MaNhanVien,@TenNhanVien,@DiaChi,@Sdt,@Email,@MaChucVu,@MaLop,@Password);    			
End    
if @Action='Update'    
Begin    
 Update NhanVien set TenNhanVien=@TenNhanVien,DiaChi=@DiaChi,Sdt=@Sdt,Email=@Email,MaChucVu=@MaChucVu,MaLop=@MaLop,Password=@Password where MaNhanVien=@MaNhanVien    
End      
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdatePhieuChiTieu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[InsertUpdatePhieuChiTieu]
(    
@MaPhieuChiTieu varchar(20),    
@NgayTaoPhieu date,   
@MaNhanVien varchar(20),
@LyDo nvarchar(100),
@ChiPhi money,
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into PhieuChiTieu(MaPhieuChiTieu,NgayTaoPhieu,MaNhanVien,LyDo,ChiPhi) 
 values(@MaPhieuChiTieu,@NgayTaoPhieu,@MaNhanVien,@LyDo,@ChiPhi);
End    
if @Action='Update'    
Begin    
 Update PhieuChiTieu set NgayTaoPhieu=@NgayTaoPhieu,MaNhanVien=@MaNhanVien,LyDo=@LyDo,ChiPhi=@ChiPhi 
 where  MaPhieuChiTieu=@MaPhieuChiTieu    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdatePhieuTheoDoi]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[InsertUpdatePhieuTheoDoi]
(    
@MaPhieuTheoDoi varchar(20),    
@MaGiaoVien varchar(20),   
@NgayTheoDoi date,
@ChiPhiDuTinh money,
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into PhieuTheoDoi(MaPhieuTheoDoi,MaGiaoVien,NgayTheoDoi,ChiPhiDuTinh) 
 values(@MaPhieuTheoDoi,@MaGiaoVien,@NgayTheoDoi,@ChiPhiDuTinh);
End    
if @Action='Update'    
Begin    
 Update PhieuTheoDoi set MaGiaoVien=@MaGiaoVien,NgayTheoDoi=@NgayTheoDoi,ChiPhiDuTinh=@ChiPhiDuTinh 
 where  MaPhieuTheoDoi=@MaPhieuTheoDoi    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdatePhieuThu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[InsertUpdatePhieuThu]
(    
@MaPhieuThu varchar(20),    
@NgayTaoPhieu date,   
@MaHocSinh varchar(20),
@MaNhanVien varchar(20),
@GhiChu nvarchar(100),
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into PhieuThu(MaPhieuThu,NgayTaoPhieu,MaHocSinh,MaNhanVien,GhiChu) 
 values(@MaPhieuThu,@NgayTaoPhieu,@MaHocSinh,@MaNhanVien,@GhiChu);
End    
if @Action='Update'    
Begin    
 Update PhieuThu set NgayTaoPhieu=@NgayTaoPhieu,MaHocSinh=@MaHocSinh ,MaNhanVien=@MaNhanVien ,GhiChu=@GhiChu 
 where  MaPhieuThu=@MaPhieuThu    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateQuyen]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[InsertUpdateQuyen]
(      
@MaQuyen varchar(20),   
@Mota nvarchar(50),   
@ParentId varchar(20),   
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into Quyen(MaQuyen,Mota,ParentId) values(@MaQuyen,@Mota,@ParentId)
End    
if @Action='Update'    
Begin    
 Update Quyen set Mota=@Mota,ParentId=@ParentId where  MaQuyen=@MaQuyen    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateQuyen_ChucVu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[InsertUpdateQuyen_ChucVu]
(    
@MaChucVu varchar(20),    
@MaQuyen varchar(20),   
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into Quyen_ChucVu(MaChucVu,MaQuyen) values(@MaChucVu,@MaQuyen)
End    
if @Action='Update'    
Begin    
 Update Quyen_ChucVu set MaQuyen=@MaQuyen where  MaChucVu=@MaChucVu    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[sp_CheckExitsGiaoVien]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CheckExitsGiaoVien]
	@Id varchar(20)
AS
BEGIN
	select * from NhanVien where MaNhanVien=@Id and (MaChucVu='GVC' or MaChucVu='GVP')
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Ct_DichVu_HocSinh_NewID]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Ct_DichVu_HocSinh_NewID]
AS
BEGIN
	declare @ma_next varchar(15)
	set @ma_next ='CT_DV_HS-'+LEFT(NEWID(),6)
	while(exists(select MaCT_DV_HS from CT_DichVu_HocSinh where MaCT_DV_HS=@ma_next))
	begin
		set @ma_next='CT_DV_HS-'+left(NEWID(),6)
	end
	select @ma_next as MaCT_DV_HS
END


GO
/****** Object:  StoredProcedure [dbo].[sp_CT_PhieuThu_HocSinh_NewID]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_CT_PhieuThu_HocSinh_NewID]
AS
BEGIN
	declare @ma_next varchar(13)
	set @ma_next ='Ct_pt_hs-'+LEFT(NEWID(),4)
	while(exists(select MaCT_PhieuThu_HocSinh from CT_PhieuThu_HocSinh where MaCT_PhieuThu_HocSinh=@ma_next))
	begin
		set @ma_next='Ct_pt_hs-'+left(NEWID(),4)
	end
	select @ma_next as MaCT_PhieuThu_HocSinh
END


GO
/****** Object:  StoredProcedure [dbo].[sp_DichVuNgoai_NewID]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DichVuNgoai_NewID]
AS
BEGIN
	declare @ma_next varchar(6)
	set @ma_next ='DV-'+LEFT(NEWID(),3)
	while(exists(select MaDichVu from DichVuNgoai where MaDichVu=@ma_next))
	begin
		set @ma_next='DV-'+left(NEWID(),3)
	end
	select @ma_next as MaDichVu
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetInfoGiaoVienChuNhiem]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetInfoGiaoVienChuNhiem]
	@id varchar(20)
AS
BEGIN
	select nv.MaNhanVien as MaGiaoVien,nv.TenNhanVien as TenGiaoVien,cv.MaChucVu,cv.TenChucVu,lp.MaLop,lp.TenLop,lp.SiSo,nv.DiaChi,nv.Sdt,nv.Email 
                                from(select lp.* from Lop lp 
										inner join NhanVien nv1 on nv1.MaLop=lp.MaLop 
										and (nv1.MaChucVu='GVC' or nv1.MaChucVu='GVP') 
										and nv1.MaNhanVien=@id) lopnew inner join NhanVien nv on nv.MaLop=lopnew.MaLop
										inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu 
										inner join Lop lp on nv.MaLop = lp.MaLop 
										and cv.MaChucVu = 'GVC'
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetListGVForIdLogin]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetListGVForIdLogin]
	@Id varchar(20)
AS
BEGIN
	select nv.MaNhanVien as MaGiaoVien,nv.TenNhanVien as TenGiaoVien,cv.MaChucVu,cv.TenChucVu,lopNew.MaLop,lopNew.TenLop,lopNew.SiSo,nv.DiaChi,nv.Sdt,nv.Email 
                from (select lp.* from Lop lp 
						inner join NhanVien nv1 on nv1.MaLop=lp.MaLop 
						and (nv1.MaChucVu='GVC' or nv1.MaChucVu='GVP') 
						and nv1.MaNhanVien=@Id) lopnew inner join NhanVien nv on nv.MaLop = lopNew.MaLop 
                        inner join ChucVu cv on cv.MaChucVu = nv.MaChucVu
						and (nv.MaChucVu='GVC' or nv.MaChucVu='GVP');
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetQuyenNhanVien]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetQuyenNhanVien]
	@id varchar(10)
AS
BEGIN
	select q.MaQuyen from NhanVien nv inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu 
                inner join Quyen_ChucVu qc on cv.MaChucVu = qc.MaChucVu 
                inner join Quyen q on qc.MaQuyen = q.MaQuyen 
                and nv.MaNhanVien = @id
END


GO
/****** Object:  StoredProcedure [dbo].[sp_HocPhi_NewID]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HocPhi_NewID]
@ma_next varchar(10) output
AS
BEGIN
	set @ma_next ='HocPhi-'+LEFT(NEWID(),3)
	while(exists(select MaHocPhi from HocPhi where MaHocPhi=@ma_next))
	begin
		set @ma_next='HocPhi-'+left(NEWID(),3)
	end
END


GO
/****** Object:  StoredProcedure [dbo].[sp_HocSinh_NewID]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HocSinh_NewID]
@ma_next varchar(6) output
AS
BEGIN
	
	set @ma_next ='HS-'+LEFT(NEWID(),4)
	while(exists(select MaHocSinh from HocSinh where MaHocSinh=@ma_next))
	begin
		set @ma_next='HS-'+left(NEWID(),4)
	end
END

GO
/****** Object:  StoredProcedure [dbo].[sp_LoaiHocPhi_NewID]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_LoaiHocPhi_NewID]
AS
BEGIN
	declare @ma_next varchar(15)
	set @ma_next ='LoaiHocPhi-'+LEFT(NEWID(),4)
	while(exists(select MaLoai from LoaiHocPhi where MaLoai=@ma_next))
	begin
		set @ma_next='LoaiHocPhi-'+left(NEWID(),4)
	end
	select @ma_next as MaLoai
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Lop_NewID]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Lop_NewID]
AS
BEGIN
	declare @ma_next varchar(6)
	set @ma_next ='Lop-'+LEFT(NEWID(),2)
	while(exists(select MaLop from Lop where MaLop=@ma_next))
	begin
		set @ma_next='Lop-'+left(NEWID(),2)
	end
	select @ma_next as MaHocSinh
END


GO
/****** Object:  StoredProcedure [dbo].[sp_NhanVien_NewID]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_NhanVien_NewID]
@ma_next varchar(6) output
AS
BEGIN
	set @ma_next ='NV-'+LEFT(NEWID(),4)
	while(exists(select MaNhanVien from NhanVien where MaNhanVien=@ma_next))
	begin
		set @ma_next='NV-'+left(NEWID(),4)
	end
	
END


GO
/****** Object:  StoredProcedure [dbo].[sp_PhieuChiTieu_NewID]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_PhieuChiTieu_NewID]
@ma_next varchar(12) output
AS
BEGIN
	set @ma_next ='ChiTieu-'+LEFT(NEWID(),4)
	while(exists(select MaPhieuChiTieu from PhieuChiTieu where MaPhieuChiTieu=@ma_next))
	begin
		set @ma_next='ChiTieu-'+left(NEWID(),4)
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PhieuThu_NewID]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_PhieuThu_NewID]
AS
BEGIN
	declare @ma_next varchar(12)
	set @ma_next ='PhieuThu-'+LEFT(NEWID(),3)
	while(exists(select MaPhieuThu from PhieuThu where MaPhieuThu=@ma_next))
	begin
		set @ma_next='PhieuThu-'+left(NEWID(),3)
	end
	select @ma_next as MaPhieuThu
END


GO
/****** Object:  StoredProcedure [dbo].[TinhHocPhiTheoDoiProc]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[TinhHocPhiTheoDoiProc]
	@Vang int,
	@Sang int,
	@Trua int,
	@TongTheoDoi money output
AS
BEGIN	
	set @TongTheoDoi = (22-@Vang)*(select ChiPhi from HocPhi where LoaiHocphi='HocPhi-C5S')
						+@Sang*(select ChiPhi from HocPhi where LoaiHocphi='HocPhi-CC3')
						+@Trua*(select ChiPhi from HocPhi where LoaiHocphi='HocPhi-8BF')	
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateChucVu]    Script Date: 2018/01/19 16:49:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create PROCEDURE [dbo].[UpdateChucVu]

@MaChucVu varchar(20),
@TenChucVu varchar(20)
as
BEGIN
	update ChucVu set TenChucVu=@TenChucVu where MaChucVu=@MaChucVu
END


GO
USE [master]
GO
ALTER DATABASE [QLMamNonTC] SET  READ_WRITE 
GO
