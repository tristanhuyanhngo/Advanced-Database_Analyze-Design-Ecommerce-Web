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

create function fn_dongia (@madh int, @masp int)
returns int
begin
	return (select sanpham.dongia*soluong
	from sanpham, ChiTietDonHang 
	where sanpham.masanpham = ChiTietDonHang.masanpham and ChiTietDonHang.masanpham = @masp and ChiTietDonHang.madonhang = @madh) 
END

go

create function fn_tongtien (@madh int)
returns int
begin
	return (select SUM(chitietdonhang.dongia)
	from chitietdonhang
	where chitietdonhang.madonhang = @madh)
END
go

create function fn_tongsoluong (@madh int)
returns int
begin
	return (select SUM(chitietdonhang.soluong)
	from chitietdonhang 
	where chitietdonhang.madonhang = @madh) 
END

go

CREATE TRIGGER tg_ChiTietDonHang
ON dbo.ChiTietDonHang FOR INSERT,Update
as
BEGIN
	UPDATE dbo.ChiTietDonHang 
	set ChiTietDonHang.dongia = dbo.fn_dongia( ChiTietDonHang.madonhang, ChiTietDonHang.masanpham)
	from ChiTietDonHang, inserted 
	where inserted.madonhang = ChiTietDonHang.madonhang 
	and inserted.masanpham = ChiTietDonHang.masanpham

	UPDATE dbo.donhang 
	set donhang.tongtien = dbo.fn_tongtien(donhang.madonhang) *(100+VAT)/100 , donhang.TongSanPham = dbo.fn_tongsoluong (donhang.madonhang), donhang.DiemTichLuy = dbo.fn_tongtien(donhang.madonhang)/1000
	from donhang, inserted 
	where inserted.madonhang = donhang.madonhang 

END

go

create function fn_dongia2 (@mapnh int, @masp int)
returns int
begin
	return (select sanpham.dongia*soluong
	from sanpham, chitietnhaphang 
	where sanpham.masanpham = chitietnhaphang.masanpham and chitietnhaphang.masanpham = @masp and chitietnhaphang.MaPhieuNhapHang = @mapnh) 
END

go
create function fn_tonggia (@mapnh int)
returns int
begin
	return (select SUM(chitietnhaphang.dongia)
	from chitietnhaphang 
	where chitietnhaphang.MaPhieuNhapHang = @mapnh) 
END

go
CREATE TRIGGER tg_nhaphang
ON dbo.chitietnhaphang FOR INSERT,Update
as
BEGIN
	UPDATE dbo.chitietnhaphang 
	set chitietnhaphang.DonGia = dbo.fn_dongia2(chitietnhaphang.MaPhieuNhapHang,chitietnhaphang.masanpham)
	from chitietnhaphang, inserted 
	where inserted.MaPhieuNhapHang = chitietnhaphang.MaPhieuNhapHang 
	and inserted.masanpham = chitietnhaphang.masanpham

	UPDATE dbo.PhieuNhapHang 
	set PhieuNhapHang.TongGia = dbo.fn_tonggia(PhieuNhapHang.MaPhieuNhapHang) 
	from PhieuNhapHang, inserted 
	where inserted.MaPhieuNhapHang = PhieuNhapHang.MaPhieuNhapHang 
END

go

create function fn_dongia3 (@makh int, @masp int)
returns int
begin
	return (select sanpham.dongia*soluong
	from sanpham, ChiTietGioHang 
	where sanpham.masanpham = ChiTietGioHang.masanpham and ChiTietGioHang.masanpham = @masp and ChiTietGioHang.makhachhang = @makh) 
END

go

CREATE TRIGGER tg_giohang
ON dbo.ChiTietGioHang FOR INSERT, update
as
BEGIN
	UPDATE dbo.ChiTietGioHang 
	set ChiTietGioHang.DonGia = dbo.fn_dongia3(ChiTietGioHang.MaKhachHang,ChiTietGioHang.masanpham) 
	from ChiTietGioHang, inserted 
	where inserted.MaKhachHang = ChiTietGioHang.MaKhachHang 
	and inserted.masanpham = ChiTietGioHang.masanpham
END


