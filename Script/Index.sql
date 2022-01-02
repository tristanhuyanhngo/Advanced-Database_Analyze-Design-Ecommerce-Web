use ADB1_6_DATH2
go

----------------------------------------------index------------------------------------------------------
create NONCLUSTERED index index_MaKhachHang
on ChiTietGioHang(MaKhachHang)
INCLUDE (MaSanPham,SoLuong,DonGia)

-- drop index index_MaKhachHang on ChiTietGioHang

create NONCLUSTERED index index_MaPhieuNhapHang
on ChiTietNhapHang(MaPhieuNhapHang)
INCLUDE (MaSanPham,SoLuong,DonGia)

-- drop index index_MaPhieuNhapHang on ChiTietNhapHang

create NONCLUSTERED index index_MaPhieuXuatHang
on ChiTietXuatHang(MaPhieuXuatHang)
INCLUDE (MaSanPham,SoLuong)

-- drop index index_MaPhieuXuatHang on ChiTietXuatHang

create NONCLUSTERED index index_Kho
on PhieuNhapHang(Kho)
INCLUDE (NgayNhapHang,NhaCungCap,TongGia)

-- drop index index_Kho on PhieuNhapHang

create NONCLUSTERED index index_MaNhaCungCap
on ChiTietCungCap(MaNhaCungCap)
INCLUDE (MaSanPham,SoLuong)

-- drop index index_MaNhaCungCap on ChiTietCungCap

create NONCLUSTERED index index_MaKho
on ChiTietKho(MaKho)
INCLUDE (MaSanPham,SoLuong)

-- drop index index_MaKho on ChiTietKho

create NONCLUSTERED index index_MaNhanVien
on NgayDiemDanh(MaNhanVien)
INCLUDE (NgayDiemDanh)

-- drop index index_MaNhanVien on NgayDiemDanh

create NONCLUSTERED index index_NhanSuQuanLy
on NhanVien(NhanSuQuanLy)
INCLUDE (TenNhanVien,GioiTinh,SoCMND,DiaChiNhanVien,Luong,username,pass)

-- drop index index_NhanSuQuanLy on NhanVien

create NONCLUSTERED index index_MaHoaDon
on ChiTietHoaDon(MaHoaDon)
INCLUDE (SoLuong,MaSanPham,DonGia)

-- drop index index_MaHoaDon on ChiTietHoaDon

create NONCLUSTERED index index_MaDonHang
on TinhTrangDonHang(MaDonHang)
INCLUDE (TinhTrang,ThoiGianCapNhap)

-- drop index index_MaDonHang on TinhTrangDonHang

create NONCLUSTERED index index_MaDonHang
on ChiTietDonHang(MaDonHang)
INCLUDE (SoLuong,MaSanPham,DonGia)

-- drop index index_MaDonHang on ChiTietDonHang

create NONCLUSTERED index index_MaSieuThi
on ChiTietSieuThi(MaSieuThi)
INCLUDE (SoLuong,MaSanPham)

-- drop index index_MaSieuThi on ChiTietSieuThi

create NONCLUSTERED index index_KhachHang
on TheVip(KhachHang)
INCLUDE (LoaiThe,ThoiHan)

-- drop index index_KhachHang on TheVip

create NONCLUSTERED index index_KhachHang
on ThongBao(KhachHang)
INCLUDE (TenThongBao,NoiDung,ThoiGianThongBao)

-- drop index index_KhachHang on ThongBao

create NONCLUSTERED index index_KhachHang
on PhieuGiamGia(KhachHang)
INCLUDE (ThoiGianHieuLuc,ThoiGianHetHan,PhanTramGiamGia, SoTienGiam,NoiDung,TenPhieu,TinhTrang,DonHang)

-- drop index index_KhachHang on PhieuGiamGia

create NONCLUSTERED index index_SanPham
on NhanXet(SanPham)
INCLUDE (ThoiGianNhanXet,NoiDung,NguoiNhanXet)

-- drop index index_SanPham on NhanXet

create NONCLUSTERED index index_LoaiSanPham
on sanpham(loaisanpham)
INCLUDE ([TenSanPham],[DonGia],[MoTaSanPham],[ThuongHieu])

-- drop index index_LoaiSanPham on sanpham

create NONCLUSTERED index index_KhachHang
on Be(KhachHang)
INCLUDE (TenBe,NgaySinh,GioiTinh)

-- drop index index_KhachHang on Be

create NONCLUSTERED index index_MaKhachHang
on SanPhamYeuThich(MaKhachHang)
INCLUDE (MaSanPham)

-- drop index index_MaKhachHang on SanPhamYeuThich

create NONCLUSTERED index index_MaKhachHang
on SanPhamDaXem(MaKhachHang)
INCLUDE (MaSanPham)

-- drop index index_MaKhachHang on SanPhamDaXem

create NONCLUSTERED index index_MaSanPham
on SanPhamMuaCung(MaSanPham)
INCLUDE (SanPhamMuaCung)

-- drop index index_MaSanPham on SanPhamMuaCung

create NONCLUSTERED index index_ThuongHieu
on sanpham(ThuongHieu)
INCLUDE ([TenSanPham],[DonGia],[MoTaSanPham],[LoaiSanPham])

-- drop index index_ThuongHieu on sanpham

create NONCLUSTERED index index_KhachHang
on diachigiaohang(Khachhang)
INCLUDE (SoNha,TenDuong,Tinh_ThanhPho,Quan_Huyen,Phuong_Xa,SoDienThoai)

-- drop index index_KhachHang on diachigiaohang

create NONCLUSTERED index index_DiaChiGiaoHang
on donhang(DiaChiGiaoHang)
INCLUDE (VAT,TongSanPham,TongTien,ThoiGianDatHang,ThoiGianNhanHangDuKien,DonViVanChuyen,HinhThucThanhToan,DiemTichLuy,SieuThi)

-- drop index index_DiaChiGiaoHang on donhang

create NONCLUSTERED index index_TinhTrang
on TinhTrangDonHang(TinhTrang)
INCLUDE ([ThoiGianCapNhap])

-- drop index index_TinhTrang on TinhTrangDonHang

