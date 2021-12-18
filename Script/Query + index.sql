use ADB1_6_DATH2
go

------------------------------------------------Query----------------------------------------------------------
-- Khách hàng tìm kiếm các sản phẩm thuộc loại bỉm tả 
select * from sanpham, loaisanpham 
where sanpham.loaisanpham = loaisanpham.maloai 
and loaisanpham.tenloai = N'Bỉm tả' 

-- Khách hàng tìm kiếm các sản phẩm thuộc thương hiệu Ensure
select * from sanpham, thuonghieu 
where sanpham.thuonghieu = thuonghieu.mathuonghieu 
and thuonghieu.tenthuonghieu = 'Ensure'

-- Khách hàng tìm kiếm các sản phẩm thuộc loại bỉm tả và có giá <500
select * from sanpham, loaisanpham 
where sanpham.loaisanpham = loaisanpham.maloai 
and loaisanpham.tenloai = N'Bỉm tả' and sanpham.dongia <500

-- Nhân viên tiếp nhận các đơn hàng có tổng tiền > 30000
select * from donhang where donhang.Tongtien > 30000

-- Nhân viên Kiểm tra những đơn hàng đang giao
select * from TinhTrangDonHang T1
where T1.TinhTrang = N'Chờ giao'
and not exists(select * from TinhTrangDonHang T2
				where T2.TinhTrang = N'Đã mua'
				or T2.TinhTrang =  N'Đã huỷ')

--•	Kiểm tra đơn hàng chưa được xử lý
select *
from donhang where Sieuthi is NULL

-- Nhân viên Kiểm tra những đơn hàng của siêu thị 163
select * from Donhang 
where sieuthi = 163 

go

----------------------------------------------index------------------------------------------------------
create NONCLUSTERED index index_LoaiSanPham
on sanpham(loaisanpham)
INCLUDE ([TenSanPham],[DonGia],[MoTaSanPham],[ThuongHieu])

create NONCLUSTERED index index_ThuongHieu
on sanpham(ThuongHieu)
INCLUDE ([TenSanPham],[DonGia],[MoTaSanPham],[LoaiSanPham])

create NONCLUSTERED index index_LoaiSanPham_DonGia
on sanpham(loaisanpham,[DonGia])
INCLUDE ([TenSanPham],[MoTaSanPham],[ThuongHieu])

create NONCLUSTERED index index_TongTien
on donhang(Tongtien)
INCLUDE ([MaDonHang],[SoDienThoaiKhachHang],[VAT],[TongSanPham],[ThoiGianDatHang],[ThoiGianNhanHangDuKien],[DonViVanChuyen],[HinhThucThanhToan],[DiemTichLuy],[DiaChiGiaoHang],[SieuThi])

create NONCLUSTERED index index_TinhTrang
on TinhTrangDonHang(TinhTrang)
INCLUDE ([ThoiGianCapNhap])

create NONCLUSTERED index index_SieuThi
on Donhang(sieuthi)
INCLUDE (SoDienTHoaiKhachHang, VAT, Tongsanpham,TongTien,THoiGianDatHang,ThoiGianNhanHangDuKien,DonViVanChuyen,HinhThucTHanhToan,DiemTichLuy, DiaChiGiaoHang)


--drop index index_LoaiSanPham on sanpham
--drop index index_ThuongHieu on sanpham
--drop index index_LoaiSanPham_DonGia on sanpham
--drop index index_TongTien on donhang
--drop index index_TinhTrang on TinhTrangDonHang
--drop index index_SieuThi on Donhang