use ADB1_6_DATH2
go

create NONCLUSTERED index index_LoaiSanPham
on sanpham(loaisanpham)
INCLUDE ([TenSanPham],[DonGia],[MoTaSanPham],[ThuongHieu])

create NONCLUSTERED index index_LoaiSanPham_DonGia
on sanpham(loaisanpham,[DonGia])
INCLUDE ([TenSanPham],[MoTaSanPham],[ThuongHieu])

create NONCLUSTERED index index_TongTien
on donhang(Tongtien)
INCLUDE ([MaDonHang],[SoDienThoaiKhachHang],[VAT],[TongSanPham],[ThoiGianDatHang],[ThoiGianNhanHangDuKien],[DonViVanChuyen],[HinhThucThanhToan],[DiemTichLuy],[DiaChiGiaoHang],[SieuThi])

create NONCLUSTERED index index_TinhTrang
on TinhTrangDonHang(TinhTrang)
INCLUDE ([ThoiGianCapNhap])

--drop index index_LoaiSanPham on sanpham
--drop index index_LoaiSanPham_DonGia on sanpham
--drop index index_TongTien on donhang
--drop index index_TinhTrang on TinhTrangDonHang