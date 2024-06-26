USE [BOOKSHOP]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[MABV] [int] IDENTITY(1,1) NOT NULL,
	[TIEUDE] [nvarchar](300) NOT NULL,
	[NOIDUNG] [nvarchar](max) NOT NULL,
	[MAKH] [int] NOT NULL,
	[MANV] [int] NULL,
	[MOTA] [nvarchar](max) NULL,
	[LYDOTUCHOI] [nchar](30) NULL,
	[THOIGIANLAP] [datetime] NOT NULL,
 CONSTRAINT [PK_BaiViet] PRIMARY KEY CLUSTERED 
(
	[MABV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MABL] [int] IDENTITY(1,1) NOT NULL,
	[MABV] [int] NOT NULL,
	[MATK] [int] NOT NULL,
	[NOIDUNG] [nvarchar](max) NOT NULL,
	[THOIGIANLAP] [datetime] NOT NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[MABL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_DanhGia]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DanhGia](
	[MAKH] [int] NOT NULL,
	[MASACH] [int] NOT NULL,
	[NOIDUNG] [nvarchar](500) NULL,
	[THOIGIAN] [datetime] NOT NULL,
	[VOTE] [int] NOT NULL,
 CONSTRAINT [PK_CT_DanhGia] PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC,
	[MASACH] ASC,
	[THOIGIAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_DonDatHang]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DonDatHang](
	[MADDH] [int] NOT NULL,
	[MASACH] [int] NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [float] NOT NULL,
 CONSTRAINT [PK_CT_DonDatHang_1] PRIMARY KEY CLUSTERED 
(
	[MADDH] ASC,
	[MASACH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_GioHang]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_GioHang](
	[IDGH] [int] NOT NULL,
	[MASACH] [int] NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [int] NOT NULL,
	[CHON] [int] NOT NULL,
 CONSTRAINT [PK_CT_GioHang] PRIMARY KEY CLUSTERED 
(
	[IDGH] ASC,
	[MASACH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_HoaDon]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_HoaDon](
	[MAHD] [int] NOT NULL,
	[MASACH] [int] NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [float] NOT NULL,
 CONSTRAINT [PK_CT_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC,
	[MASACH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_KhuyenMai]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_KhuyenMai](
	[MAKM] [int] NOT NULL,
	[MASACH] [int] NOT NULL,
	[TYLE] [int] NOT NULL,
 CONSTRAINT [PK_CT_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[MAKM] ASC,
	[MASACH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_Nhap]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Nhap](
	[MAPN] [int] NOT NULL,
	[MASACH] [int] NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [float] NOT NULL,
 CONSTRAINT [PK_CT_Nhap] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC,
	[MASACH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MADDH] [int] IDENTITY(1,1) NOT NULL,
	[NGAYLAP] [datetime] NOT NULL,
	[MANCC] [int] NOT NULL,
	[MANV] [int] NOT NULL,
	[MAKHOMOI] [int] NOT NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MADDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[IDGH] [int] IDENTITY(1,1) NOT NULL,
	[NGAYLAP] [datetime] NOT NULL,
	[MAKH] [int] NOT NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[IDGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MAHD] [int] IDENTITY(1,1) NOT NULL,
	[NGAYLAP] [datetime] NOT NULL,
	[MANV] [int] NOT NULL,
	[MAKH] [int] NULL,
	[TONGTIEN] [float] NOT NULL,
	[HOTENNN] [nvarchar](50) NOT NULL,
	[DIACHINN] [nvarchar](200) NOT NULL,
	[SDTNN] [nvarchar](20) NOT NULL,
	[EMAILNN] [nvarchar](50) NOT NULL,
	[GHICHU] [nvarchar](200) NULL,
	[TRANGTHAI] [int] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MAKH] [int] IDENTITY(1,1) NOT NULL,
	[HO] [nvarchar](30) NOT NULL,
	[TEN] [nvarchar](20) NOT NULL,
	[EMAIL] [nvarchar](50) NOT NULL,
	[SDT] [nvarchar](10) NOT NULL,
	[NGAYSINH] [date] NOT NULL,
	[GIOITINH] [bit] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoMoi]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoMoi](
	[MAKHOMOI] [int] IDENTITY(1,1) NOT NULL,
	[DIACHI] [nvarchar](50) NOT NULL,
	[TENKHOMOI] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_KhoMoi] PRIMARY KEY CLUSTERED 
(
	[MAKHOMOI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MAKM] [int] IDENTITY(1,1) NOT NULL,
	[TENKM] [nvarchar](50) NOT NULL,
	[NGAYBD] [datetime] NOT NULL,
	[NGAYKT] [datetime] NOT NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[MAKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LuotThich]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuotThich](
	[MALT] [int] IDENTITY(1,1) NOT NULL,
	[CAMXUC] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_LuotThich] PRIMARY KEY CLUSTERED 
(
	[MALT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MANCC] [int] IDENTITY(1,1) NOT NULL,
	[TENNCC] [nvarchar](50) NOT NULL,
	[DIACHI] [nvarchar](100) NOT NULL,
	[SDT] [nvarchar](10) NOT NULL,
	[EMAIL] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NhaCungCap_1] PRIMARY KEY CLUSTERED 
(
	[MANCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MANV] [int] IDENTITY(1,1) NOT NULL,
	[HO] [nvarchar](30) NOT NULL,
	[TEN] [nvarchar](20) NOT NULL,
	[CCCD] [nvarchar](12) NOT NULL,
	[SDT] [nvarchar](10) NOT NULL,
	[EMAIL] [nvarchar](50) NOT NULL,
	[GIOITINH] [bit] NOT NULL,
	[NGAYSINH] [date] NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[MANXB] [int] IDENTITY(1,1) NOT NULL,
	[TENNXB] [nvarchar](50) NOT NULL,
	[EMAIL] [nvarchar](50) NOT NULL,
	[SDT] [nvarchar](10) NOT NULL,
	[DIACHI] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MANXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MAPN] [int] IDENTITY(1,1) NOT NULL,
	[NGAYLAP] [datetime] NOT NULL,
	[MAKHOMOI] [int] NOT NULL,
	[MADDH] [int] NOT NULL,
	[MANV] [int] NOT NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MASACH] [int] IDENTITY(1,1) NOT NULL,
	[TENSACH] [nvarchar](50) NOT NULL,
	[LANTAIBAN] [int] NOT NULL,
	[MATL] [int] NOT NULL,
	[MATG] [int] NOT NULL,
	[MANCC] [int] NOT NULL,
	[MANXB] [int] NOT NULL,
	[GIA] [float] NOT NULL,
	[ANH] [text] NULL,
	[SOLUONGTON] [int] NULL,
	[SOLUONGBAN] [int] NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MASACH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MATG] [int] IDENTITY(1,1) NOT NULL,
	[HO] [nvarchar](50) NOT NULL,
	[TEN] [nvarchar](20) NOT NULL,
	[EMAIL] [nvarchar](50) NULL,
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[MATG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USERNAME] [nvarchar](30) NOT NULL,
	[PASSWORD] [nvarchar](40) NOT NULL,
	[MAKH] [int] NULL,
	[MANV] [nchar](10) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MATL] [int] IDENTITY(1,1) NOT NULL,
	[TENTL] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[MATL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 10/06/2024 04:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MATT] [int] NOT NULL,
	[TENTT] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[MATT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BaiViet] ON 

INSERT [dbo].[BaiViet] ([MABV], [TIEUDE], [NOIDUNG], [MAKH], [MANV], [MOTA], [LYDOTUCHOI], [THOIGIANLAP]) VALUES (1, N'Hướng dẫn đăng bài ở PTITBOOKSHOP', N'
			<div class="content-row" id="content-row-0">
				<div class="post-element-controller" id="e-controller-0" style="display: none;">
					<div class="pec-row1">
						<button type="button" name="delete-element" title="Xóa cả khối và các thành phần."><i class="bi bi-trash3"></i></button>
						<button type="button" name="set-left" title="Căn trái."><i class="bi bi-text-left"></i></button>
						<button type="button" name="set-right" title="Căn phải."><i class="bi bi-text-right"></i></button>
					</div>
					<div class="pec-row2">
						<button type="button" name="set-top" title="Dồn các thành phần lên đỉnh." disabled=""><i class="bi bi-align-top"></i></button>
						<button type="button" name="set-middle" title="Dồn các thành phần vào giữa." disabled=""><i class="bi bi-align-center"></i></button>
						<button type="button" name="set-bottom" title="Dồn các thành phần xuống đáy." disabled=""><i class="bi bi-align-bottom"></i></button>
					</div>
					<div class="pec-row3">
						<button type="button" name="center-element-1" title="Căn giữa sát cạnh.">Lv1</button>
						<button type="button" name="center-element-2" title="Căn đều nội dung.">Lv2</button>
						<button type="button" name="center-element-3" title="Căn nội dung gần cạnh.">Lv3</button>
						<button class="non-disabled-btn" type="button" name="center-element-4" title="Gom toàn bộ nội dung vào giữa.">Lv4</button>
					</div>
					<div class="pec-row4">
						<button type="button" name="add-text" title="Thêm một khối chữ."><i class="bi bi-card-text"></i></button>
						<button type="button" name="add-image" title="Thêm một khối hình."><i class="bi bi-file-image"></i></button>
					</div>
				</div>
			<div class="post-text post-content" id="container-0-0 text-0"><div class="dragbar" style="width: 1124px;"><div class="content-0 ctextarea" id="content-0" contenteditable="true" style="width: 100%; min-height: 30px; font-size: 15px; height: 28px;">Bước 1: Chọn tạo bài viết trên thanh người dùng</div></div><div class="row-element-controller"><div class="text-controller"><button type="button" name="delete-element-row" title="Xóa khối chữ này."><i class="bi bi-trash3"></i></button><button type="button" name="set-left-row" title="Căn trái."><i class="bi bi-text-left"></i></button><button type="button" name="set-center-row" title="Căn giữa."><i class="bi bi-text-center"></i></button><button type="button" name="set-right-row" title="Căn phải."><i class="bi bi-text-right"></i></button></div><div class="font-controller"><input class="font-size-controller" type="number" name="fs-input" placeholder="Height" value="12"><select class="color-selector" name="text-color"><option value="red">Đỏ</option><option value="yellow">Vàng</option><option value="blue">Xanh dương</option><option value="green">Xanh lục</option><option value="black" selected="">Đen</option><option value="white">Trắng</option></select><select class="font-family-selector" name="font-family"><option value="Arial">Arial</option><option value="Verdana">Verdana</option><option value="Georgia">Georgia</option><option value="Times New Roman">Times New Roman</option><option value="Courier New">Courier New</option></select></div></div></div></div>
		<div class="content-row" id="content-row-1" style="align-items: center;"><div class="post-element-controller" id="e-controller-1" style="display: none;"><div class="pec-row1"><button type="button" name="delete-element" title="Xóa cả khối cùng các thành phần."><i class="bi bi-trash3"></i></button><button type="button" name="set-left" title="Căn trái."><i class="bi bi-text-left"></i></button><button type="button" name="set-right" title="Căn phải."><i class="bi bi-text-right"></i></button></div><div class="pec-row2"><button type="button" name="set-top" title="Dồn các thành phần lên cao."><i class="bi bi-align-top"></i></button><button type="button" name="set-middle" title="Dồn các thành phần vào giữa."><i class="bi bi-align-center"></i></button><button type="button" name="set-bottom" title="Dồn các thành phần xuống đáy."><i class="bi bi-align-bottom"></i></button></div><div class="pec-row3"><button type="button" name="center-element-1" title="Căn giữa sát cạnh.">Lv1</button><button type="button" name="center-element-2" title="Căn đều nội dung.">Lv2</button><button type="button" name="center-element-3" title="Căn nội dung gần cạnh.">Lv3</button><button class="non-disabled-btn" type="button" name="center-element-4" title="Gom toàn bộ nội dung vào giữa.">Lv4</button></div><div class="pec-row4"><button type="button" name="add-text" title="Thêm một khối văn bản."><i class="bi bi-card-text"></i></button><button type="button" name="add-image" title="Thêm một khối hình."><i class="bi bi-file-image"></i></button></div></div><div class="post-text post-content" id="container-0-1 text-0"><div class="dragbar" style="width: 888px; direction: ltr;"><div class="content-0 ctextarea" id="content-0" contenteditable="true" style="width: 100%; min-height: 30px; font-size: 16px; height: 28px;">Bước 2: Thêm khối bài viết, nếu cần:&nbsp;</div></div><div class="row-element-controller"><div class="text-controller"><button type="button" name="delete-element-row" title="Xóa khối chữ này."><i class="bi bi-trash3"></i></button><button type="button" name="set-left-row" title="Căn trái."><i class="bi bi-text-left"></i></button><button type="button" name="set-center-row" title="Căn giữa."><i class="bi bi-text-center"></i></button><button type="button" name="set-right-row" title="Căn phải."><i class="bi bi-text-right"></i></button></div><div class="font-controller"><input class="font-size-controller" type="number" name="fs-input" placeholder="Height" value="12"><select class="color-selector" name="text-color"><option value="red">Đỏ</option><option value="yellow">Vàng</option><option value="blue">Xanh dương</option><option value="green">Xanh lục</option><option value="black" selected="">Đen</option><option value="white">Trắng</option></select><select class="font-family-selector" name="font-family"><option value="Arial">Arial</option><option value="Verdana">Verdana</option><option value="Georgia">Georgia</option><option value="Times New Roman">Times New Roman</option><option value="Courier New">Courier New</option></select></div></div></div><div class="post-image post-content " id="image-1 container-1-1"><div class="dragbar dragbarb" style="width: 229px; height: 97px; direction: ltr;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIIAAABECAYAAABNsu1UAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAU8SURBVHhe7d1PSJt3GAfwrzv16C0XbcCAIbU4tounORFie0hqoOhlDFbJILgZhWEOJTtNeogUql0l0GALsotSiJqDKIh1Jy+TyZKgTCHVS247etue93l/SfO3Jm/M+77O5wMvyftL8otNvnne5/caace/BC3o6OhAi1MIG/hMXYpbToIgmARBMAmCYBIEwSQIgkkQBJMgCCZBEEyCIJgEQTAJgmBt/aXT2NiYumadTCaDdDqt9kQ9/+uKoIVA28TVTKkIiUSCL83W2dnJly3+E28F6REEkyAIJkEQTIIgmLVBOFnBuLuTmzpDm3scKydqLtESC1cNx5jrH8D2d/tY+8ahxpqT/20Mg29HcHAUhVuNldLCopFVw9UsrAg55D64MR7oh8PhMLT1B8bh/kDzqBmFcdIjCGbrIFwebmLz5FLtiXaydRDyv89hbiuv9kQ7yaFBMAmCYLYKwuXhCqLTU5hSW3SNVgRr0eL+1HQUK4fSM7SDVATBLDyhtI3vO3/G538c4MceNVQhtziAcaziIOxUIxXOfsXAl3/il39eY0QNlZITSo2TiiCYBEEwWwfB8VUU0YfGfg8hmmPrINz5wg9/7x21J9pJDg2CWRgEJ5x3j7GaPEI+nze0HSVXcXyX5lEzCuOs/Raz9sUU/xS2jf46wTGCl5ur+LZX7VeQ5WPj5OvsgkmPIJgEQTAJgmASBMEkCIK1fdVgh79IllXD1dpaEeTP0m+OtlYEcXNIjyCYBEEwCYJgEgTBJAiC3d4g7EbQ0/sYCflTatbmIFwgMXqPXvB7mNlVQ5Vyb+D/xO17Ee3xtd+w88Rjui2CPbUvjDOtImyEDLxhFJLnx7N4H3fhWfgNztWwuH7mBCHgwyOkMBHZVwONoGoSTmF08Qm6h2NYds9jMnGhbtN1B9/h7CSGIbUvjDOpIvjwU8QDJBeaOiY/WHyHoPpC4lAsgyWvfl1cP9MODd3BBTz1ZJso8Wd47tX7i8I2uaNuUhrvEfYxUzJPzcfUax6rehh9Lm1ff/7CnLX7GL3H+bjN7OqP9xerm/rZmqqW18+0IABdCC7Ooi9bXeKr8JsSwmlkm0p/Rt92ZoHYSPMvGL+RFXPFgYlQSt3BmI0QBRMLxTmXAxRyb2nA9EZ5QutxCs97Qk8cCmFD3cNOTAwCcT7BEh0i0rHpTxwi6AVcSKGP3rjNYJcaI/TYzbiv6cPL3qt5pAPx8rmo53ivHapaUTHn0A8UcuqDkoXKsbuIZ1kfltepx1FDwCBeUKD71J6OxrSQxAbVvjXMDQLpDk5T40ifnld1Ptm5HaxnPRj1lrxxBcNa05nF+s4VFaVoH8kk8Ohh9Yvc3eNS14ypmtPpgjbj6Zn+s+1tUcXxeHisjLqf3ZgeBP4E8Cc7VPvcwWkW1/a/K+ROcaqumusCfx/ThdtVUg3szYIgEG05GKhzbsHlqSidLWjm03edz3sDWRMEMhSL6+cWwhVNG795dcr/booarTqHjZp6cJ9agY2t6sMQl+4qWfxVUULOd1IGKlQXHvi15XKqxupE+zfYj2VBKB4ispWHAn08TSuEj0ssonX/1On3RRaK5xauRiuVaf0wVDYXrUomqHco4/RiVAtNaZWi55yMZdVOc/ReiII+WrpcpqVi1Wrl1i0faxgO42mt5p0OHcXlolp/93jn4Ypnyrv/RmhzqWAV59ry8Vg5Cs26qlKF+4WBpaouv1HaaoDmo+Xy14X5elMIaGPqHnYi31k0nVYBQgCF+sWwGrIBaytCA/jMXFl5veFUn3PfVmtI4D8yST6X7GJktAAAAABJRU5ErkJggg==" alt="Image"></div><div class="row-element-controller"><div class="text-controller"><button type="button" name="delete-element-row" title="Xóa hình này."><i class="bi bi-trash3"></i></button></div><div class="size-controller"></div></div></div></div><div class="content-row" id="content-row-2" style="align-items: end;"><div class="post-element-controller" id="e-controller-2" style="display: none;"><div class="pec-row1"><button type="button" name="delete-element" title="Xóa cả khối cùng các thành phần."><i class="bi bi-trash3"></i></button><button type="button" name="set-left" title="Căn trái."><i class="bi bi-text-left"></i></button><button type="button" name="set-right" title="Căn phải."><i class="bi bi-text-right"></i></button></div><div class="pec-row2"><button type="button" name="set-top" title="Dồn các thành phần lên cao."><i class="bi bi-align-top"></i></button><button type="button" name="set-middle" title="Dồn các thành phần vào giữa."><i class="bi bi-align-center"></i></button><button type="button" name="set-bottom" title="Dồn các thành phần xuống đáy."><i class="bi bi-align-bottom"></i></button></div><div class="pec-row3"><button type="button" name="center-element-1" title="Căn giữa sát cạnh.">Lv1</button><button type="button" name="center-element-2" title="Căn đều nội dung.">Lv2</button><button type="button" name="center-element-3" title="Căn nội dung gần cạnh.">Lv3</button><button class="non-disabled-btn" type="button" name="center-element-4" title="Gom toàn bộ nội dung vào giữa.">Lv4</button></div><div class="pec-row4"><button type="button" name="add-text" title="Thêm một khối văn bản."><i class="bi bi-card-text"></i></button><button type="button" name="add-image" title="Thêm một khối hình."><i class="bi bi-file-image"></i></button></div></div><div class="post-image post-content " id="image-0 container-0-2"><div class="dragbar dragbarb" style="width: 228px; height: 151px; direction: ltr;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOAAAADCCAYAAABQSc7cAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAABXiSURBVHhe7d0PdFTVnQfw7/AvCYU4kVgmK1gmhj1MNlQTNSVpuicEWj1QOCWAuyZHdt1Q1xbrHiRyUNlqu6AeTOScFlpFs+7BTdrKH13YZI8WI9tYorgmcshm6CYQToAmWCwjIEk0kL135obMTOYlM5M3894M34/n4r2Pmcy9zPze/fcyzzIggIgMMU79n4gMwAAkMhADkMhADEAiA1mAswNAo8i2i3TRfZCIImGqSBki5Yn0VXkAlqeeeoqroERRtmLFCmRlZXEISmSE3bt345NPPmEAEhmlsbGRAUhklPb2dgYgkVEuXrzIACQyEgOQyEAMQCIDjbgPWFBQgNzcXCQnJ6sjxrpw4QIOHz6M9957Tx3RZqa6Xw/1pvBYMjMzAwbg6tWrsXbtWlUyl61bt+KVV15RpeHMWvdYrfeBAwcYhBGiOQS97777VM58RqubWeseq/WWPTJFhmXDhg0Be8Bnn31W5czp8ccfV7nhzFz3WK33008/rXKkJy7CEBmIAUhkIAYgkYEYgEQGYgASGYgBSGSgiAagc2s+LBaLb5qYj8pj6gFE17mAAXj8P59TubGow6ZHO7Du7S50dQ2lEz9LQfkzdeoxOmvfh+ee06PuRNERMABv/e4GlQtBrwvd3d1eyYVepCBRfg+Nl6QpiRqP1UHGUmxYkakK5nT4vMoQCbpdCdPx83ykPyK/XS0cedjWcQhrZqliEHS9ouRSIyofrYJTFYNjR8mWJ1FkVcUgLXjoceSmqIKf0K+E6UXj1odRFVrFYb+vAk/OD63ivBImMnSbA9p/dAgD+0qArAqcGBiAvOXEqKmtAg6UoHYgtODTnxVpNpUNls2GNJU1klXUIzQ22G5SWTKcvteCvvcwkn5gR+vRdaJ/qMfqlBqUnH8FRSe3I/9+oLphDey/XY2UXSU4v6NIzNkqkTm3A1U929zflBiK1KIf4Pvf8D6LH8e+53ahVeRkcJuVXIiSps1/yK/+vBb0eqTvKqjNDntLkxrK9aLHdQjN8vt++3vhcnlmeR0fH4KrV834nOKxGXZxTg7dp+++iJc/cKkS4PqgHlixAeKEoo6EQtTPZ04aIKn6j1XRP3rq6B98uhk2vx6eXJfUY8lw+gbgBCBRZYEUpAwVfCRavSZBGo8ZzUPzp4kg/J3o9zys3/g+lsovHQ5H916U3ZWN7JHSD/diKNzNq7dhE4oC1d8rFW1tVo8mo+kbgLMcYk7XDKfs9US/ZhcB0dvv/ptrZNk+09PndRwTHwSHQwxXQ2edNl38eRaf+qwqunD4lTC2IWwl2HOqC10jpZoSMVM0v8RvV6A1UP29UtM/Z6tHk9H0DUAhSf3fw4nWNpVVOpx+S3ai19SD3Lt87rkXcWTuQ+oIkfnpHICiB8xywukOujSkaXRt9hme9UOnCEaH6AHDNx3T5Gi2fR92tUxzz6/Cmlt112D5TFHfkFIONv+Per5hulFzb6C6jZxy/oVDULPQvQeUetzDzkRYRSzISf+QbnSdFsNHuRkv+Q1PQ3H8WCuQasM0VR4TWzGqPmxGc0ipHutuV883jA3FOwLVbeRUv5ZDULPQOQDtcIj31tneocpAl6tH5aQeuP6ksugQPSCQPSecGSBEjwdkFuZ65mXTZCB+iiP/F+4yiThZ2GywhZSsSAxj+Bx+HQNLtAaq28jJOkU9mQyn+3fC1K2yoHzuCbQ+ZkfzE2koTTmE1mV7kbkMqD1ajL1z83H+1S5surMDlXPT0fTMAKqXqCeHYNgVJfI60N1yFzCMfcBLTtRsqUS9d2ftwwrHynKs+3Y4Gya+Ir4PeLoelS/UwKm51WBD3iPlKMsKbajOfcDI0H0I6pjrcM/tJGtKyrW8h5gftqQgxf3ey7wDOWFOAYddziWvA90Q7j6gC12awSfJv9fnIs7BOkZsH/CSGOaPuM/Xje5roxAymu49YMfzmUg/WoGBnYvQ+18Po7R9HfasbMbDPwU2/iIbe4orYd+5DYum1KHUUo6ctlasC2P/jt+KFl3sASND9x7QnleExP3V2HuyG67sjdi+Mkmcc/Ox8cf54uSbhOW/2IgccZbu2FWNusQi5Ie7eU4UB/RfBS3YhNoHnCi1pyEtTTulr3KirG5TyNeAEsWTCGxDWFH0QhN6vH/rIVDqaUJFiL8SQxRvIhCARBQsBiCRgeSmVMBVUDlMNLPB/bRAzFz3WK03V0Ejgz0gkYE0b9Bp9jPeSPUzc93jsd4UPs0eUN4d1axGq5tZ6x6v9abwaQagvDWxWY1WN7PWPV7rTeEbX1hYGHBs0dnZif7+fqSmpiIhIUEdNZY8Ezc0NIx6u2Sz1T3e603h05wDElHkcRWUyEAMQCIDMQCJDMQAJDIQA5DIQAxAIoPJbYiASX5dRWdn54BZyLqor9AYNZmp7tdDvZnCS5r7gAUFBVi4cKEqmcuBAwdG3Bw2a93jtd4UPs0haG5ursqZz2h1M2vd47XeFD7NAExOTlY58xmtbmate7zWm8LHRRgiAzEAiQzEACQyEAOQyEAMQCIDMQCJDMQAJDKQbt+K1vfHZhwK++aTVszJy0ZaCN/CEJ1vF3OhrfFPuClvtudGoDqIeL0vn0bzR21wXfEUJ94wG3dkz/C7d3/o9Ps3JW+69YAJtizk5+WHmbIw3RxfO+PnS1z+7LL4M4Zc+hRnP+9DX68nXTp7Emcvq78j09FvCDpuovuLhPwTXJ1oa29TqROugeGPSUiYyLEwXZci/LnvQVfbcZw+dVql42hu4+1ZiQZFv+MJOOMkuj5x5Kdc/ULMmfr8Uz+uiv/6hx0X6Yur6plE4WMASj0n8X79u3j3Xf90BGfFf0eGHRepvgFtl9TzicLEAJTEsDj0/qwHl7m6SGPEACQyEANQsoTzD5GEyZNVlihMDEApaRbmFc3H/Pn+6TZMF//dNuy4SAu+hdlT1POJwsQAVMZNCnSBwATxDzQOE4YdF2ki/+lo7PgpinviLda+LT0ZjAEYb6bZkTVrBmbM9KRZjkzcPNYrsSliGIAxLODFA/0JuMk+G7MzPMluS8JV/8eI9KX6bQkyVoQDMAHWm5KRkCjmTO6UjFkzp6m/iwUTMfmGyeJPM3Lh+AeHcKgxvPTBiXB/dYz0pNvvA0ZbxH+vLkLisd4UPg5BiQzEACQyEAOQyEAMQCIDMQCJDMQAJDKQZgBeuHBB5cxntLqZte7xWm8Kn2YAHj58WOXMZ7S6mbXu8VpvCt/4wsLCgDusnZ2d6O/vR2pqqvvqfzOQZ+KGhoZRb5dstrrHe70pfJpXwhBR5HERhshADEAiAzEAiQzEACQyEAOQyEAMQCIDjbgNUVBQgNzcXCQnJ6sj5ib3reSm8Wj7VmyXOcRju4Jt0yDNjXjZ6IULF5pmEz4Ysq7p6enuzWy5qR0I22Ue8diuYNrkTXMIKs84sWqkurNd5hOP7Qq23poBGCvDmEBGqjvbZT7x2K5g681FGCIDMQCJDMQAJDIQA5DIQAxAIgMxAIkMxAAkMhADkMhAOgZgHUotFmQ+36HKY7S/FJZVdapgpLG3q+P5TFjEz7iW4qFd7ZXI9G7TWH6WnuTnxpKJynZVHiv3z4tc20zZA9atEm/o0hpVim0y+NJ3luHEwAAGZGqrgOO1xSYJwvB1vNGEsjbVJpn2lcC5Pt0cQaibDlQ+EdnPoakCcLCnWPyaOhAP5lTgxNF1sKsiMtahdosDeK1a9EGxy/5YNdZlqIK0pBq19wPOnXvFxzZO7N+I8haVjxBTBaDzqBO4v9Z9RpVvZjywL1k0FHyKfU62+LMZTr2GSSbhmCtOLHHD0/uV7KtFiToSCVEIQNGQuRrzHr/x+qKdYiizc5GnYHrBtyumqLld6X5V9uKeGsyt1Ozh3CfQbMewE44phNiujucXoxwV2LREHYiQKASgHcWrAg+56naJ8XVWGYq9hzIxI/x2mbrdGcUoywJqdg1rFarF1MCxqjhggMnpw+LXSlBr1hNoKO0Swbp4PVDxhtfUIUKiMgS1LyuDAzWo9jn7eBpe8kzkGxkp4bTL80F1ROXNDY/GiWV/tWhpCSoeG6q1u+cQvYpM6UcrxNShGuYdvwTbLjGyWVYObKn1neNGSHTmgBnrUCHmdDVPeHXzquGlEe7iIyqkdnmGrOnrnWJe0RqVNzdc9scqRAtqUO61ounute8v9Qkw95RhcBV0ZbUnGE28uhtMu+pWpbuHnrVeJ5pIitoizKKVYirbUoW97nmRZ4Lr/4bGouDaJffcxBvbIoZo4sNabfqTziKUeq9oiiFZuezVV47wbi2pdm9F4LVyE899R2mXmLtHe3QStQDEklJx9nGi6g3R9Pa9qGoRDf1xrIefMFq73JP/xajJqsAJUw/RfHmfWDreqIJT1H/UBQlHjhiSO9HkVGUT0m6XOnmK+pfPHhpaW+R7J4+uTxd5/RfWoheA4qO3aYt4e8TZp87d8FhdfPE3crvqflrufpN99gJjwZJNqMiSJ5Y67N3p1Fx88eFsEh9fB3LMvBuh2S471h31GlJfS55tCMeWEyKv/9QhigEomigXLVrKsVjOg2J48cWfdrtieaHJs2jhXL/YPXT2XnxxD6n9tyNkT7+0RnxQo7N4Eb6R2hV9ugegp6v27sJFGpyYq6Vg8ZGMucWXsbSrZqnf8/yfb6CR2uVZ5RWGzWnFXCq7HOnez5ldjux9A2g1+APt4T+M9KTBPUDtdkWf5hfzPv10wK8LjRla9We7zCke2xVM3aM6BCUiXwxAIgMxAIkMxAAkMhADkMhADEAiAzEAiQzEACQykGYAyjt9xqqR6s52mU88tivYemsGoLzNbqwaqe5sl/nEY7uCrbfmLarl7XXlbXZTU1Nj5vbA8qzT0NAw4v252S7ziMd2BdMmb5rXghJR5HERhshADEAiAzEAiQzEACQyEAOQyEAMQCIDjbgNUVBQgNzcXCQnJ6sjxpJ7LHKDM5g9FjPVPZR60/XFMmHK9IABuP7RH2HzT55UJXN58qnN2PLCz1VpOLPWfbR60/VHMwA7jjVhxs1/oUrmcvrMH2Gfk6NKw5m17qPVm64/mgH45cVulTOniVNtKjecmes+Ur3p+sNFGCIDMQCJDMQAJDIQA5DIQAxAIgMxABXny8uRNnH4DT0CpolpWP6yiW+CRzGD2xDS6e3In1mFxR/WoWyGOjaS01VYdFctyk4dwppgHu+F2xDkTZ8AdNVjY/HDqGo7rw6EKgWZD2zDnp8WwaqOjEbXANxfCssTOSHcRFPe7z0dTc+EfrtpBiB50yUAGx9JQtHJjai+P9xbozpRtWoT7L/twbYCdWgUDECKB7oEYN0qC8rnnhjDzRlD/0BHNAB7O1C/qxHdM/JQPN+ORPeDvDEASR/6L8L0d6Nx117sDSa9H2KgREUvakrSsWBVKUqL0lH6q151nEh/+gfgyT3Y+OgarAkm/XiP733GTaELXadUVujo7lI5Iv3pH4AZa/DOKfkhDiK9vSbIOVc02VG2ZR2yZ9jgWFaB7Q+Yr4YUP/SfA7rqsXl9TXA9m70EFY/LlU+TzQED6oXrHGBNlTNCzgFJH9yID1LH1nyk3JSGBdyAJx1xFVTy7wEv9aJ3SuLQ6uexSuQ4ytHsLlhRtKMKRT9bjlb2gDRG+veA7duxYGYa0gKmTCx/1XzLLj5EsOWnJCHJsRp723uBfic2rxwMPsmF+geXY2OLKhKNgf49oNyGeOMQtNYO0/KKkTfs8i1z9ICtu4CyueVo7FfHBdsMK7pPu1TJV8k+9oA0NhyCSjIA762HTZw8ur2CbzQMQBorXQIwLi5FW1qjCsFjANJY6RKAelyMnf9IFaoeyzPuYmwGIBlAnwA0gK4B2F2FBWmrUa+KwcnDNv46Eo0R9wElWxm27SiGbYIqj2aCDcU7qkIOPiJ/7AGjjD0geWMPSGQgBiCRgTgEjTIOQX3Nu/cfsGDmJFUC+k41ouL1I6oUuoy7/wbLs1IwOJ3v//Mx7Hn1INpV2WwYgFEWVwEoPuxPig976L7AyYP/iuqPdA7AWxdgzdLZsPqM667gXMtbeOmtTlU2Fw5BKT5Yb0Pp3Sr4rpzHx7WNOPm5/IvxSM1aiNK7psqC6TAAKQ5Mxbzv3IFZSTIvetff16H22BFU/1oEYY88Ngmz7irEvGCv8ogizSEo7w+ov+vi/oB3LEF54c1IUEVA9EaVv0GtKvnTew4YazR7wF/ueFXlzGe0upm17mb+NyVjaPaAkrzV8w8efMA0vYnsQeSHOJjbPJup7qHUO+bp0QO+fQXf+24OMm6ajATZRVy9gr5L3fi44SAOHLvoeaAf68zbUPjNLGR8VTxn4nh1FOj/8gu4uk/gSONHeP/U8OcGfv3LWFiUg9tvSUGC+lF9l86h/fBBvNl8znPAj3VOHu7Jc+Br1kmY4FfnhLxS3H6j53HSuZYX8dJbnvyIAUgUsjEHYBu6Umer+ZwfubiyX/ys46rsNhV3LlmKBX859drWQ2Bf4GzzAbxS77saGvD1bxSv/xV1wMfQ6q23jKIV+F52qlebvYg6n+tJQeoUVRa8A5CLMGQqCTM1gk8an4Lbv5mnCh4Zdy8KIvikSZiePfpqqPv1AwafNAmzvl7o+xs7WYvwXa3gk0SdvYPPHwOQTKfvVBOqq17E5n9/D39wXVFHleRUzFNZWPNQ6BjadJf6XR145/VqbK58EVVvHvZ7vgigO76F21VJS1/XEfyH1utbU3Gnysre956cW+ATr1cu4g+/24/t4vW3v96E45f8nu+HAUjmcqkDb75+GCflt4CcbcHuD87AvZ03KGEypqkscm/B9KHpnoicM/jvqreuzfW6jzdh9x4nzl51Fz2+YsNfZat8IJ934kBNI1oGX7/R7/XHjffq7bIw41plpCs48+E+7P7wDOTTXacO49e/8Xt9PwxAMpW+892+l421XIZ7Ky+AeVbfsWLfJ514X+WvcR3BuQsq7zYJU76qsgH0/fkMPlZ5t1b/1/8KrIMBfEeq71U3X57Dyd/7LfQMe/0hFss4BiDFu4v4coQeKCxaUXO1H8PvJKL9+pYJCQxAindTMdH/Ux7Vdf+bkaSxQjRu4mQGIMWuY5/5zM6QcOPNwxdYvnYHpiervNtlfHZaZceq5wp8vkQvIQWzslR+0K1Zfq/vMT7xBljGTcC4CZOniUhMco9HiWKJ64Mzfgsst2Dh3y3AvJmerQZbVgFK75mNVO+PtusM3m9V+bFqPYFun3PAZNz618twT1aquyRf/+/vtl/btpg6dSqys7NR8h0RcxM837tuSbJ9nRvxpJ8HX0bXT3JxgyoCJ/BvacvwQ1Xy90+738Oz3xzam/vs95VIW7FTlaSn0dS1DHNUyf/n3b31Dfzqb9MD3EQ1kIs4+FQBFu1QRSH01/f9GYXi9evE64fi2K9vQ85aT57dHsW0t9Y+jJ+8fSbA4oefvnN4a8tqn+DTw8G1L+Cl/w18eZzU2/UODmr+NjDw/xFO3m3uDTUlAAAAAElFTkSuQmCC" alt="Image"></div><div class="row-element-controller"><div class="text-controller"><button type="button" name="delete-element-row" title="Xóa hình này."><i class="bi bi-trash3"></i></button></div><div class="size-controller"></div></div></div><div class="post-text post-content" id="container-1-2 text-1"><div class="dragbar" style="width: 825px; direction: ltr;"><div class="content-1 ctextarea" id="content-1" contenteditable="true" style="width: 100%; min-height: 30px; font-size: 16px; height: 28px;">Bước 3(<span style="color: red;">quan trọng</span>): Chọn cách trình bày bài viết</div></div><div class="row-element-controller"><div class="text-controller"><button type="button" name="delete-element-row" title="Xóa khối chữ này."><i class="bi bi-trash3"></i></button><button type="button" name="set-left-row" title="Căn trái."><i class="bi bi-text-left"></i></button><button type="button" name="set-center-row" title="Căn giữa."><i class="bi bi-text-center"></i></button><button type="button" name="set-right-row" title="Căn phải."><i class="bi bi-text-right"></i></button></div><div class="font-controller"><input class="font-size-controller" type="number" name="fs-input" placeholder="Height" value="12"><select class="color-selector" name="text-color"><option value="red">Đỏ</option><option value="yellow">Vàng</option><option value="blue">Xanh dương</option><option value="green">Xanh lục</option><option value="black" selected="">Đen</option><option value="white">Trắng</option></select><select class="font-family-selector" name="font-family"><option value="Arial">Arial</option><option value="Verdana">Verdana</option><option value="Georgia">Georgia</option><option value="Times New Roman">Times New Roman</option><option value="Courier New">Courier New</option></select></div></div></div></div>', 8, 7, N'Hướng dẫn đăng bài viết cơ bản', NULL, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MABV], [TIEUDE], [NOIDUNG], [MAKH], [MANV], [MOTA], [LYDOTUCHOI], [THOIGIANLAP]) VALUES (2, N'Hỏi về sách', N'
			<div class="content-row" id="content-row-0">
				<div class="post-element-controller" id="e-controller-0" style="display: none;">
					<div class="pec-row1">
						<button type="button" name="delete-element" title="Xóa cả khối và các thành phần."><i class="bi bi-trash3"></i></button>
						<button type="button" name="set-left" title="Căn trái."><i class="bi bi-text-left"></i></button>
						<button type="button" name="set-right" title="Căn phải."><i class="bi bi-text-right"></i></button>
					</div>
					<div class="pec-row2">
						<button type="button" name="set-top" title="Dồn các thành phần lên đỉnh." disabled=""><i class="bi bi-align-top"></i></button>
						<button type="button" name="set-middle" title="Dồn các thành phần vào giữa." disabled=""><i class="bi bi-align-center"></i></button>
						<button type="button" name="set-bottom" title="Dồn các thành phần xuống đáy." disabled=""><i class="bi bi-align-bottom"></i></button>
					</div>
					<div class="pec-row3">
						<button type="button" name="center-element-1" title="Căn giữa sát cạnh.">Lv1</button>
						<button type="button" name="center-element-2" title="Căn đều nội dung.">Lv2</button>
						<button type="button" name="center-element-3" title="Căn nội dung gần cạnh.">Lv3</button>
						<button class="non-disabled-btn" type="button" name="center-element-4" title="Gom toàn bộ nội dung vào giữa.">Lv4</button>
					</div>
					<div class="pec-row4">
						<button type="button" name="add-text" title="Thêm một khối chữ."><i class="bi bi-card-text"></i></button>
						<button type="button" name="add-image" title="Thêm một khối hình."><i class="bi bi-file-image"></i></button>
					</div>
				</div>
			<div class="post-text post-content" id="container-0-0 text-0"><div class="dragbar" style="width: 825px;"><div class="content-0 ctextarea" id="content-0" contenteditable="true" style="width: 100%; min-height: 30px; font-size: 17px; height: 28px;">Như tiêu đề, mong admin duyệt</div></div><div class="row-element-controller"><div class="text-controller"><button type="button" name="delete-element-row" title="Xóa khối chữ này."><i class="bi bi-trash3"></i></button><button type="button" name="set-left-row" title="Căn trái."><i class="bi bi-text-left"></i></button><button type="button" name="set-center-row" title="Căn giữa."><i class="bi bi-text-center"></i></button><button type="button" name="set-right-row" title="Căn phải."><i class="bi bi-text-right"></i></button></div><div class="font-controller"><input class="font-size-controller" type="number" name="fs-input" placeholder="Height" value="12"><select class="color-selector" name="text-color"><option value="red">Đỏ</option><option value="yellow">Vàng</option><option value="blue">Xanh dương</option><option value="green">Xanh lục</option><option value="black" selected="">Đen</option><option value="white">Trắng</option></select><select class="font-family-selector" name="font-family"><option value="Arial">Arial</option><option value="Verdana">Verdana</option><option value="Georgia">Georgia</option><option value="Times New Roman">Times New Roman</option><option value="Courier New">Courier New</option></select></div></div></div></div>
		', 12, NULL, N'Cân tìm 1 cuốn sách hay', NULL, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MABV], [TIEUDE], [NOIDUNG], [MAKH], [MANV], [MOTA], [LYDOTUCHOI], [THOIGIANLAP]) VALUES (3, N'Yêu cầu nhập thêm sách', N'
			<div class="content-row" id="content-row-0">
				<div class="post-element-controller" id="e-controller-0" style="display: none;">
					<div class="pec-row1">
						<button type="button" name="delete-element" title="Xóa cả khối và các thành phần."><i class="bi bi-trash3"></i></button>
						<button type="button" name="set-left" title="Căn trái."><i class="bi bi-text-left"></i></button>
						<button type="button" name="set-right" title="Căn phải."><i class="bi bi-text-right"></i></button>
					</div>
					<div class="pec-row2">
						<button type="button" name="set-top" title="Dồn các thành phần lên đỉnh." disabled=""><i class="bi bi-align-top"></i></button>
						<button type="button" name="set-middle" title="Dồn các thành phần vào giữa." disabled=""><i class="bi bi-align-center"></i></button>
						<button type="button" name="set-bottom" title="Dồn các thành phần xuống đáy." disabled=""><i class="bi bi-align-bottom"></i></button>
					</div>
					<div class="pec-row3">
						<button type="button" name="center-element-1" title="Căn giữa sát cạnh.">Lv1</button>
						<button type="button" name="center-element-2" title="Căn đều nội dung.">Lv2</button>
						<button type="button" name="center-element-3" title="Căn nội dung gần cạnh.">Lv3</button>
						<button class="non-disabled-btn" type="button" name="center-element-4" title="Gom toàn bộ nội dung vào giữa.">Lv4</button>
					</div>
					<div class="pec-row4">
						<button type="button" name="add-text" title="Thêm một khối chữ."><i class="bi bi-card-text"></i></button>
						<button type="button" name="add-image" title="Thêm một khối hình."><i class="bi bi-file-image"></i></button>
					</div>
				</div>
			<div class="post-text post-content" id="container-0-0 text-0"><div class="dragbar" style="width: 825px;"><div class="content-0 ctextarea" id="content-0" contenteditable="true" style="width: 100%; min-height: 30px; font-size: 16px; height: 28px;">Mong shop cập nhật thêm cuốn Anh chi yêu dấu của <u>Nguyễn Nhật Ánh</u> ạ!</div></div><div class="row-element-controller"><div class="text-controller"><button type="button" name="delete-element-row" title="Xóa khối chữ này."><i class="bi bi-trash3"></i></button><button type="button" name="set-left-row" title="Căn trái."><i class="bi bi-text-left"></i></button><button type="button" name="set-center-row" title="Căn giữa."><i class="bi bi-text-center"></i></button><button type="button" name="set-right-row" title="Căn phải."><i class="bi bi-text-right"></i></button></div><div class="font-controller"><input class="font-size-controller" type="number" name="fs-input" placeholder="Height" value="12"><select class="color-selector" name="text-color"><option value="red">Đỏ</option><option value="yellow">Vàng</option><option value="blue">Xanh dương</option><option value="green">Xanh lục</option><option value="black" selected="">Đen</option><option value="white">Trắng</option></select><select class="font-family-selector" name="font-family"><option value="Arial">Arial</option><option value="Verdana">Verdana</option><option value="Georgia">Georgia</option><option value="Times New Roman">Times New Roman</option><option value="Courier New">Courier New</option></select></div></div></div></div>
		,
			<div class="content-row" id="content-row-0" style="align-items: center;">
				<div class="post-element-controller" id="e-controller-0" style="display: none;">
					<div class="pec-row1">
						<button type="button" name="delete-element" title="Xóa cả khối và các thành phần."><i class="bi bi-trash3"></i></button>
						<button type="button" name="set-left" title="Căn trái."><i class="bi bi-text-left"></i></button>
						<button type="button" name="set-right" title="Căn phải."><i class="bi bi-text-right"></i></button>
					</div>
					<div class="pec-row2">
						<button type="button" name="set-top" title="Dồn các thành phần lên đỉnh."><i class="bi bi-align-top"></i></button>
						<button type="button" name="set-middle" title="Dồn các thành phần vào giữa."><i class="bi bi-align-center"></i></button>
						<button type="button" name="set-bottom" title="Dồn các thành phần xuống đáy."><i class="bi bi-align-bottom"></i></button>
					</div>
					<div class="pec-row3">
						<button type="button" name="center-element-1" title="Căn giữa sát cạnh.">Lv1</button>
						<button type="button" name="center-element-2" title="Căn đều nội dung.">Lv2</button>
						<button type="button" name="center-element-3" title="Căn nội dung gần cạnh.">Lv3</button>
						<button class="non-disabled-btn" type="button" name="center-element-4" title="Gom toàn bộ nội dung vào giữa.">Lv4</button>
					</div>
					<div class="pec-row4">
						<button type="button" name="add-text" title="Thêm một khối chữ."><i class="bi bi-card-text"></i></button>
						<button type="button" name="add-image" title="Thêm một khối hình."><i class="bi bi-file-image"></i></button>
					</div>
				</div>
			<div class="post-text post-content" id="container-0-0 text-0"><div class="dragbar" style="width: 538px; direction: ltr;"><div class="content-0 ctextarea" id="content-0" contenteditable="true" style="width: 100%; min-height: 30px; font-size: 16px; height: 28px;">Mong shop cập nhật thêm cuốn Anh chi yêu dấu của <u>Nguyễn Nhật Ánh</u> ạ!</div></div><div class="row-element-controller"><div class="text-controller"><button type="button" name="delete-element-row" title="Xóa khối chữ này."><i class="bi bi-trash3"></i></button><button type="button" name="set-left-row" title="Căn trái."><i class="bi bi-text-left"></i></button><button type="button" name="set-center-row" title="Căn giữa."><i class="bi bi-text-center"></i></button><button type="button" name="set-right-row" title="Căn phải."><i class="bi bi-text-right"></i></button></div><div class="font-controller"><input class="font-size-controller" type="number" name="fs-input" placeholder="Height" value="12"><select class="color-selector" name="text-color"><option value="red">Đỏ</option><option value="yellow">Vàng</option><option value="blue">Xanh dương</option><option value="green">Xanh lục</option><option value="black" selected="">Đen</option><option value="white">Trắng</option></select><select class="font-family-selector" name="font-family"><option value="Arial">Arial</option><option value="Verdana">Verdana</option><option value="Georgia">Georgia</option><option value="Times New Roman">Times New Roman</option><option value="Courier New">Courier New</option></select></div></div></div><div class="post-image post-content " id="image-1 container-1-0"><div class="dragbar dragbarb" style="width: 200px; height: 200px; direction: ltr;"><img src="data:image/jpeg;base64,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" alt="Image"></div><div class="row-element-controller"><div class="text-controller"><button type="button" name="delete-element-row" title="Xóa hình này."><i class="bi bi-trash3"></i></button></div><div class="size-controller"></div></div></div></div>
		', 14, NULL, N'<Không có tiêu đề>', NULL, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[BaiViet] OFF
GO
INSERT [dbo].[CT_DanhGia] ([MAKH], [MASACH], [NOIDUNG], [THOIGIAN], [VOTE]) VALUES (1, 1, N'Hay, ý nghĩa', CAST(N'2024-06-05T00:00:00.000' AS DateTime), 5)
GO
INSERT [dbo].[CT_DonDatHang] ([MADDH], [MASACH], [SOLUONG], [DONGIA]) VALUES (1, 1, 1, 100)
GO
INSERT [dbo].[CT_GioHang] ([IDGH], [MASACH], [SOLUONG], [DONGIA], [CHON]) VALUES (1010, 79, 1, 80000, 0)
GO
INSERT [dbo].[CT_HoaDon] ([MAHD], [MASACH], [SOLUONG], [DONGIA]) VALUES (1, 1, 10, 20000)
GO
INSERT [dbo].[CT_KhuyenMai] ([MAKM], [MASACH], [TYLE]) VALUES (1, 1, 10)
INSERT [dbo].[CT_KhuyenMai] ([MAKM], [MASACH], [TYLE]) VALUES (1, 2, 10)
INSERT [dbo].[CT_KhuyenMai] ([MAKM], [MASACH], [TYLE]) VALUES (3, 2, 20)
GO
INSERT [dbo].[CT_Nhap] ([MAPN], [MASACH], [SOLUONG], [DONGIA]) VALUES (1, 1, 1, 100)
GO
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MADDH], [NGAYLAP], [MANCC], [MANV], [MAKHOMOI]) VALUES (1, CAST(N'2024-04-11T00:00:00.000' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([IDGH], [NGAYLAP], [MAKH]) VALUES (1, CAST(N'2024-02-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[GioHang] ([IDGH], [NGAYLAP], [MAKH]) VALUES (1004, CAST(N'2024-06-10T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[GioHang] ([IDGH], [NGAYLAP], [MAKH]) VALUES (1005, CAST(N'2024-06-10T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[GioHang] ([IDGH], [NGAYLAP], [MAKH]) VALUES (1006, CAST(N'2024-06-10T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[GioHang] ([IDGH], [NGAYLAP], [MAKH]) VALUES (1007, CAST(N'2024-06-10T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[GioHang] ([IDGH], [NGAYLAP], [MAKH]) VALUES (1008, CAST(N'2024-06-10T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[GioHang] ([IDGH], [NGAYLAP], [MAKH]) VALUES (1009, CAST(N'2024-06-10T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[GioHang] ([IDGH], [NGAYLAP], [MAKH]) VALUES (1010, CAST(N'2024-06-10T00:00:00.000' AS DateTime), 14)
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MAHD], [NGAYLAP], [MANV], [MAKH], [TONGTIEN], [HOTENNN], [DIACHINN], [SDTNN], [EMAILNN], [GHICHU], [TRANGTHAI]) VALUES (1, CAST(N'2024-04-11T00:00:00.000' AS DateTime), 1, 1, 200000, N'Kiều Thương', N'Quận 9', N'02314566245', N'thuong@gmail.com', NULL, 5)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MAKH], [HO], [TEN], [EMAIL], [SDT], [NGAYSINH], [GIOITINH]) VALUES (1, N'Lê', N'Bê', N'ADMIN@gmail.com', N'0245778888', CAST(N'2003-02-02' AS Date), 1)
INSERT [dbo].[KhachHang] ([MAKH], [HO], [TEN], [EMAIL], [SDT], [NGAYSINH], [GIOITINH]) VALUES (8, N'Phạm Bùi Nam', N'Phương', N'n21dccn167@student.ptithcm.edu.vn', N'0942538652', CAST(N'2003-09-25' AS Date), 1)
INSERT [dbo].[KhachHang] ([MAKH], [HO], [TEN], [EMAIL], [SDT], [NGAYSINH], [GIOITINH]) VALUES (9, N'Nguyễn Phi', N'Long', N'1@student.ptithcm.edu.vn', N'0923232323', CAST(N'2003-12-02' AS Date), 1)
INSERT [dbo].[KhachHang] ([MAKH], [HO], [TEN], [EMAIL], [SDT], [NGAYSINH], [GIOITINH]) VALUES (10, N'Tô Phan Kiều', N'Thương', N'2@student.ptithcm.edu.vn', N'0923232323', CAST(N'2003-06-06' AS Date), 0)
INSERT [dbo].[KhachHang] ([MAKH], [HO], [TEN], [EMAIL], [SDT], [NGAYSINH], [GIOITINH]) VALUES (11, N'Nguyễn Phúc Minh', N'Khang', N'3@student.ptithcm.edu.vn', N'0923232323', CAST(N'2003-01-01' AS Date), 1)
INSERT [dbo].[KhachHang] ([MAKH], [HO], [TEN], [EMAIL], [SDT], [NGAYSINH], [GIOITINH]) VALUES (12, N'Nguyễn Tấn', N'Nguyên', N'4@student.ptithcm.edu.vn', N'0923232323', CAST(N'2003-01-01' AS Date), 1)
INSERT [dbo].[KhachHang] ([MAKH], [HO], [TEN], [EMAIL], [SDT], [NGAYSINH], [GIOITINH]) VALUES (13, N'Nguyễn Thị Mỹ', N'Duyên', N'5@student.ptithcm.edu.vn', N'0923232323', CAST(N'2003-01-01' AS Date), 0)
INSERT [dbo].[KhachHang] ([MAKH], [HO], [TEN], [EMAIL], [SDT], [NGAYSINH], [GIOITINH]) VALUES (14, N'Vũ Thị Thanh', N'Thuỳ', N'6@student.ptithcm.edu.vn', N'0923232323', CAST(N'2003-01-01' AS Date), 0)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhoMoi] ON 

INSERT [dbo].[KhoMoi] ([MAKHOMOI], [DIACHI], [TENKHOMOI]) VALUES (1, N'QUẬN 1', N'Kho Trung Tâm')
INSERT [dbo].[KhoMoi] ([MAKHOMOI], [DIACHI], [TENKHOMOI]) VALUES (2, N'Quận Thủ Đức', N'Kho số 7')
INSERT [dbo].[KhoMoi] ([MAKHOMOI], [DIACHI], [TENKHOMOI]) VALUES (3, N'Quận 8', N'Kho Lĩnh Chi')
SET IDENTITY_INSERT [dbo].[KhoMoi] OFF
GO
SET IDENTITY_INSERT [dbo].[KhuyenMai] ON 

INSERT [dbo].[KhuyenMai] ([MAKM], [TENKM], [NGAYBD], [NGAYKT]) VALUES (1, N'GIỜ VÀNG', CAST(N'2024-04-11T00:00:00.000' AS DateTime), CAST(N'2024-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[KhuyenMai] ([MAKM], [TENKM], [NGAYBD], [NGAYKT]) VALUES (3, N'Hè đến rồi', CAST(N'2024-06-08T00:00:00.000' AS DateTime), CAST(N'2024-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[KhuyenMai] ([MAKM], [TENKM], [NGAYBD], [NGAYKT]) VALUES (4, N'Năm học mới', CAST(N'2024-06-06T00:00:00.000' AS DateTime), CAST(N'2024-09-08T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KhuyenMai] OFF
GO
SET IDENTITY_INSERT [dbo].[LuotThich] ON 

INSERT [dbo].[LuotThich] ([MALT], [CAMXUC]) VALUES (1, N'Thích')
INSERT [dbo].[LuotThich] ([MALT], [CAMXUC]) VALUES (2, N'Thương thương')
INSERT [dbo].[LuotThich] ([MALT], [CAMXUC]) VALUES (3, N'Ghét')
INSERT [dbo].[LuotThich] ([MALT], [CAMXUC]) VALUES (4, N'Yêu thích')
SET IDENTITY_INSERT [dbo].[LuotThich] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MANCC], [TENNCC], [DIACHI], [SDT], [EMAIL]) VALUES (1, N'Nhà sách Fahasa', N'QUẬN 9', N'0875442145', N'fahasa@gmail.com')
INSERT [dbo].[NhaCungCap] ([MANCC], [TENNCC], [DIACHI], [SDT], [EMAIL]) VALUES (2, N'Nhà sách Đại Nam', N'Quận 1', N'0987654321', N'dainam@gmail.com')
INSERT [dbo].[NhaCungCap] ([MANCC], [TENNCC], [DIACHI], [SDT], [EMAIL]) VALUES (3, N'Nhà sách Vĩnh Thụy', N'Quận 3', N'0998877661', N'vinhthuy@gmail.com')
INSERT [dbo].[NhaCungCap] ([MANCC], [TENNCC], [DIACHI], [SDT], [EMAIL]) VALUES (4, N'Nhà sách Tư Nam', N'Quận 10', N'0129999999', N'tunam@gmail.com')
INSERT [dbo].[NhaCungCap] ([MANCC], [TENNCC], [DIACHI], [SDT], [EMAIL]) VALUES (5, N'Nhà sách Thế Là Hay', N'Quận 12', N'0299999856', N'hay@gmail.com')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [CCCD], [SDT], [EMAIL], [GIOITINH], [NGAYSINH]) VALUES (1, N'Lê', N'Bê', N'0245894587', N'0358945658', N'leba@gmail.com', 0, CAST(N'2001-08-09' AS Date))
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [CCCD], [SDT], [EMAIL], [GIOITINH], [NGAYSINH]) VALUES (7, N'Phạm Bùi Nam', N'Phương', N'0000000000', N'0942538652', N'n21dccn167@student.ptithcm.edu.vn', 1, CAST(N'2003-09-25' AS Date))
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [CCCD], [SDT], [EMAIL], [GIOITINH], [NGAYSINH]) VALUES (8, N'Nguyễn Phi', N'Long', N'0000000001', N'0923232323', N'1@student.ptithcm.edu.vn', 1, CAST(N'2003-12-02' AS Date))
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [CCCD], [SDT], [EMAIL], [GIOITINH], [NGAYSINH]) VALUES (9, N'Tô Phan Kiều', N'Thương', N'0000000002', N'0923232323', N'2@student.ptithcm.edu.vn', 0, CAST(N'2003-06-06' AS Date))
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [CCCD], [SDT], [EMAIL], [GIOITINH], [NGAYSINH]) VALUES (10, N'Nguyễn Phúc Minh', N'Khang', N'0000000003', N'0923232323', N'3@student.ptithcm.edu.vn', 1, CAST(N'2003-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([MANXB], [TENNXB], [EMAIL], [SDT], [DIACHI]) VALUES (1, N'KIM ĐỒNG', N'kimdong@gmail.com', N'0235555555', N'quận 9')
INSERT [dbo].[NhaXuatBan] ([MANXB], [TENNXB], [EMAIL], [SDT], [DIACHI]) VALUES (2, N'Đại học quốc gia TP.HCM', N'qgtphcm@gmail.com', N'0125487547', N'Quận Thủ Đức')
INSERT [dbo].[NhaXuatBan] ([MANXB], [TENNXB], [EMAIL], [SDT], [DIACHI]) VALUES (3, N'Thủ Dầu Một', N'thudaumot@gmail.com', N'0215422222', N'Bình Dương')
INSERT [dbo].[NhaXuatBan] ([MANXB], [TENNXB], [EMAIL], [SDT], [DIACHI]) VALUES (4, N'Fahasa', N'fahasa@gmail.com', N'0215421452', N'Quận Thủ Đức')
INSERT [dbo].[NhaXuatBan] ([MANXB], [TENNXB], [EMAIL], [SDT], [DIACHI]) VALUES (5, N'Shōsetsuka ni Narō', N'none@gmail.com', N'0123456789', N'Tokyo')
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MAPN], [NGAYLAP], [MAKHOMOI], [MADDH], [MANV]) VALUES (1, CAST(N'2024-05-11T00:00:00.000' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([MASACH], [TENSACH], [LANTAIBAN], [MATL], [MATG], [MANCC], [MANXB], [GIA], [ANH], [SOLUONGTON], [SOLUONGBAN]) VALUES (1, N'Cuộc đời của Pi', 1, 1, 1, 1, 1, 30000, N'cdcp.jpg', 80, 50)
INSERT [dbo].[Sach] ([MASACH], [TENSACH], [LANTAIBAN], [MATL], [MATG], [MANCC], [MANXB], [GIA], [ANH], [SOLUONGTON], [SOLUONGBAN]) VALUES (2, N'Tôi thấy hoa vàng trên cỏ xanh', 1, 3, 1, 1, 1, 120000, N'tthvtcx.jpg', 200, 0)
INSERT [dbo].[Sach] ([MASACH], [TENSACH], [LANTAIBAN], [MATL], [MATG], [MANCC], [MANXB], [GIA], [ANH], [SOLUONGTON], [SOLUONGBAN]) VALUES (79, N'Con mả con ma', 3, 3, 2, 1, 1, 80000, N'9015-con-ma-con-ma-1.jpg', 100, 90)
INSERT [dbo].[Sach] ([MASACH], [TENSACH], [LANTAIBAN], [MATL], [MATG], [MANCC], [MANXB], [GIA], [ANH], [SOLUONGTON], [SOLUONGBAN]) VALUES (80, N'Cách mạng rơm', 2, 5, 3, 1, 1, 20000, N'169-cach-mang-rom-nong-nghiep-vo-vi-1.jpg', 100, 100)
INSERT [dbo].[Sach] ([MASACH], [TENSACH], [LANTAIBAN], [MATL], [MATG], [MANCC], [MANXB], [GIA], [ANH], [SOLUONGTON], [SOLUONGBAN]) VALUES (81, N'Người cha tốt hơn là người thầy tốt', 1, 12, 2, 1, 1, 120000, N'297-nguoi-cha-tot-hon-la-nguoi-thay-tot-1.jpg', 100, 0)
INSERT [dbo].[Sach] ([MASACH], [TENSACH], [LANTAIBAN], [MATL], [MATG], [MANCC], [MANXB], [GIA], [ANH], [SOLUONGTON], [SOLUONGBAN]) VALUES (83, N'無職転生 〜異世界行ったら本気だす〜', 1, 2, 4, 1, 5, 140000, N'Mushoku_Tensei_1.jpeg', 1, 1)
SET IDENTITY_INSERT [dbo].[Sach] OFF
GO
SET IDENTITY_INSERT [dbo].[TacGia] ON 

INSERT [dbo].[TacGia] ([MATG], [HO], [TEN], [EMAIL]) VALUES (1, N'LÊ', N'LA', N'lela@gmail.com')
INSERT [dbo].[TacGia] ([MATG], [HO], [TEN], [EMAIL]) VALUES (2, N'Nguyễn Nhật', N'Ánh', N'nnAnh@gmail.com')
INSERT [dbo].[TacGia] ([MATG], [HO], [TEN], [EMAIL]) VALUES (3, N'Fukuoka', N'Masanobu', NULL)
INSERT [dbo].[TacGia] ([MATG], [HO], [TEN], [EMAIL]) VALUES (4, N'Magonote', N'Rifujin na', NULL)
SET IDENTITY_INSERT [dbo].[TacGia] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([ID], [USERNAME], [PASSWORD], [MAKH], [MANV]) VALUES (1, N'admin', N'admin', 1, N'1         ')
INSERT [dbo].[TaiKhoan] ([ID], [USERNAME], [PASSWORD], [MAKH], [MANV]) VALUES (8, N'phuongp2003', N'2003925', 8, N'7         ')
INSERT [dbo].[TaiKhoan] ([ID], [USERNAME], [PASSWORD], [MAKH], [MANV]) VALUES (9, N'nplong2003', N'nplong2003', 9, N'8         ')
INSERT [dbo].[TaiKhoan] ([ID], [USERNAME], [PASSWORD], [MAKH], [MANV]) VALUES (10, N'tpkthuong2003', N'tpkthuong2003', 10, N'9         ')
INSERT [dbo].[TaiKhoan] ([ID], [USERNAME], [PASSWORD], [MAKH], [MANV]) VALUES (11, N'npmkhang2003', N'npmkhang2003', 11, N'10        ')
INSERT [dbo].[TaiKhoan] ([ID], [USERNAME], [PASSWORD], [MAKH], [MANV]) VALUES (12, N'ntnguyen2003', N'ntnguyen2003', 12, NULL)
INSERT [dbo].[TaiKhoan] ([ID], [USERNAME], [PASSWORD], [MAKH], [MANV]) VALUES (13, N'ntmduyen2003', N'ntmduyen2003', 13, NULL)
INSERT [dbo].[TaiKhoan] ([ID], [USERNAME], [PASSWORD], [MAKH], [MANV]) VALUES (14, N'vttthuy2003', N'vttthuy2003', 14, NULL)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([MATL], [TENTL]) VALUES (1, N'Kinh dị')
INSERT [dbo].[TheLoai] ([MATL], [TENTL]) VALUES (2, N'Tiểu thuyết')
INSERT [dbo].[TheLoai] ([MATL], [TENTL]) VALUES (3, N'Văn Học')
INSERT [dbo].[TheLoai] ([MATL], [TENTL]) VALUES (5, N'Sinh Học')
INSERT [dbo].[TheLoai] ([MATL], [TENTL]) VALUES (12, N'Giáo dục')
INSERT [dbo].[TheLoai] ([MATL], [TENTL]) VALUES (23, N'Kinh tế')
INSERT [dbo].[TheLoai] ([MATL], [TENTL]) VALUES (24, N'Tiếng anh')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
GO
INSERT [dbo].[TrangThai] ([MATT], [TENTT]) VALUES (1, N'Chưa duyệt')
INSERT [dbo].[TrangThai] ([MATT], [TENTT]) VALUES (2, N'Đã duyệt')
INSERT [dbo].[TrangThai] ([MATT], [TENTT]) VALUES (3, N'Nhận Hàng')
INSERT [dbo].[TrangThai] ([MATT], [TENTT]) VALUES (4, N'Đang giao')
INSERT [dbo].[TrangThai] ([MATT], [TENTT]) VALUES (5, N'Hoàn thành')
INSERT [dbo].[TrangThai] ([MATT], [TENTT]) VALUES (6, N'Hủy')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_KhachHang_EMAIL]    Script Date: 10/06/2024 04:27:28 ******/
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [UK_KhachHang_EMAIL] UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_NhaCungCap_TENNCC]    Script Date: 10/06/2024 04:27:28 ******/
ALTER TABLE [dbo].[NhaCungCap] ADD  CONSTRAINT [UK_NhaCungCap_TENNCC] UNIQUE NONCLUSTERED 
(
	[TENNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_NhaXuatBan_TENNXB]    Script Date: 10/06/2024 04:27:28 ******/
ALTER TABLE [dbo].[NhaXuatBan] ADD  CONSTRAINT [UK_NhaXuatBan_TENNXB] UNIQUE NONCLUSTERED 
(
	[TENNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_PhieuNhap_MADDH]    Script Date: 10/06/2024 04:27:28 ******/
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [UK_PhieuNhap_MADDH] UNIQUE NONCLUSTERED 
(
	[MADDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_TaiKhoan_MAKH]    Script Date: 10/06/2024 04:27:28 ******/
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [UK_TaiKhoan_MAKH] UNIQUE NONCLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_TaiKhoan_USERNAME]    Script Date: 10/06/2024 04:27:28 ******/
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [UK_TaiKhoan_USERNAME] UNIQUE NONCLUSTERED 
(
	[USERNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BaiViet] ADD  CONSTRAINT [DF_BaiViet_THOIGIANLAP]  DEFAULT (getdate()) FOR [THOIGIANLAP]
GO
ALTER TABLE [dbo].[CT_GioHang] ADD  CONSTRAINT [DF_CT_GioHang_CHON]  DEFAULT ((0)) FOR [CHON]
GO
ALTER TABLE [dbo].[GioHang] ADD  CONSTRAINT [DF_GioHang_NGAYLAP]  DEFAULT (getdate()) FOR [NGAYLAP]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_HoaDon_TRANGTHAI]  DEFAULT ((1)) FOR [TRANGTHAI]
GO
ALTER TABLE [dbo].[Sach] ADD  CONSTRAINT [DF_Sach_SOLUONGBAN]  DEFAULT ((0)) FOR [SOLUONGBAN]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [FK_BaiViet_KhachHang_MAKH] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KhachHang] ([MAKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [FK_BaiViet_KhachHang_MAKH]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_BaiViet_MABV] FOREIGN KEY([MABV])
REFERENCES [dbo].[BaiViet] ([MABV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_BaiViet_MABV]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_TaiKhoan_MATK] FOREIGN KEY([MATK])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_TaiKhoan_MATK]
GO
ALTER TABLE [dbo].[CT_DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_CT_DanhGia_KhachHang_MAKH] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KhachHang] ([MAKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_DanhGia] CHECK CONSTRAINT [FK_CT_DanhGia_KhachHang_MAKH]
GO
ALTER TABLE [dbo].[CT_DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_CT_DanhGia_Sach_MASACH] FOREIGN KEY([MASACH])
REFERENCES [dbo].[Sach] ([MASACH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_DanhGia] CHECK CONSTRAINT [FK_CT_DanhGia_Sach_MASACH]
GO
ALTER TABLE [dbo].[CT_DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_CT_DonDatHang_DonDatHang_MADDH] FOREIGN KEY([MADDH])
REFERENCES [dbo].[DonDatHang] ([MADDH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_DonDatHang] CHECK CONSTRAINT [FK_CT_DonDatHang_DonDatHang_MADDH]
GO
ALTER TABLE [dbo].[CT_DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_CT_DonDatHang_Sach_MASACH] FOREIGN KEY([MASACH])
REFERENCES [dbo].[Sach] ([MASACH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_DonDatHang] CHECK CONSTRAINT [FK_CT_DonDatHang_Sach_MASACH]
GO
ALTER TABLE [dbo].[CT_GioHang]  WITH CHECK ADD  CONSTRAINT [FK_CT_GioHang_GioHang_IDGH] FOREIGN KEY([IDGH])
REFERENCES [dbo].[GioHang] ([IDGH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_GioHang] CHECK CONSTRAINT [FK_CT_GioHang_GioHang_IDGH]
GO
ALTER TABLE [dbo].[CT_GioHang]  WITH CHECK ADD  CONSTRAINT [FK_CT_GioHang_Sach_MASACH] FOREIGN KEY([MASACH])
REFERENCES [dbo].[Sach] ([MASACH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_GioHang] CHECK CONSTRAINT [FK_CT_GioHang_Sach_MASACH]
GO
ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CT_HoaDon_HoaDon_MAHD] FOREIGN KEY([MAHD])
REFERENCES [dbo].[HoaDon] ([MAHD])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [FK_CT_HoaDon_HoaDon_MAHD]
GO
ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CT_HoaDon_Sach_MASACH] FOREIGN KEY([MASACH])
REFERENCES [dbo].[Sach] ([MASACH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [FK_CT_HoaDon_Sach_MASACH]
GO
ALTER TABLE [dbo].[CT_KhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_CT_KhuyenMai_KhuyenMai_MAKM] FOREIGN KEY([MAKM])
REFERENCES [dbo].[KhuyenMai] ([MAKM])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_KhuyenMai] CHECK CONSTRAINT [FK_CT_KhuyenMai_KhuyenMai_MAKM]
GO
ALTER TABLE [dbo].[CT_KhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_CT_KhuyenMai_Sach_MASACH] FOREIGN KEY([MASACH])
REFERENCES [dbo].[Sach] ([MASACH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_KhuyenMai] CHECK CONSTRAINT [FK_CT_KhuyenMai_Sach_MASACH]
GO
ALTER TABLE [dbo].[CT_Nhap]  WITH CHECK ADD  CONSTRAINT [FK_CT_Nhap_PhieuNhap_MAPN] FOREIGN KEY([MAPN])
REFERENCES [dbo].[PhieuNhap] ([MAPN])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_Nhap] CHECK CONSTRAINT [FK_CT_Nhap_PhieuNhap_MAPN]
GO
ALTER TABLE [dbo].[CT_Nhap]  WITH CHECK ADD  CONSTRAINT [FK_CT_Nhap_Sach_MASACH] FOREIGN KEY([MASACH])
REFERENCES [dbo].[Sach] ([MASACH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_Nhap] CHECK CONSTRAINT [FK_CT_Nhap_Sach_MASACH]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhoMoi_MAKHOMOI] FOREIGN KEY([MAKHOMOI])
REFERENCES [dbo].[KhoMoi] ([MAKHOMOI])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhoMoi_MAKHOMOI]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_NhaCungCap_MANCC] FOREIGN KEY([MANCC])
REFERENCES [dbo].[NhaCungCap] ([MANCC])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_NhaCungCap_MANCC]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_NhanVien_MANV] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_NhanVien_MANV]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_KhachHang_MAKH] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KhachHang] ([MAKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_KhachHang_MAKH]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang_MAKH] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KhachHang] ([MAKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang_MAKH]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TrangThai_MATT] FOREIGN KEY([TRANGTHAI])
REFERENCES [dbo].[TrangThai] ([MATT])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TrangThai_MATT]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_DonDatHang_MADDH] FOREIGN KEY([MADDH])
REFERENCES [dbo].[DonDatHang] ([MADDH])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_DonDatHang_MADDH]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_KhoMoi_MAKHOMOI] FOREIGN KEY([MAKHOMOI])
REFERENCES [dbo].[KhoMoi] ([MAKHOMOI])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_KhoMoi_MAKHOMOI]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien_MANV] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien_MANV]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NhaXuatBan_MANXB] FOREIGN KEY([MANXB])
REFERENCES [dbo].[NhaXuatBan] ([MANXB])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_NhaXuatBan_MANXB]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_TacGia_MATG] FOREIGN KEY([MATG])
REFERENCES [dbo].[TacGia] ([MATG])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_TacGia_MATG]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_TheLoai_MATL] FOREIGN KEY([MATL])
REFERENCES [dbo].[TheLoai] ([MATL])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_TheLoai_MATL]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_KhachHang_MAKH] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KhachHang] ([MAKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_KhachHang_MAKH]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [CK_TaiKhoan_MAKH_MANV] CHECK  (([MAKH]=NULL AND [MANV]=NULL OR [MAKH]<>NULL AND [MANV]<>NULL))
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [CK_TaiKhoan_MAKH_MANV]
GO
