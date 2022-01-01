const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {
  (this.getProduct = async (id, result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "select * from sanpham, loaisanpham, thuonghieu where masanpham = @varID " +
        "and loaisanpham.maloai = sanpham.loaisanpham and sanpham.thuonghieu = thuonghieu.mathuonghieu";
      const inforProduct = await pool
        .request()
        .input("varID", sql.Int, id)
        .query(sqlstring);

      const sqlstring2 =
        "select SanPhamMuaCung.*, sanpham.TenSanPham as Ten, sanpham.DonGia as Gia from SanPhamMuaCung, sanpham "+ 
        "where SanPhamMuaCung.MaSanPham = @varID and SanPhamMuaCung.SanPhamMuaCung = sanpham.MaSanPham";
      const spmc = await pool
        .request()
        .input("varID", sql.Int, id)
        .query(sqlstring2);

      result(null, {
        thongtinsanpham: inforProduct.recordset[0],
        sanphammuacung: spmc.recordset,
      });
    } catch {
      result(true, null);
    }
  }),
    (this.putProductToCart = async (idsp, idkh, result) => {
      try {
        const pool = await conn;
        const sqlstring =
          "insert into ChiTietGioHang(MaKhachHang,MaSanPham,SoLuong,DonGia) values (@varIDKH,@varIDSP, 1,1)";
        return pool
          .request()
          .input("varIDSP", sql.Int, idsp)
          .input("varIDKH", sql.Int, idkh)
          .query(sqlstring, (e, data) => {
            if (!e) result(null, "successfully");
            else result(true, null);
          });
      } catch (e) {
        result(true, "error");
      }
    });
};
