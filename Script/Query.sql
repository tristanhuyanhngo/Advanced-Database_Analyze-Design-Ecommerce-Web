use ADB1_6_DATH2
go

-- Khách hàng tìm kiếm các sản phẩm thuộc loại bỉm tả 
select * from sanpham, loaisanpham 
where sanpham.loaisanpham = loaisanpham.maloai 
and loaisanpham.tenloai = N'Bỉm tả' 

-- Khách hàng tìm kiếm các sản phẩm thuộc loại bỉm tả và có đơn giá <500
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

