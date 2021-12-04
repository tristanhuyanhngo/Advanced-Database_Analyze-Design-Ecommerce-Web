use ADB1_6_DATH2
go

CREATE TRIGGER tg_NgaySinhCuaBe
ON dbo.be FOR INSERT,UPDATE
as
BEGIN
    DECLARE @namsinhcuabe INT
	DECLARE @namsinhcuakhachhang INT

	SELECT @namsinhcuabe = year(dbo.be.NgaySinh) FROM dbo.be,Inserted
	WHERE dbo.be.mabe = inserted.mabe

	SELECT @namsinhcuakhachhang = year(dbo.khachhang.NgaySinhKhachHang) FROM Khachhang,Inserted
	WHERE dbo.Khachhang.Makhachhang = inserted.Khachhang

	IF (@namsinhcuabe < @namsinhcuakhachhang-18)
	BEGIN
		PRINT N'Năm sinh của bé không hợp lý'
		ROLLBACK TRAN
		return
	END
END

go

CREATE TRIGGER tg_ChiTietDonHang
ON dbo.ChiTietDonHang FOR INSERT,UPDATE, delete
as
BEGIN
    declare @Dongia INT
	select @Dongia = (sanpham.dongia * inserted.soluong) 
	from ChiTietDonHang,sanpham,inserted 
	where sanpham.masanpham = inserted.masanpham
	and inserted.madonhang = ChiTietDonHang.madonhang 
	and inserted.masanpham = ChiTietDonHang.masanpham

	begin tran
		UPDATE dbo.ChiTietDonHang 
		set ChiTietDonHang.dongia = @Dongia 
		from ChiTietDonHang, inserted 
		where inserted.madonhang = ChiTietDonHang.madonhang 
		and inserted.masanpham = ChiTietDonHang.masanpham

		declare @TongTien INT
		select @TongTien = SUM(chitietdonhang.dongia)
		from Chitietdonhang, inserted
		where chitietdonhang.madonhang = inserted.madonhang

		declare @TongSoLuong INT
		select @TongSoLuong = SUM(chitietdonhang.soluong)
		from Chitietdonhang, inserted
		where chitietdonhang.madonhang = inserted.madonhang

		UPDATE dbo.donhang 
		set donhang.tongtien = @TongTien 
		from donhang, inserted 
		where inserted.madonhang = donhang.madonhang 

		UPDATE dbo.donhang 
		set donhang.TongSanPham = @TongSoLuong 
		from donhang, inserted 
		where inserted.madonhang = donhang.madonhang 
	commit
END

go 

CREATE TRIGGER tg_nhansu_nhanvien
ON dbo.nhanvien FOR INSERT,UPDATE
as
BEGIN
    if(not exists (select* from nhanvien,inserted,nhansu where nhanvien.manhanvien = inserted.manhanvien
				   and nhansu.manhansu = nhanvien.nhansuquanly and nhansu.sieuthi = nhanvien.sieuthi))
	BEGIN
		PRINT N'Nhân viên không cùng công ty với nhân sự quản lý, lỗi'
		ROLLBACK TRAN
		return
	END
END

go

CREATE TRIGGER tg_nhaphang
ON dbo.chitietnhaphang FOR INSERT,UPDATE,delete
as
BEGIN
    declare @Dongia INT
	select @Dongia = (sanpham.dongia * inserted.soluong) 
	from chitietnhaphang,sanpham,inserted 
	where sanpham.masanpham = inserted.masanpham
	and inserted.MaPhieuNhapHang = chitietnhaphang.MaPhieuNhapHang 
	and inserted.masanpham = chitietnhaphang.masanpham

	begin tran
		UPDATE dbo.chitietnhaphang 
		set chitietnhaphang.DonGia = @Dongia 
		from chitietnhaphang, inserted 
		where inserted.MaPhieuNhapHang = chitietnhaphang.MaPhieuNhapHang 
		and inserted.masanpham = chitietnhaphang.masanpham

		declare @TongGia INT
		select @TongGia = SUM(chitietnhaphang.DonGia)
		from chitietnhaphang, inserted
		where chitietnhaphang.MaPhieuNhapHang = inserted.MaPhieuNhapHang

		UPDATE dbo.PhieuNhapHang 
		set PhieuNhapHang.TongGia = @TongGia 
		from PhieuNhapHang, inserted 
		where inserted.MaPhieuNhapHang = PhieuNhapHang.MaPhieuNhapHang 
	commit
END

go

CREATE TRIGGER tg_giohang
ON dbo.ChiTietGioHang FOR INSERT,UPDATE,delete
as
BEGIN
    declare @Dongia INT
	select @Dongia = (sanpham.dongia * inserted.soluong) 
	from ChiTietGioHang,sanpham,inserted 
	where sanpham.masanpham = inserted.masanpham
	and inserted.MaKhachHang = ChiTietGioHang.MaKhachHang 
	and inserted.masanpham = ChiTietGioHang.masanpham

	UPDATE dbo.ChiTietGioHang 
	set ChiTietGioHang.DonGia = @Dongia 
	from ChiTietGioHang, inserted 
	where inserted.MaKhachHang = ChiTietGioHang.MaKhachHang 
	and inserted.masanpham = ChiTietGioHang.masanpham
END