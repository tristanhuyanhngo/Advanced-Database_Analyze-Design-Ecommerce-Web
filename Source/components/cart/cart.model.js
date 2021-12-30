const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {
  this.page = async (id, result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "select sanpham.masanpham, sanpham.tensanpham, sanpham.DonGia as gia, ChiTietGioHang.soluong,ChiTietGioHang.dongia as tonggia " +
        "from ChiTietGioHang, sanpham where ChiTietGioHang.makhachhang = @varID and ChiTietGioHang.masanpham = sanpham.masanpham";
      const data = await pool
        .request()
        .input("varID", sql.Int, id)
        .query(sqlstring);

      let ttsp = 0;
      for (var i = 0; i < data.recordset.length; i++)
        ttsp += data.recordset[i].tonggia;

      let pvc = Math.floor(Math.random() * 101) + 1;

      let VAT = Math.floor(Math.random() * 20);

      let tc = ttsp*(100+VAT)/100 + pvc

      console.log('ttsp: ', ttsp)
      console.log('pvc: ',pvc)
      console.log('VAT: ', VAT)
      console.log('tc: ', Math.floor(tc))
      
      result(null, {
        data:data.recordset,
        tongtiensanpham:ttsp,
        phivanchuyen:pvc,
        VAT:VAT,
        TongCong: Math.floor(tc)
      });

    } catch {
      result(true, null);
    }
  };
};
