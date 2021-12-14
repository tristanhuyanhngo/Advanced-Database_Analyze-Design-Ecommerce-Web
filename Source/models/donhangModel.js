const { conn, sql } = require("../utils/connectdb");

module.exports = function () {
  this.xacNhanDonHang = async (DSSP, TT, result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "insert into DonHang(DonViVanChuyen,VAT,HinhThucThanhToan,ThoiGianNhanHangDuKien,ThoiGianDatHang,DiaChiGiaoHang) values('AhaMove',0,'COD',@varDate1, @varDate2,1)";
      await pool
        .request()
        .input("varDate1", sql.Date, "2001-08-30")
        .input("varDate2", sql.Date, "2001-08-24")
        .query(sqlstring);

      const sqlstring2 = "select MAX(MaDonHang) as mdh from Donhang";
      let dh = await pool.request().query(sqlstring2);

      for (let i = 0; i < DSSP.length; i++) {
        const sqlstring3 =
          "insert into ChiTietDonHang(MaDonHang,MaSanPham,SoLuong,DonGia) values(@varIdDH, @varIdSp, @varQuantity,0)";
        await pool
          .request()
          .input("varIdDH", sql.Int, dh.recordset[0].mdh)
          .input("varIdSp", sql.Int, DSSP[i].ID)
          .input("varQuantity", sql.Int, DSSP[i].SL)
          .query(sqlstring3);
      }

      return result(null, true);
    } catch (e) {
      console.log(e);
      return result(true, null);
    }
  };
};
