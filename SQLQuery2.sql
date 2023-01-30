Create database QLCaFFe
go 
Use QLCaFFe

Create Table NhanVien(
MaNV Nvarchar(50) primary key,
 TenNV Nvarchar(50) ,
 DiaChi Nvarchar(50) ,
 SDT int,
 ChucVu Nvarchar(50),
 NgayVaoLam date ,
 GioiTinh bit,
 Roles bit, 
 TaiKhoan NVARCHAR(50),
 MatKhau Nvarchar(50)
)

Create Table KhachHang(
MaKH int primary key,
 TenKH Nvarchar(50),
 DiaChi Nvarchar(50),
 SDT int,
 DiemTL int,

)




Create table LoaiHangHoa(
 MaLH Nvarchar(50) primary key,
 TenLH Nvarchar(50),
 MoTa Nvarchar(50),
)

Create table HangHoa(
MaHH Nvarchar(50) PRIMARY KEY,
 TenHH Nvarchar(50),
 MaLH nvarchar(50), 
 HinhAnh image,
 GiaSP int, 
 CONSTRAINT FK_HangHoa_LoaiHangHoa FOREIGN KEY(MaLH) REFERENCES LoaiHangHoa (MaLH)
)
Create table CaLam(
 MaCLV Nvarchar(50) primary key,
 TenCLV Nvarchar(50),
 GioBD time,
 GioKT time,
 SoTien int 
)



Create table KhuVuc(
MaKV Nvarchar(50) primary key,
 TenKV  Nvarchar(50),
 TrangThai  Nvarchar(50)

)

Create table Ban(
MaBan Nvarchar(50) primary key,
 TenBan Nvarchar(50),
 MaKV Nvarchar(50),
 ThuocTinh Nvarchar(50),
 CONSTRAINT FK_Ban_KhuVuc  foreign key(MaBan ) references KhuVuc (MaKV)
)
Create table HoaDonBanHang(
MaHDBH int  primary key,
MaNV nvarchar(50),
MaBan nvarchar(50),
MaKH int ,
NgayHDBH datetime,
Tongtien int,
DiemTL int ,

 CONSTRAINT FK_HoaDonBanHang_KhachHang   foreign key(MaKH) references KhachHang(MaKH),
 CONSTRAINT FK_HoaDonBanHang_NhanVien   foreign key(MaNV) references NhanVien(MaNV),
  CONSTRAINT FK_HoaDonBanHang_Ban   foreign key(MaBan) references Ban(MaBan),
)
CREATE TABLE HoaDonChiTiet(
MaHDBH int ,
MaHH nvarchar(50),
SoLuong int ,
CONSTRAINT PK_HoaDonChiTiet PRIMARY KEY(MaHDBH,MaHH),
CONSTRAINT FK_HoaDonChiTiet_HoaDonBanHang FOREIGN KEY (MaHDBH) REFERENCES HoaDonBanHang(MaHDBH),
CONSTRAINT FK_HoaDonChiTiet_HangHoa Foreign key(MaHH) REFERENCES HangHoa(MaHH)
)

CREATE TABLE ChiTietLuongNV(
MaCLV nvarchar(50),
MaNV nvarchar(50),
TongSoCaTrongThang int,
ThanhTien int ,
KyThangLuong nvarchar(30),
CONSTRAINT PK_ChiTietLuongNV PRIMARY KEY(MaCLV,MaNV),
CONSTRAINT FK_ChiTietLuongNV_CaLam FOREIGN KEY(MaCLV) REFERENCES CaLam(MaCLV),
CONSTRAINT FK_ChiTietLuongNV_NhanVien FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV)
)