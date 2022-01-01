const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {
  (this.page = async (id, idpgg, ptgg, tg, result) => {
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

      if (idpgg == null || idpgg == undefined) {
        ptgg = 0;
        tg = 0;
      }

      let tc = (((ttsp * (100 + VAT)) / 100 + pvc) * (100 - ptgg)) / 100 - tg;

      let gg = (((ttsp * (100 + VAT)) / 100 + pvc) * ptgg) / 100 + tg;

      result(null, {
        data: data.recordset,
        tongtiensanpham: ttsp,
        phivanchuyen: pvc,
        VAT: VAT,
        TongCong: Math.floor(tc),
        giamgia: Math.floor(gg),
      });
    } catch {
      result(true, null);
    }
  }),
    (this.addCoupons = async (idpgg, idkh, result) => {
      try {
        const pool = await conn;
        const sqlstring =
          "select * from phieugiamgia where MaPhieu = @varIDPGG and KhachHang = @varIDKH and TinhTrang = N'Chưa xài'";

        return await pool
          .request()
          .input("varIDPGG", sql.Int, idpgg)
          .input("varIDKH", sql.Int, idkh)
          .query(sqlstring, (e, data) => {
            if (data.recordset[0] != undefined) result(null, data.recordset[0]);
            else result(true, null);
          });
      } catch {
        result(true, null);
      }
    }),
    (this.changeCart = async (idsp, sl, idkh, result) => {
      try {
        const pool = await conn;
        if (sl > 0) {
          const sqlstring =
            "update ChiTietGioHang set SoLuong = @varSL where MaKhachHang = @varIDKH and MaSanPham = @varIDSP";
          await pool
            .request()
            .input("varIDKH", sql.Int, idkh)
            .input("varIDSP", sql.Int, idsp)
            .input("varSL", sql.Int, sl)
            .query(sqlstring);
          result(null, null);
        } else {
          const sqlstring =
            "delete ChiTietGioHang where MaKhachHang = @varIDKH and MaSanPham = @varIDSP";
          await pool
            .request()
            .input("varIDKH", sql.Int, idkh)
            .input("varIDSP", sql.Int, idsp)
            .query(sqlstring);
          result(null, null);
        }
      } catch {
        result(true, null);
      }
    }),
    (this.order = async (order, cash, delivery, id, iduser, result) => {
      try {
        const pool = await conn;
        const sqlstring =
          "insert into donhang(VAT,ThoiGianDatHang,DonViVanChuyen,HinhThucThanhToan,DiaChiGiaoHang, TinhTrang) " +
          "values(@varVAT, getdate(), @varDVVC, @varHTTT,1, N'Chờ giao')";
        await pool
          .request()
          .input("varVAT", sql.Int, order.VAT)
          .input("varDVVC", sql.NVarChar, delivery)
          .input("varHTTT", sql.NVarChar, cash)
          .query(sqlstring);

        if (id != null && id != undefined) {
          const sqlstring2 =
            "update PhieuGiamGia set TinhTrang = N'Đã xài' where MaPhieu = @varID";
          await pool.request().input("varID", sql.Int, id).query(sqlstring2);
        }

        const sqlstring3 = "select max(MaDonHang) as MaDonHang from donhang";
        const ID = await pool.request().query(sqlstring3);

        for (let i = 0; i < order.data.length; i++) {
          const sqlstring4 =
            "insert into ChiTietDonHang(MaDonHang,MaSanPham,SoLuong,DonGia) " +
            "values(@varID1, @varID2,@varSL,0)";
          await pool
            .request()
            .input("varID1", sql.Int, ID.recordset[0].MaDonHang)
            .input("varID2", sql.Int, order.data[i].masanpham)
            .input("varSL", sql.Int, order.data[i].soluong)
            .query(sqlstring4);
        }

        const sqlstring5 = "delete ChiTietGioHang where MaKhachHang = @varID";
        await pool.request().input("varID", sql.Int, iduser).query(sqlstring5);

        result(null, "done");
      } catch {
        result(true, null);
      }
    });
};
