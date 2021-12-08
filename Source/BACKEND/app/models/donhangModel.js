const { conn, sql } = require("../../connectdb");

// {
//   "DSSP":[{
//     "TenSP": "fjas"
//     "SoLuong": 24
//   },
//   {
//     "TenSP": "fjas"
//     "SoLuong": 24
//   }],

//   "TTKH":
//   {
//     SDTKH:
//   }
// }

module.exports = function () {
  this.xacNhanDonHang = async (DSSP, TT, result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "insert into DonHang(DonViVanChuyen,VAT,HinhThucThanhToan,ThoiGianNhanHangDuKien,ThoiGianDatHang) values('AhaMove',0,'COD',@varDate1, @varDate2)";
      await pool
        .request()
        .input("varDate1", sql.Date, "2001-08-24")
        .input("varDate2", sql.Date, "2001-08-30")
        .query(sqlstring);


      for (let i = 0; i < DSSP.length; i++) {
        const sqlstring =
          "insert into ChiTietDonHang values(1,@varID, @varQuantity, 0)";
        await pool
          .request()
          .input("varID", sql.Date, DSSP[i].IDSP)
          .input("varQuantity", sql.Date, DSSP[i].SL)
          .query(sqlstring);
      }
      return result(null, true);
    } catch(e) 
    {
      console.log(e)
      return result(true, null);
    }
  };
};
