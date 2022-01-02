use ADB1_6_DATH2
go

----------------------------------------------index------------------------------------------------------
create NONCLUSTERED index index_MaKhachHang
on ChiTietGioHang(MaKhachHang)
INCLUDE (MaSanPham,SoLuong,DonGia)

create NONCLUSTERED index index_MaPhieuNhapHang
on ChiTietNhapHang(MaPhieuNhapHang)
INCLUDE (MaSanPham,SoLuong,DonGia)

create NONCLUSTERED index index_MaPhieuXuatHang
on ChiTietXuatHang(MaPhieuXuatHang)
INCLUDE (MaSanPham,SoLuong)

create NONCLUSTERED index index_Kho
on PhieuNhapHang(Kho)
INCLUDE (NgayNhapHang,NhaCungCap,TongGia)

create NONCLUSTERED index index_MaNhaCungCap
on ChiTietCungCap(MaNhaCungCap)
INCLUDE (MaSanPham,SoLuong)

create NONCLUSTERED index index_MaKho
on ChiTietKho(MaKho)
INCLUDE (MaSanPham,SoLuong)

create NONCLUSTERED index index_MaNhanVien
on NgayDiemDanh(MaNhanVien)
INCLUDE (NgayDiemDanh)

create NONCLUSTERED index index_NhanSuQuanLy
on NhanVien(NhanSuQuanLy)
INCLUDE (TenNhanVien,GioiTinh,SoCMND,DiaChiNhanVien,Luong,username,pass)

create NONCLUSTERED index index_MaHoaDon
on ChiTietHoaDon(MaHoaDon)
INCLUDE (SoLuong,MaSanPham,DonGia)

create NONCLUSTERED index index_MaDonHang
on TinhTrangDonHang(MaDonHang)
INCLUDE (TinhTrang,ThoiGianCapNhap)

create NONCLUSTERED index index_MaDonHang
on ChiTietDonHang(MaDonHang)
INCLUDE (SoLuong,MaSanPham,DonGia)

create NONCLUSTERED index index_MaSieuThi
on ChiTietSieuThi(MaSieuThi)
INCLUDE (SoLuong,MaSanPham)

create NONCLUSTERED index index_KhachHang
on TheVip(KhachHang)
INCLUDE (LoaiThe,ThoiHan)

create NONCLUSTERED index index_KhachHang
on ThongBao(KhachHang)
INCLUDE (TenThongBao,NoiDung,ThoiGianThongBao)

create NONCLUSTERED index index_KhachHang
on PhieuGiamGia(KhachHang)
INCLUDE (ThoiGianHieuLuc,ThoiGianHetHan,PhanTramGiamGia, SoTienGiam,NoiDung,TenPhieu,TinhTrang,DonHang)

create NONCLUSTERED index index_SanPham
on NhanXet(SanPham)
INCLUDE (ThoiGianNhanXet,NoiDung,NguoiNhanXet)

create NONCLUSTERED index index_LoaiSanPham
on sanpham(loaisanpham)
INCLUDE ([TenSanPham],[DonGia],[MoTaSanPham],[ThuongHieu])

create NONCLUSTERED index index_KhachHang
on Be(KhachHang)
INCLUDE (TenBe,NgaySinh,GioiTinh)

create NONCLUSTERED index index_MaKhachHang
on SanPhamYeuThich(MaKhachHang)
INCLUDE (MaSanPham)

create NONCLUSTERED index index_MaKhachHang
on SanPhamDaXem(MaKhachHang)
INCLUDE (MaSanPham)

create NONCLUSTERED index index_MaSanPham
on SanPhamMuaCung(MaSanPham)
INCLUDE (SanPhamMuaCung)

create NONCLUSTERED index index_ThuongHieu
on sanpham(ThuongHieu)
INCLUDE ([TenSanPham],[DonGia],[MoTaSanPham],[LoaiSanPham])

create NONCLUSTERED index index_KhachHang
on diachigiaohang(Khachhang)
INCLUDE (SoNha,TenDuong,Tinh_ThanhPho,Quan_Huyen,Phuong_Xa,SoDienThoai)

create NONCLUSTERED index index_DiaChiGiaoHang
on donhang(DiaChiGiaoHang)
INCLUDE (VAT,TongSanPham,TongTien,ThoiGianDatHang,ThoiGianNhanHangDuKien,DonViVanChuyen,HinhThucThanhToan,DiemTichLuy,SieuThi)

create NONCLUSTERED index index_TinhTrang
on TinhTrangDonHang(TinhTrang)
INCLUDE ([ThoiGianCapNhap])

