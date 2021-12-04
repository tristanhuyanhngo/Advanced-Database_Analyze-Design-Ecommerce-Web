use ADB1_6_DATH2
go
create role KhachHang
create role QuanLy
create role QuanTri
create role NhanSu
create role NhanVien
create role NhanVienQuanLyKho
go

-------------------------------Cấp quyền cho khách hàng-------------------------------
GRANT SELECT ON [dbo].[KhachHang] ([HoTenKhachHang],[Phuong_Xa],[Tinh_ThanhPho],[TenDuong],
[NgaySinhKhachHang],[Quan_Huyen],[GioiTinhKhachHang],[SoNha]) TO [KhachHang] AS [dbo]

GRANT SELECT ON [dbo].[SanPham] ([DonGia],[MoTaSanPham],[ThuongHieu],[LoaiSanPham],[TenSanPham]) TO [KhachHang]

GRANT SELECT ON [dbo].[DonHang] ([DonViVanChuyen],[TongSanPham],[TongTien],[DiemTichLuy],[DiaChiGiaoHang],
[HinhThucThanhToan],[ThoiGianNhanHangDuKien],[SoDienThoaiKhachHang],[ThoiGianDatHang],[VAT]) TO [KhachHang] AS [dbo]

GRANT SELECT,UPDATE,INSERT ON [dbo].[Be] ([NgaySinh],[GioiTinh],[TenBe]) TO [KhachHang] AS [dbo]

GRANT SELECT ON [dbo].[PhieuGiamGia] TO [KhachHang]
-------------------------------Cấp quyền cho quản trị-------------------------------
ALTER AUTHORIZATION ON SCHEMA::[db_owner] TO [QuanTri]

-------------------------------Cấp quyền cho quản lý-------------------------------
GRANT SELECT ON [dbo].[NhanSu] TO [QuanLy]
GRANT SELECT ON [dbo].[DonHang] TO [QuanLy]
GRANT SELECT ON [dbo].[NhanVien] TO [QuanLy]
GRANT DELETE,INSERT,SELECT ON [dbo].[PhieuGiamGia] TO [QuanLy]
GRANT DELETE,INSERT,SELECT ON [dbo].[KhuyenMai] TO [QuanLy]
GRANT SELECT ON [dbo].[ChiTietSieuThi] TO [QuanLy]

-------------------------------Cấp quyền cho nhân sự-------------------------------
GRANT DELETE,INSERT,SELECT,UPDATE ON [dbo].[NgayDiemDanh] TO [NhanSu]
GRANT SELECT ON [dbo].[ChiTietDonHang] TO [NhanSu]
GRANT DELETE,SELECT,UPDATE ON [dbo].[DonHang] TO [NhanSu]
GRANT DELETE,SELECT,UPDATE ON [dbo].[NhanVien] TO [NhanSu]

-------------------------------Cấp quyền cho nhân viên-------------------------------
GRANT SELECT ON [dbo].[ChiTietDonHang] TO [NhanVien]
GRANT DELETE,SELECT,UPDATE ON [dbo].[DonHang] TO [NhanVien]

-------------------------------Cấp quyền cho nhân viên quản lý kho-------------------------------
GRANT DELETE,INSERT,SELECT,UPDATE ON [dbo].[PhieuXuatHang] TO [NhanVienQuanLyKho]
GRANT SELECT ON [dbo].[ChiTietKho] TO [NhanVienQuanLyKho]
GRANT DELETE,INSERT,SELECT,UPDATE ON [dbo].[ChiTietXuatHang] TO [NhanVienQuanLyKho]
GRANT DELETE,INSERT,SELECT,UPDATE ON [dbo].[ChiTietNhapHang] TO [NhanVienQuanLyKho]
GRANT DELETE,INSERT,SELECT,UPDATE ON [dbo].[PhieuNhapHang] TO [NhanVienQuanLyKho]