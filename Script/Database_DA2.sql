create database ADB1_6_DATH2
go 
use ADB1_6_DATH2
go

create table KhachHang
(
	MaKhachHang int primary key identity,
	HoTenKhachHang nvarchar(50),
	GioiTinhKhachHang nvarchar(10),
	NgaySinhKhachHang date,
	SoNha varchar(10),
	TenDuong nvarchar(20),
	Tinh_ThanhPho nvarchar(20),
	Quan_Huyen nvarchar(20),
	Phuong_Xa nvarchar(20),
	SDT varchar(20) unique,
	pass varchar(20),
	CHECK (GioiTinhKhachHang IN(N'Nam', N'Nữ'))
)

create table Be
(
	MaBe int primary key identity,
	TenBe nvarchar(30),
	NgaySinh date,
	GioiTinh nvarchar(20),
	KhachHang int not null,
	CHECK (GioiTinh IN('Nam', N'Nữ'))
)	

create table DiaChiGiaoHang
(
	MaDiaChi int  primary key identity,
	SoNha varchar(10),
	TenDuong nvarchar(20),
	Tinh_ThanhPho nvarchar(20),
	Quan_Huyen nvarchar(20),
	Phuong_Xa nvarchar(20),
	SoDienThoai varchar(20),
	KhachHang int not null
)

create table SanPhamYeuThich
(
	MaKhachHang int,
	MaSanPham int,
	primary key(MaKhachHang, MaSanPham)
)

create table SanPhamDaXem
(
	MaKhachHang int,
	MaSanPham int,
	primary key(MaKhachHang, MaSanPham)
)

create table SanPham
(
	MaSanPham int PRIMARY KEY identity,
	TenSanPham nvarchar(30),
	DonGia int, 
	MoTaSanPham nvarchar(80),
	LoaiSanPham int not null,
	ThuongHieu int,
	CHECK(DonGia>0)
)

create table SanPhamMuaCung
(
	MaSanPham int,
	SanPhamMuaCung int,
	primary key(MaSanPham, SanPhamMuaCung)
)

create table NhanXet
(
	MaNhanXet int PRIMARY KEY identity,
	ThoiGianNhanXet datetime,
	NoiDung nvarchar(80),
	NguoiNhanXet int not null,
	SanPham int not null
)

create table PhieuGiamGia
(
	MaPhieu int primary key identity,
	ThoiGianHieuLuc date,
	ThoiGianHetHan date,
	PhanTramGiamGia int,
	SoTienGiam int CHECK(SoTienGiam>=0),
	NoiDung nvarchar(80),
	TenPhieu nvarchar(30),
	KhachHang int not null,
	TinhTrang nvarchar(20),
	DonHang int,
	CHECK(PhanTramGiamGia >= 0 and PhanTramGiamGia <= 100),
	CHECK (TinhTrang in (N'Chưa xài', N'Đã xài')),
	CHECK(ThoiGianHieuLuc < ThoiGianHetHan)
)

create table ThongBao
(
	MaThongBao int primary key identity,
	TenThongBao nvarchar(30),
	NoiDung nvarchar(80),
	ThoiGianThongBao date,
	KhachHang int 
)

create table LoaiSanPham
(
	MaLoai int primary key identity,
	TenLoai nvarchar(30),
	Mota nvarchar(80)
)

create table ThuongHieu
(
	MaThuongHieu int primary key identity,
	TenThuongHieu nvarchar(30),
	MoTaThuongHieu nvarchar(80)
)

create table TheVip
(
	MaTaiKhoan int primary key identity,
	LoaiThe nvarchar(30),
	ThoiHan date,
	Check (LoaiThe in ('Diamond','Gold'))
)

create table SieuThi
(
	MaSieuThi int primary key identity,
	TenSieuThi nvarchar(30),
	TruongSieuThi nvarchar(30),
	SoDienThoaiLienLac varchar(20),
	GioMoCua time,
	GioDongCua time,
	TenDuong nvarchar(20),
	Tinh_ThanhPho nvarchar(20),
	Quan_Huyen nvarchar(20),
	Phuong_Xa nvarchar(20),
	QuanLy int not null
)

create table ChiTietSieuThi
(
	MaSieuThi int,
	MaSanPham int,
	SoLuong int,
	primary key(MaSieuThi,MaSanPham)
)

create table DonHang
(
	MaDonHang int primary key identity,
	VAT int, 
	TongSanPham int, 
	TongTien int,
	ThoiGianDatHang datetime,
	ThoiGianNhanHangDuKien datetime,
	DonViVanChuyen nvarchar(30),
	HinhThucThanhToan nvarchar(30),
	DiemTichLuy int,
	DiaChiGiaoHang int not null,
	SieuThi int,
	CHECK (DonViVanChuyen IN('AhaMove', 'GrabExpress','Viettel')),
	CHECK (VAT >=0 ),
	CHECK (HinhThucThanhToan IN('COD', 'ATM','VISA','VNPAY','ZALOPAY', 'MOMO')),
	CHECK (ThoiGianNhanHangDuKien > ThoiGianDatHang)
)

create table  ChiTietDonHang
(
	MaDonHang int,
	MaSanPham int,
	SoLuong int,
	DonGia int,
	primary key(MaDonHang, MaSanPham)
)

create table  TinhTrangDonHang
(
	MaDonHang int,
	TinhTrang nvarchar(20),
	ThoiGianCapNhap datetime,
	CHECK (TinhTrang IN(N'Chờ giao', N'Đã mua', N'Đã huỷ')),
	primary key(MaDonHang, TinhTrang)
)

create table HoaDon
(
	MaHoaDon int primary key identity,
	ThoiGianLap datetime,
	TenThuNgan nvarchar(30),
	TenKhachHang nvarchar(30),
	TienGiamGia int,
	TienThanhToan int,
	MaQR varchar(30),
	MoTaHoaDon nvarchar(80),
	SieuThi int,
)

create table  ChiTietHoaDon
(
	MaHoaDon int ,
	MaSanPham int ,
	SoLuong int,
	DonGia int,
	primary key(MaHoaDon, MaSanPham)
)	

create table KhuyenMai
(
	MaKhuyenMai int primary key identity,
	NoiDung nvarchar(80),
	NgayBatDau date,
	NgayKetThuc date,
	SanPham int ,
	Check(NgayKetThuc >= NgayBatDau)
)

create table NhanVien
(
	MaNhanVien int primary key identity,
	TenNhanVien nvarchar(30),
	GioiTinh nvarchar(20),
	SoCMND varchar(20) unique,
	DiaChiNhanVien nvarchar(80),
	NhanSuQuanLy int ,
	Luong int,
	username varchar(20) unique,
	pass varchar(20),
	CHECK (GioiTinh IN('Nam', N'Nữ')),
	CHECK (LUONG>0)
)

create table NgayDiemDanh
(
	MaNhanVien int ,
	NgayDiemDanh Date,
	Primary key(MaNhanVien, NgayDiemDanh)
)

create table QuanLy
(
	MaQuanLy int primary key identity,
	TenQuanLy nvarchar(30),
	GioiTinh nvarchar(20),
	SoCMND varchar(20) unique,
	DiaChiQuanLy nvarchar(80),
	username varchar(20) unique,
	pass varchar(20),
	CHECK (GioiTinh IN('Nam', N'Nữ'))
)

create table NhanSu
(
	MaNhanSu int primary key identity,
	TenNhanSu nvarchar(30),
	GioiTinh nvarchar(20),
	SoCMND varchar(20) unique,
	DiaChiNhanSu nvarchar(80),
	SieuThi int ,
	username varchar(20) unique,
	pass varchar(20),
	CHECK (GioiTinh IN('Nam', N'Nữ'))
)

create table NhanVienQuanLyKho
(
	MaNVQLK int primary key identity,
	Ten nvarchar(30),
	GioiTinh nvarchar(20),
	SoCMND varchar(20) unique,
	DiaChi nvarchar(80),
	username varchar(20) unique,
	pass varchar(20),
	CHECK (GioiTinh IN('Nam', N'Nữ'))
)

create table Kho
(
	MaKho int primary key identity,
	DiaChiKho nvarchar(80),
	NguoiQuanLy int 
)

create table ChiTietKho
(
	MaKho int,
	MaSanPham int,
	SoLuong int,
	primary key(MaKho,MaSanPham)
)

create table NhaCungCap
(
	MaNhaCungCap int primary key identity,
	TenNhaCungCap nvarchar(30),
	DiaChi nvarchar(80),
	SoDienThoai varchar(20)
)

create table ChiTietCungCap
(
	MaNhaCungCap int ,
	MaSanPham  int ,
	SoLuong int,
	primary key(MaNhaCungCap,MaSanPham)
)

create table PhieuNhapHang
(
	MaPhieuNhapHang int primary key identity,
	Kho int ,
	NgayNhapHang date,
	NhaCungCap int ,
	TongGia int
)

create table PhieuXuatHang
(
	MaPhieuXuatHang int primary key identity,
	NgayXuatHang date,
	SieuThi int ,
	Kho int 
)

create table ChiTietXuatHang
(
	MaPhieuXuatHang int ,
	MaSanPham int ,
	SoLuong int,
	primary key(MaPhieuXuatHang,MaSanPham)
)

create table ChiTietNhapHang
(
	MaPhieuNhapHang int ,
	MaSanPham int ,
	SoLuong int,
	DonGia int,
	primary key(MaPhieuNhapHang,MaSanPham)
)

create table ChiTietGioHang
(
	MaKhachHang int ,
	MaSanPham int ,
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

alter table DonHang
add constraint FK_DH_ST
foreign key (SieuThi)
references SieuThi(MaSieuThi)

alter table PhieuNhapHang
add constraint FK_PNH_K
foreign key (Kho)
references Kho(MaKho)

alter table PhieuNhapHang
add constraint FK_PNH_NCC
foreign key (NhaCungCap)
references NhaCungCap(MaNhaCungCap)

alter table PhieuXuatHang
add constraint FK_PXH_K
foreign key (Kho)
references Kho(MaKho)

alter table PhieuXuatHang
add constraint FK_PXH_ST
foreign key (SieuThi)
references SieuThi(MaSieuThi)

alter table HoaDon
add constraint FK_HD_ST
foreign key (SieuThi)
references SieuThi(MaSieuThi)