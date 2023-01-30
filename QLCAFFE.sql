Create database QLCaFFe
go 
Use QLCaFFe

Create Table NHANVIEN(
MaNV Nvarchar(50) primary key,
 TenNV Nvarchar(50),
 DiaChi Nvarchar(50),
 SDT varchar(30),
 ChucVu Nvarchar(50),
 NgayVaoLam datetime,
 GioiTinh Nvarchar(50),
 PhanQuyen Nvarchar(50), 
 MatKhau Nvarchar(50)
)
Create Table KHACHHANG(
MaKH Nvarchar(50) primary key,
 TenKH Nvarchar(50),
 DiaChi Nvarchar(50),
 SDT varchar(30),
 DiemTL int,

)
Create table LOAIKHACHHANG(
MaLKH Nvarchar(50) primary key,
 TenKH Nvarchar(50),
 GiamGia int
 CONSTRAINT FK_LOAIKHACHHANG_KHACHHANG   foreign key(MaLKH ) references KhachHang(MaKH),
)
--DRop table LOAIKHACHHANG
Create table HANGHOA(
MaHH Nvarchar(50) PRIMARY KEY,
 TenHH Nvarchar(50),
 SoLuong int,
 HinhAnh image,
 GiaSP float, 
)

Create table LOAIHANGHOA(
 MaLH Nvarchar(50) primary key,
 TenLH Nvarchar(50),
 MoTa Nvarchar(50),
  CONSTRAINT FK_LOAIHANGHOA_HANGHOA  foreign key(MaLH) references HANGHOA(MaHH),
)


Create table CALAMVIEC(
 MaCLV Nvarchar(50) primary key,
 TenCLV Nvarchar(50),
 GioBD time,
 GioKT time,
 SoTien float
)

Create table HOADONBANHANG(
MaHDBH Nvarchar(50) primary key,
NgayHDBH datetime,
Tongtien float,
GiamGia float,
ChiPhiKhac float,
DiemTL float,
 CONSTRAINT FK_HOADONBANHANG_KHACHHANG   foreign key(MaHDBH) references KHACHHANG(MaKH),
 CONSTRAINT FK_HOADONBANHANG_NHANVIEN   foreign key(MaHDBH) references NHANVIEN(MaNV),
 
)

Create table KHUVUC(
MaKV Nvarchar(50) primary key,
 TenKV  Nvarchar(50),
 TrangThai  Nvarchar(50)

)

Create table Ban(
MaBan Nvarchar(50) primary key,
 TenBan Nvarchar(50),
 ThuocTinh Nvarchar(50)
 CONSTRAINT FK_Ban_KHUVUC  foreign key(MaBan ) references KHUVUC (MaKV),
 CONSTRAINT FK_Ban_HOADONKHACHHANG foreign key(MaBan ) references HOADONBANHANG(MaHDBH),
)