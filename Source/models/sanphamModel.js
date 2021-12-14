const { conn, sql } = require("../utils/connectdb");

//menu chính, đặt hàng, theo dõi đơn hàng
module.exports = function () {
  this.getInforSP = async (result) => {
    const pool = await conn;
    const sqlstring = "SELECT * FROM sanpham";
    return await pool.request().query(sqlstring, (e, data) => {
      if (data.recordset.length > 0) {
        result(null, data.recordset);
      } else {
        result(true, null);
      }
    });
  };

  this.updateSP = async (id, result) => {
    const pool = await conn;
    const sqlstring =
      "update sanpham set tensanpham= 'quabuon' where Masanpham = @varID";
    return await pool
      .request()
      .input("varID", sql.Int, id)
      .query(sqlstring, (e, data) => {
        if (!e) {
          result(null, id);
        } else {
          result(true, null);
        }
      });
  };

  this.getInforSPKM = async (result) => {
    const pool = await conn;
    const sqlstring = "select * from khuyenmai, sanpham where khuyenmai.sanpham = sanpham.masanpham";
    return await pool.request().query(sqlstring, (e, data) => {
      if (data.recordset.length > 0) {
        result(null, data.recordset);
      } else {
        result(true, null);
      }
    });
  };

  this.getInforSPByType = async (type,result) => {
    const pool = await conn;
    const sqlstring = "select sanpham.* from sanpham, loaisanpham where sanpham.loaisanpham = loaisanpham.maloai and tenloai = @varType";
    return await pool.request()
    .input("varType",sql.NVarChar, type)
    .query(sqlstring, (e, data) => {
      if (data.recordset.length > 0) {
        result(null, data.recordset);
      } else {
        result(true, null);
      }
    });
  };

  this.getInforSPByTrademark = async (trademark,result) => {
    const pool = await conn;
    const sqlstring = "select sanpham.* from sanpham, thuonghieu where sanpham.thuonghieu = thuonghieu.mathuonghieu and tenthuonghieu = @varTrademark";
    return await pool.request()
    .input("varTrademark",sql.NVarChar, trademark)
    .query(sqlstring, (e, data) => {
      if (data.recordset.length > 0) {
        result(null, data.recordset);
      } else {
        result(true, null);
      }
    });
  };

  

};
