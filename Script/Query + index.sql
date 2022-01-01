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

-- Khách hàng 1 kiểm tra những đơn hàng đã đặt 
select * from donhang, diachigiaohang
where donhang.DiaChiGiaoHang = diachigiaohang.MaDiaChi and KhachHang = 1

-- Nhân viên Kiểm tra những đơn hàng đang giao
select * from TinhTrangDonHang T1
where T1.TinhTrang = N'Chờ giao'
and not exists(select * from TinhTrangDonHang T2
				where T2.TinhTrang = N'Đã mua'
				or T2.TinhTrang =  N'Đã huỷ')

--• Nhân viên Kiểm tra đơn hàng chưa được xử lý
select *
from donhang where Sieuthi is NULL

go

----------------------------------------------index------------------------------------------------------
create NONCLUSTERED index index_LoaiSanPham
on sanpham(loaisanpham)
INCLUDE ([TenSanPham],[DonGia],[MoTaSanPham],[ThuongHieu])

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

--drop index index_LoaiSanPham on sanpham
--drop index index_ThuongHieu on sanpham
--drop index index_LoaiSanPham_DonGia on sanpham
--drop index index_KhachHang on diachigiaohang
--drop index index_DiaChiGiaoHang on donhang
--drop index index_TinhTrang on TinhTrangDonHang
