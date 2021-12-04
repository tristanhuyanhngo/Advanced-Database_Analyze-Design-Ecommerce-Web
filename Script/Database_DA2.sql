create database ADB1_6_DATH2
go 
use ADB1_6_DATH2
go

create table KhachHang
(
	MaKhachHang varchar(15) primary key,
	HoTenKhachHang nvarchar(50),
	GioiTinhKhachHang nvarchar(10),
	NgaySinhKhachHang date,
	SoNha varchar(10),
	TenDuong nvarchar(20),
	Tinh_ThanhPho nvarchar(20),
	Quan_Huyen nvarchar(20),
	Phuong_Xa nvarchar(20),
	CHECK (GioiTinhKhachHang IN(N'Nam', N'Nữ'))
)

create table Be
(
	MaBe varchar(15) primary key,
	TenBe nvarchar(30),
	NgaySinh date,
	GioiTinh nvarchar(20),
	KhachHang varchar(15) not null,
	CHECK (GioiTinh IN('Nam', N'Nữ'))
)	

create table DiaChiGiaoHang
(
	MaDiaChi varchar(15) primary key,
	SoNha varchar(10),
	TenDuong nvarchar(20),
	Tinh_ThanhPho nvarchar(20),
	Quan_Huyen nvarchar(20),
	Phuong_Xa nvarchar(20),
	SoDienThoai varchar(20),
	KhachHang varchar(15) not null
)

create table SanPhamYeuThich
(
	MaKhachHang varchar(15),
	MaSanPham varchar(15),
	primary key(MaKhachHang, MaSanPham)
)

create table SanPhamDaXem
(
	MaKhachHang varchar(15),
	MaSanPham varchar(15),
	primary key(MaKhachHang, MaSanPham)
)

create table SanPham
(
	MaSanPham varchar(15) PRIMARY KEY,
	TenSanPham nvarchar(30),
	DonGia int, 
	MoTaSanPham nvarchar(80),
	LoaiSanPham varchar(15) not null,
	ThuongHieu varchar(15),
	CHECK(DonGia>0)
)

create table SanPhamMuaCung
(
	MaSanPham varchar(15),
	SanPhamMuaCung varchar(15),
	primary key(MaSanPham, SanPhamMuaCung)
)

create table NhanXet
(
	MaNhanXet varchar(15) primary key,
	ThoiGianNhanXet datetime,
	NoiDung nvarchar(80),
	NguoiNhanXet varchar(15) not null,
	SanPham varchar(15) not null
)

create table PhieuGiamGia
(
	MaPhieu varchar(15) primary key,
	ThoiGianHieuLuc date,
	ThoiGianHetHan date,
	PhanTramGiamGia int,
	SoTienGiam int CHECK(SoTienGiam>=0),
	NoiDung nvarchar(80),
	TenPhieu nvarchar(30),
	KhachHang varchar(15) not null,
	TinhTrang nvarchar(20),
	DonHang varchar(15),
	CHECK(PhanTramGiamGia >= 0 and PhanTramGiamGia <= 100),
	CHECK (TinhTrang in (N'Chưa xài', N'Đã xài')),
	CHECK(ThoiGianHieuLuc < ThoiGianHetHan)
)

create table ThongBao
(
	MaThongBao varchar(15) primary key,
	TenThongBao nvarchar(30),
	NoiDung nvarchar(80),
	ThoiGianThongBao date,
	KhachHang varchar(15)
)

create table LoaiSanPham
(
	MaLoai varchar(15) primary key,
	TenLoai nvarchar(30)
)

create table ThuongHieu
(
	MaThuongHieu varchar(15) primary key,
	TenThuongHieu nvarchar(30),
	MoTaThuongHieu nvarchar(80)
)

create table TheVip
(
	MaTaiKhoan varchar(15) primary key,
	LoaiThe nvarchar(30),
	ThoiHan date,
	Check (LoaiThe in ('Diamond','Gold'))
)

create table SieuThi
(
	MaSieuThi varchar(15) primary key,
	TenSieuThi nvarchar(30),
	TruongSieuThi nvarchar(30),
	SoDienThoaiLienLac varchar(20),
	GioMoCua time,
	GioDongCua time,
	TenDuong nvarchar(20),
	Tinh_ThanhPho nvarchar(20),
	Quan_Huyen nvarchar(20),
	Phuong_Xa nvarchar(20),
	QuanLy varchar(15) not null
)

create table ChiTietSieuThi
(
	MaSieuThi varchar(15),
	MaSanPham varchar(15),
	SoLuong int,
	primary key(MaSieuThi,MaSanPham)
)

create table DonHang
(
	MaDonHang varchar(15) primary key,
	SoDienThoaiKhachHang varchar(10),
	VAT int, 
	TongSanPham int, 
	TongTien int,
	ThoiGianDatHang datetime,
	ThoiGianNhanHangDuKien datetime,
	DonViVanChuyen nvarchar(30),
	HinhThucThanhToan nvarchar(30),
	DiemTichLuy int,
	DiaChiGiaoHang varchar(15) not null,
	MaKhachHang varchar(15) not null,
	SieuThi varchar(15),
	CHECK (DonViVanChuyen IN('AhaMove', 'GrabExpress','Viettel')),
	CHECK (VAT >=0 ),
	CHECK (HinhThucThanhToan IN('COD', 'ATM','VISA','VNPAY','ZALOPAY', 'MOMO')),
	CHECK (ThoiGianNhanHangDuKien > ThoiGianDatHang)
)

create table  ChiTietDonHang
(
	MaDonHang varchar(15),
	MaSanPham varchar(15),
	SoLuong int,
	DonGia int,
	primary key(MaDonHang, MaSanPham)
)

create table  TinhTrangDonHang
(
	MaDonHang varchar(15),
	TinhTrang nvarchar(20),
	ThoiGianCapNhap datetime,
	CHECK (TinhTrang IN(N'Chờ giao', N'Đã mua', N'Đã huỷ')),
	primary key(MaDonHang, TinhTrang)
)

create table HoaDon
(
	MaHoaDon varchar(15) primary key,
	ThoiGianLap datetime,
	TenThuNgan nvarchar(30),
	TenKhachHang nvarchar(30),
	TienGiamGia int,
	TienThanhToan int,
	MaQR varchar(30),
	MoTaHoaDon nvarchar(80),
	DiaChiSieuThi nvarchar(80),
)

create table  ChiTietHoaDon
(
	MaHoaDon varchar(15),
	MaSanPham varchar(15),
	SoLuong int,
	DonGia int,
	primary key(MaHoaDon, MaSanPham)
)	

create table KhuyenMai
(
	MaKhuyenMai varchar(15) primary key,
	NoiDung nvarchar(80),
	NgayBatDau date,
	NgayKetThuc date,
	SanPham varchar(15),
	Check(NgayKetThuc >= NgayBatDau)
)

create table NhanVien
(
	MaNhanVien varchar(15) primary key,
	TenNhanVien nvarchar(30),
	GioiTinh nvarchar(20),
	SoCMND varchar(20) unique,
	DiaChiNhanVien nvarchar(80),
	SieuThi varchar(15),
	NhanSuQuanLy varchar(15),
	Luong int,
	CHECK (GioiTinh IN('Nam', N'Nữ')),
	CHECK (LUONG>0)
)

create table NgayDiemDanh
(
	MaNhanVien varchar(15),
	NgayDiemDanh Date,
	Primary key(MaNhanVien, NgayDiemDanh)
)

create table QuanLy
(
	MaQuanLy varchar(15) primary key,
	TenQuanLy nvarchar(30),
	GioiTinh nvarchar(20),
	SoCMND varchar(20) unique,
	DiaChiQuanLy nvarchar(80),
	CHECK (GioiTinh IN('Nam', N'Nữ'))
)

create table NhanSu
(
	MaNhanSu varchar(15) primary key,
	TenNhanSu nvarchar(30),
	GioiTinh nvarchar(20),
	SoCMND varchar(20) unique,
	DiaChiNhanSu nvarchar(80),
	SieuThi varchar(15),
	CHECK (GioiTinh IN('Nam', N'Nữ'))
)

create table NhanVienQuanLyKho
(
	MaNVQLK varchar(15) primary key,
	Ten nvarchar(30),
	GioiTinh nvarchar(20),
	SoCMND varchar(20) unique,
	DiaChi nvarchar(80),
	CHECK (GioiTinh IN('Nam', N'Nữ'))
)

create table Kho
(
	MaKho varchar(15) primary key,
	DiaChiKho nvarchar(80),
	NguoiQuanLy varchar(15)
)

create table ChiTietKho
(
	MaKho varchar(15),
	MaSanPham varchar(15),
	SoLuong int,
	primary key(MaKho,MaSanPham)
)

create table NhaCungCap
(
	MaNhaCungCap varchar(15) primary key,
	DiaChi nvarchar(80),
	SoDienThoai varchar(20)
)

create table ChiTietCungCap
(
	MaNhaCungCap varchar(15),
	MaSanPham  varchar(15),
	SoLuong int,
	primary key(MaNhaCungCap,MaSanPham)
)

create table PhieuNhapHang
(
	MaPhieuNhapHang varchar(15) primary key,
	Kho varchar(15),
	NgayNhapHang date,
	NhaCungCap varchar(15),
	TongGia int,
	NVNhap varchar(15)
)

create table PhieuXuatHang
(
	MaPhieuXuatHang varchar(15) primary key,
	NgayXuatHang date,
	SieuThi varchar(15),
	Kho varchar(15),
	NVXuat varchar(15)
)

create table ChiTietXuatHang
(
	MaPhieuXuatHang varchar(15),
	MaSanPham varchar(15),
	SoLuong int,
	primary key(MaPhieuXuatHang,MaSanPham)
)

create table ChiTietNhapHang
(
	MaPhieuNhapHang varchar(15),
	MaSanPham varchar(15),
	SoLuong int,
	DonGia int,
	primary key(MaPhieuNhapHang,MaSanPham)
)

create table ChiTietGioHang
(
	MaKhachHang varchar(15),
	MaSanPham varchar(15),
	SoLuong int,
	DonGia int,
	primary key(MaKhachHang,MaSanPham)
)

--------------------------------------------------foreign key------------------------------------------------------
alter table Be
add constraint FK_BE_KH
foreign key (KhachHang)
references KhachHang(MaKhachHang)

alter table DiaChiGiaoHang
add constraint FK_DCGH_KH
foreign key (KhachHang)
references KhachHang(MaKhachHang)

alter table SanPhamYeuThich
add constraint FK_SPYT_KH
foreign key (MaKhachHang)
references KhachHang(MaKhachHang)

alter table SanPhamYeuThich
add constraint FK_SPYT_SP
foreign key (MaSanPham)
references SanPham(MaSanPham)

alter table SanPhamDaXem
add constraint FK_SPDX_KH
foreign key (MaKhachHang)
references KhachHang(MaKhachHang)

alter table SanPhamDaXem
add constraint FK_SPDX_SP
foreign key (MaSanPham)
references SanPham(MaSanPham)

alter table SanPham
add constraint FK_SP_LSP
foreign key (LoaiSanPham)
references LoaiSanPham(MaLoai)

alter table SanPham
add constraint FK_SP_TH
foreign key (ThuongHieu)
references ThuongHieu(MaThuongHieu)

alter table TheVip
add constraint FK_V_KH
foreign key (MaTaiKhoan)
references KhachHang(MaKhachHang)

alter table SanPhamMuaCung
add constraint FK_SPMC_SP
foreign key (MaSanPham)
references SanPham(MaSanPham)

alter table SanPhamMuaCung
add constraint FK_SPMC_SPMC
foreign key (SanPhamMuaCung)
references SanPham(MaSanPham)

alter table NhanXet
add constraint FK_NX_KH
foreign key (NguoiNhanXet)
references KhachHang(MaKhachHang)

alter table NhanXet
add constraint FK_NX_SP
foreign key (SanPham)
references SanPham(MaSanPham)

alter table PhieuGiamGia
add constraint FK_PGG_KH
foreign key (KhachHang)
references KhachHang(MaKhachHang)

alter table PhieuGiamGia
add constraint FK_PGG_DH
foreign key (DonHang)
references DonHang(MaDonHang)

alter table ThongBao
add constraint FK_TB_KH
foreign key (KhachHang)
references KhachHang(MaKhachHang)

alter table SieuThi
add constraint FK_ST_QL
foreign key (QuanLy)
references QuanLy(MaQuanLy)

alter table DonHang
add constraint FK_DH_DCGH
foreign key (DiaChiGiaoHang)
references DiaChiGiaoHang(MaDiaChi)

alter table DonHang
add constraint FK_DH_KH
foreign key (MaKhachHang)
references KhachHang(MaKhachHang)

alter table KhuyenMai
add constraint FK_KM_SP
foreign key (SanPham)
references SanPham(MaSanPham)

alter table ChiTietHoaDon
add constraint FK_CTHD_SP
foreign key (MaSanPham)
references SanPham(MaSanPham)

alter table ChiTietHoaDon
add constraint FK_CTHD_HD
foreign key (MaHoaDon)
references HoaDon(MaHoaDon)

alter table ChiTietDonHang
add constraint FK_CTDH_SP
foreign key (MaSanPham)
references SanPham(MaSanPham)

alter table ChiTietDonHang
add constraint FK_CTDH_DH
foreign key (MaDonHang)
references DonHang(MaDonHang)

alter table TinhTrangDonHang
add constraint FK_TTDH_DH
foreign key (MaDonHang)
references DonHang(MaDonHang)

alter table ChiTietSieuThi
add constraint FK_CTST_ST
foreign key (MaSieuThi)
references SieuThi(MaSieuThi)

alter table ChiTietSieuThi
add constraint FK_CTST_SP
foreign key (MaSanPham)
references SanPham(MaSanPham)
alter table NhanVien
add constraint FK_NV_ST
foreign key (SieuThi)
references SieuThi(MaSieuThi)

alter table NhanVien
add constraint FK_NV_NS
foreign key (NhanSuQuanLy)
references NhanSu(MaNhanSu)

alter table NgayDiemDanh
add constraint FK_NDD_NV
foreign key (MaNhanVien)
references NhanVien(MaNhanVien)

alter table NhanSu
add constraint FK_NS_ST
foreign key (SieuThi)
references SieuThi(MaSieuThi)

alter table ChiTietKho
add constraint FK_CTK_K
foreign key (MaKho)
references Kho(MaKho)

alter table ChiTietKho
add constraint FK_CTK_SP
foreign key (MaSanPham)
references SanPham(MaSanPham)

alter table ChiTietCungCap
add constraint FK_CTCC_NCC
foreign key (MaNhaCungCap)
references NhaCungCap(MaNhaCungCap)

alter table ChiTietCungCap
add constraint FK_CTCC_SP
foreign key (MaSanPham)
references SanPham(MaSanPham)

alter table ChiTietXuatHang
add constraint FK_CTXH_PXH
foreign key (MaPhieuXuatHang)
references PhieuXuatHang(MaPhieuXuatHang)

alter table ChiTietXuatHang
add constraint FK_CTXH_SP
foreign key (MaSanPham)
references SanPham(MaSanPham)

alter table ChiTietNhapHang
add constraint FK_CTNH_PNH
foreign key (MaPhieuNhapHang)
references PhieuNhapHang(MaPhieuNhapHang)

alter table ChiTietNhapHang
add constraint FK_CTNH_SP
foreign key (MaSanPham)
references SanPham(MaSanPham)

alter table ChiTietGioHang
add constraint FK_CTGH_KH
foreign key (MaKhachHang)
references KhachHang(MaKhachHang)

alter table ChiTietGioHang
add constraint FK_CTGH_SP
foreign key (MaSanPham)
references SanPham(MaSanPham)

alter table Kho
add constraint FK_K_NVQLK
foreign key (NguoiQuanLy)
references NhanVienQuanLyKho(MaNVQLK)


alter table PhieuNhapHang
add constraint FK_PNH_NVQLK
foreign key (NVNhap)
references NhanVienQuanLyKho(MaNVQLK)

alter table PhieuXuatHang
add constraint FK_PXH_NVQLK
foreign key (NVXuat)
references NhanVienQuanLyKho(MaNVQLK)

alter table DonHang
add constraint FK_DH_ST
foreign key (SieuThi)
references SieuThi(MaSieuThi)
