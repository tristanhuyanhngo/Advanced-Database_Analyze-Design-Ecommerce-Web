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
	insert into donhang(SoDienThoaiKhachHang,VAT, TongSanPham, TongTien,ThoiGianDatHang,ThoiGianNhanHangDuKien,DonViVanChuyen,HinhThucThanhToan,DiemTichLuy,DiaChiGiaoHang)
	values (@SDT, 0, 0, 0, getdate(), @ThoiGianNhanHangDuKien, @DonViVanChuyen, @HinhThucThanhToan,@HinhThucThanhToan,0,@DiaChiGiaoHang)
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




--Quản trị:
--•	Thêm, xoá, sửa sản phẩm của cửa hàng
--•	Theo dõi tồn kho
--•	Theo dõi giá sản phẩm
--•	Nhập, xuất hàng
--•	Theo dõi lịch sử nhập, xuất hàng


--Quản lý:
--•	Đăng nhập
--•	Thống kê doanh thu 
--•	Kiểm số lượng hàng còn lại của siêu thị
--•	Kiểm tra các mặt hàng bán chạy, bán chậm
--•	Thiết lập giảm giá
--•	Thiết lập khuyến mãi


--Nhân sự:
--•	Đăng nhập
--•	Điểm danh nhân viên
--•	Kiểm tra đơn hàng
--•	Thiết lập lương/thưởng cho nhân viên


--Nhân viên: 
--•	Đăng nhập
--•	Kiểm tra đơn hàng và xác nhận
--•	Theo dõi và cập nhập đơn hàng


--Nhân viên quản lý kho: 
--•	Đăng nhập
--•	Kiểm tra số lượng tồn kho
--•	Lập phiếu nhập
--•	Lập phiếu xuất
