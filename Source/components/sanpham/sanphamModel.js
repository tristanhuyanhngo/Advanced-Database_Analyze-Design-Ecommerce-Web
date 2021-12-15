const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {
  // this.getproducts = async (result) => {
  //   try {
  //     const pool = await conn;
  //     const sqlstring =
  //       "select * from sanpham";
  //     return await pool
  //       .request()
  //       .query(sqlstring, (e, data2) => {
  //         if (data2.recordset.length > 0) result(null, data2.recordset);
  //         else result(true, null);
  //       });
  //   } catch {
  //     result(true, null);
  //   }
  // };


  this.getpromotionproduct = async (result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "select * from sanpham, khuyenmai where khuyenmai.sanpham = sanpham.masanpham";
      return await pool
        .request()
        .query(sqlstring, (e, data2) => {
          if (data2.recordset.length > 0) result(null, data2.recordset);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  };

  this.getfreshmilkproduct = async (result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "select * from sanpham, loaisanpham where loaisanpham.maloai = sanpham.loaisanpham and sanpham.loaisanpham = N'Sữa tươi' ";
      return await pool
        .request()
        .query(sqlstring, (e, data2) => {
          if (data2.recordset.length > 0) result(null, data2.recordset);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  };

  this.getpowderedmilkproduct = async (result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "select * from sanpham, loaisanpham where loaisanpham.maloai = sanpham.loaisanpham and sanpham.loaisanpham = N'Sữa bột' ";
      return await pool
        .request()
        .query(sqlstring, (e, data2) => {
          if (data2.recordset.length > 0) result(null, data2.recordset);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  };

  this.getdiaperdiapersproduct = async (result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "select * from sanpham, loaisanpham where loaisanpham.maloai = sanpham.loaisanpham and sanpham.loaisanpham = N'Bỉm tả' ";
      return await pool
        .request()
        .query(sqlstring, (e, data2) => {
          if (data2.recordset.length > 0) result(null, data2.recordset);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  };

  this.getnutritionproduct = async (result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "select * from sanpham, loaisanpham where loaisanpham.maloai = sanpham.loaisanpham and sanpham.loaisanpham = N'Dinh dưỡng' ";
      return await pool
        .request()
        .query(sqlstring, (e, data2) => {
          if (data2.recordset.length > 0) result(null, data2.recordset);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  };

};
