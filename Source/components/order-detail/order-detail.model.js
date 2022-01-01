const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {
  this.page = async (id, result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "select ChiTietDonHang.*, sanpham.TenSanPham, sanpham.DonGia as Gia  from ChiTietDonHang,sanpham " + 
        "where madonhang = @varID and sanpham.masanpham = ChiTietDonHang.masanpham";
      return await pool.request()
        .input("varID", sql.Int, id)
        .query(sqlstring, (e, data) => {
          if (!e) result(null, data.recordset);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  };
};
