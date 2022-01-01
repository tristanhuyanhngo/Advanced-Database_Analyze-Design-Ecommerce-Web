const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {
  this.page = async (id, result) => {
    try {
      const pool = await conn;

      const sqlstring1 = "select * from khachhang where MaKhachHAng = @varID";
      const ttkh = await pool
        .request()
        .input("varID", sql.Int, id)
        .query(sqlstring1);

      let dd = ttkh.recordset[0].NgaySinhKhachHang.getDate();
      let mm = ttkh.recordset[0].NgaySinhKhachHang.getMonth() + 1;
      let yyyy = ttkh.recordset[0].NgaySinhKhachHang.getFullYear();
      ttkh.recordset[0].NgaySinhKhachHang = dd + "-" + mm + "-" + yyyy;

      const sqlstring2 = "select * from be where khachhang = @varID";
      const be = await pool
        .request()
        .input("varID", sql.Int, id)
        .query(sqlstring2);

        for (let i = 0; i < be.recordset.length; i++) {
          if (be.recordset[i].NgaySinh != null) {
            let dd = be.recordset[i].NgaySinh.getDate();
            let mm = be.recordset[i].NgaySinh.getMonth() + 1;
            let yyyy = be.recordset[i].NgaySinh.getFullYear();
            be.recordset[i].NgaySinh = dd + "-" + mm + "-" + yyyy;
          }
        }

      const sqlstring3 = "select * from PhieuGiamGia where khachhang = @varID and TinhTrang = N'Chưa xài'";
      const pgg = await pool
        .request()
        .input("varID", sql.Int, id)
        .query(sqlstring3);

      result(false, {
        thongtinkhachang: ttkh.recordset[0],
        be: be.recordset,
        phieugiamgia: pgg.recordset,
      });
    } catch {
      result(true, null);
    }
  },

  this.edit = async (id, result) => {
    try {
      const pool = await conn;

      const sqlstring1 = "select * from khachhang where MaKhachHAng = @varID";
      const ttkh = await pool
        .request()
        .input("varID", sql.Int, id)
        .query(sqlstring1);

      result(false, true);
    } catch {
      result(true, null);
    }
  };
};
