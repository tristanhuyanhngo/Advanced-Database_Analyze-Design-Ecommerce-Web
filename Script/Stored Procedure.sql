use ADB1_6_DATH2
go
-----------------------------------------------Khách hàng-----------------------------------------------------
--•	Đăng ký
CREATE PROCEDURE KHDangKy 
@Hoten nvarchar(50), @GioiTinh nvarchar(10),@Ngaysinh date, @SoNha varchar(10), @TenDuong nvarchar(20),
@Tinh_ThanhPho nvarchar(20), @Quan_Huyen nvarchar(20), @Phuong_Xa  nvarchar(20), @SDT varchar(20), @pass varchar(20)
as
	insert into KhachHang(HoTenKhachHang,GioiTinhKhachHang,NgaySinhKhachHang,SoNha,TenDuong,Tinh_ThanhPho,Quan_Huyen,Phuong_Xa,SDT,pass)
	values(@Hoten, @GioiTinh,@Ngaysinh, @SoNha, @TenDuong,@Tinh_ThanhPho, @Quan_Huyen, @Phuong_Xa, @SDT, @pass)
go

--• đăng nhập
CREATE PROCEDURE KHDangNhap
@SDT varchar(20), @pass varchar(20)
as
	select makhachhang
	from khachhang where sdt = @sdt and pass = @pass
go

--• xem thông tin
CREATE PROCEDURE KHXemThongTin
@makhachhang int
as
	select HoTenKhachHang,GioiTinhKhachHang,NgaySinhKhachHang,SoNha,TenDuong,Tinh_ThanhPho,Quan_Huyen,Phuong_Xa
	from khachhang where makhachhang = @makhachhang
go

--• cập nhật thông tin 
CREATE PROCEDURE KHCapNhapThongTin
@Hoten nvarchar(50), @GioiTinh nvarchar(10),@Ngaysinh date, @SoNha varchar(10), @TenDuong nvarchar(20), @makhachhang int,
@Tinh_ThanhPho nvarchar(20), @Quan_Huyen nvarchar(20), @Phuong_Xa  nvarchar(20), @SDT varchar(20), @pass varchar(20)
as
	update khachhang set HoTenKhachHang = @Hoten, GioiTinhKhachHang = @GioiTinh, NgaySinhKhachHang = @Ngaysinh,
	SoNha = @SoNha, TenDuong = @TenDuong, Tinh_ThanhPho = @Tinh_ThanhPho, Quan_Huyen = @Quan_Huyen, Phuong_Xa = @Phuong_Xa
	where  makhachhang = @makhachhang
go

--• cập nhật mật khảu
CREATE PROCEDURE KHCapNhapMatKhau
@makhachhang int, @pass varchar(20)
as
	update khachhang set pass = @pass where  makhachhang = @makhachhang
go

--•	Đặt hàng
CREATE PROCEDURE KHDatDonHang
	@SDT varchar(10),
	@DonViVanChuyen nvarchar(30),
	@HinhThucThanhToan nvarchar(30),
	@DiaChiGiaoHang int,
	@ThoiGianNhanHangDuKien datetime
as
	insert into donhang(VAT, TongSanPham, TongTien,ThoiGianDatHang,ThoiGianNhanHangDuKien,DonViVanChuyen,HinhThucThanhToan,DiemTichLuy,DiaChiGiaoHang)
	values (0, 0, 0, getdate(), @ThoiGianNhanHangDuKien, @DonViVanChuyen, @HinhThucThanhToan,0,@DiaChiGiaoHang)
go

--•	Xem mã giảm giá sỡ hữu
CREATE PROCEDURE KHXemPhieuGiamGia
@Makhachhang int
as
	select ThoiGianHieuLuc,ThoiGianHetHan,PhanTramGiamGia,SoTienGiam,NoiDung,TenPhieu,TinhTrang
	from PhieuGiamGia where khachhang = @Makhachhang
go

--•	Tìm kiếm sản phẩm theo loại sản phẩm
CREATE PROCEDURE KHXemSanPhamTheoLoai
@LoaiSanPham nvarchar(30)
as
	select TenSanPham, DonGia, MoTaSanPham
	from sanpham, loaisanpham where sanpham.loaisanpham = loaisanpham.maloai and loaisanpham.tenloai = @LoaiSanPham
go

--•	Xem tình trạng giao hàng của đơn hàng
CREATE PROCEDURE KHTheoDoiDonHang
@Makhachhang nvarchar(30)
as
	select * from donhang, diachigiaohang where donhang.diachigiaohang = diachigiaohang.madiachi and diachigiaohang.khachhang = @Makhachhang
go

----------------------------------------------------Nhân viên------------------------------------------------
--•	Đăng nhập
CREATE PROCEDURE NVDangNhap
@username varchar(20), @pass varchar(20)
as
	select manhanvien
	from nhanvien where username = @username and pass = @pass
go

--•	Kiểm tra đơn hàng chưa được xử lý
CREATE PROCEDURE NVKiemTraDonHang
as
	select *
	from donhang where Sieuthi is NULL
go

--• Xác nhận đơn hàng
CREATE PROCEDURE NVXacNhanDonHang
@donhang int, @sieuthi int
as
	update donhang set sieuthi = @sieuthi where madonhang = @donhang 
go

--•	Theo dõi đơn hàng
CREATE PROCEDURE NVTheoDoiDonhang
@donhang int
as
	select * from tinhtrangdonhang where madonhang = @donhang
go

--• Cập nhập đơn hàng
CREATE PROCEDURE NVCapNhapDonHang
@donhang int, @Tinhtrang nvarchar(20)
as
	insert into tinhtrangdonhang(MaDonHang,TinhTrang, ThoiGianCapNhap) 
	values(@donhang,@tinhtrang,getdate())
go

----------------------------------------------Nhân viên quản lý kho-------------------------------------------------- 
--•	Đăng nhập
CREATE PROCEDURE NVQLKDangNhap
@username varchar(20), @pass varchar(20)
as
	select MaNVQLK
	from NhanVienQuanLyKho where username = @username and pass = @pass
go

--•	Kiểm tra số lượng tồn kho
CREATE PROCEDURE NVQLKKiemTraSoLuongTonKho
@kho int
as
	select * from chitietkho where makho = @kho
go

--•	Lập phiếu nhập
CREATE PROCEDURE NVQLKLapPhieuNhap
@kho int, @nhacungcap int
as
	insert into phieunhaphang(Kho,NhaCungCap,NgayNhapHang) values(@kho,@nhacungcap,getdate())
go

--•	Lập phiếu xuất
CREATE PROCEDURE NVQLKLapPhieuXuat
@kho int, @Sieuthi int
as
	insert into phieuxuathang(Kho,SieuThi,NgayXuatHang) values(@kho,@Sieuthi,getdate())
go
