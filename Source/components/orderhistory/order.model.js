const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {
  this.page = async (id, result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "select donhang.* from donhang, diachigiaohang where KhachHang = @varID " +
        "and donhang.DiaChiGiaoHang = diachigiaohang.MaDiaChi";
      return await pool
        .request()
        .input("varID", sql.Int, id)
        .query(sqlstring, (e, data) => {
          for (let i = 0; i < data.recordset.length; i++) {
            if (data.recordset[i].ThoiGianDatHang != null) {
              let dd = data.recordset[i].ThoiGianDatHang.getDate();
              let mm = data.recordset[i].ThoiGianDatHang.getMonth() + 1;
              let yyyy = data.recordset[i].ThoiGianDatHang.getFullYear();
              data.recordset[i].ThoiGianDatHang = dd + "-" + mm + "-" + yyyy;
            }
          }
          if (!e) result(null, data.recordset);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  };
};
