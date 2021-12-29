const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {
  this.page = async (result) => {
    try {
      const pool = await conn;

      const sqlstring =
        "select sanpham.* from khuyenmai,sanpham where khuyenmai.sanpham = sanpham.masanpham";
      const spkm = await pool.request().query(sqlstring);

      const sqlstring2 =
        "select sanpham.* from sanpham,loaisanpham where loaisanpham.maloai = sanpham.loaisanpham and loaisanpham.tenloai = N'Sữa bột'";
      const suabot = await pool.request().query(sqlstring2);

      const sqlstring3 =
        "select sanpham.* from sanpham,loaisanpham where loaisanpham.maloai = sanpham.loaisanpham and loaisanpham.tenloai = N'Sữa tươi'";
      const suatuoi = await pool.request().query(sqlstring3);

      const sqlstring4 =
        "select sanpham.* from sanpham,loaisanpham where loaisanpham.maloai = sanpham.loaisanpham and loaisanpham.tenloai = N'Bỉm tả'";
      const bimsua = await pool.request().query(sqlstring4);

      const sqlstring5 =
        "select sanpham.* from sanpham,loaisanpham where loaisanpham.maloai = sanpham.loaisanpham and loaisanpham.tenloai = N'Ăn dặm'";
      const andam = await pool.request().query(sqlstring5);

      const sqlstring6 =
        "select sanpham.* from sanpham,loaisanpham where loaisanpham.maloai = sanpham.loaisanpham and loaisanpham.tenloai = N'Chăm sóc sức khoẻ'";
      const cssk = await pool.request().query(sqlstring6);

      const sqlstring7 =
        "select sanpham.* from sanpham,thuonghieu where sanpham.thuonghieu = thuonghieu.MaThuongHieu and thuonghieu.TenThuongHieu = 'Ensure'";
      const ensure = await pool.request().query(sqlstring7);

      const sqlstring8 =
        "select sanpham.* from sanpham,thuonghieu where sanpham.thuonghieu = thuonghieu.MaThuongHieu and thuonghieu.TenThuongHieu = 'Pedisure'";
      const pedisure = await pool.request().query(sqlstring8);

      const sqlstring9 =
        "select sanpham.* from sanpham,thuonghieu where sanpham.thuonghieu = thuonghieu.MaThuongHieu and thuonghieu.TenThuongHieu = 'Huggies'";
      const huggies = await pool.request().query(sqlstring9);

      const sqlstring10 =
        "select sanpham.* from sanpham,thuonghieu where sanpham.thuonghieu = thuonghieu.MaThuongHieu and thuonghieu.TenThuongHieu = 'Bobby'";
      const bobby = await pool.request().query(sqlstring10);

      const sqlstring11 =
        "select sanpham.* from sanpham,thuonghieu where sanpham.thuonghieu = thuonghieu.MaThuongHieu and thuonghieu.TenThuongHieu = 'Johnson baby'";
      const baby = await pool.request().query(sqlstring11);

      result(false, {
        khuyenmai: spkm.recordset,
        suabot: suabot.recordset,
        suatuoi: suatuoi.recordset,
        bimsua: bimsua.recordset,
        andam: andam.recordset,
        cssk: cssk.recordset,
        ensure: ensure.recordset,
        pedisure: pedisure.recordset,
        huggies: huggies.recordset,
        bobby: bobby.recordset,
        baby: baby.recordset,
      });
    } catch {
      result(true, null);
    }
  }
};
