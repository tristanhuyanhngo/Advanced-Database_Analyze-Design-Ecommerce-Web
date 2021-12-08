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

GRANT DELETE,INSERT,SELECT,UPDATE ON [dbo].[Be] TO [KhachHang]

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
GRANT SELECT ON [dbo].[ChiTietKho] TO [NhanVienQuanLyKho]
GRANT DELETE,INSERT,SELECT,UPDATE ON [dbo].[ChiTietXuatHang] TO [NhanVienQuanLyKho]
GRANT DELETE,INSERT,SELECT,UPDATE ON [dbo].[ChiTietNhapHang] TO [NhanVienQuanLyKho]
GRANT DELETE,INSERT,SELECT,UPDATE ON [dbo].[PhieuNhapHang] TO [NhanVienQuanLyKho]
GRANT DELETE,INSERT,SELECT,UPDATE ON [dbo].[PhieuXuatHang] TO [NhanVienQuanLyKho]
go

----------------------------------------Tạo login-------------------------------------------------
exec sp_addlogin 'khachhang', 'hehe', 'ADB1_6_DATH2'
exec sp_addlogin 'quanly', 'hehe', 'ADB1_6_DATH2'
exec sp_addlogin 'quantri', 'hehe', 'ADB1_6_DATH2'
exec sp_addlogin 'nhansu', 'hehe', 'ADB1_6_DATH2'
exec sp_addlogin 'nhavien', 'hehe', 'ADB1_6_DATH2'
exec sp_addlogin 'nhanvienquanlykho', 'hehe', 'ADB1_6_DATH2'
go

----------------------------------------Map tới user trong db---------------------------------------
CREATE USER khachhang1 FOR LOGIN khachhang WITH DEFAULT_SCHEMA=db_securityadmin
CREATE USER quanly1 FOR LOGIN quanly 
CREATE USER quantri1 FOR LOGIN quantri 
CREATE USER nhansu1 FOR LOGIN nhansu 
CREATE USER nhanvien1 FOR LOGIN nhavien
CREATE USER nhanvienquanlykho1 FOR LOGIN nhanvienquanlykho 

---------------------------------------add member vao role -----------------------------------------
go
ALTER ROLE quantri ADD MEMBER quantri1
ALTER ROLE quanly ADD MEMBER quanly1
ALTER ROLE nhansu ADD MEMBER nhansu1
ALTER ROLE nhanvien ADD MEMBER nhanvien1
ALTER ROLE nhanvienquanlykho ADD MEMBER nhanvienquanlykho1
ALTER ROLE khachhang ADD MEMBER khachhang1