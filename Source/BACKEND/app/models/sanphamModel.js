const { conn, sql } = require("../../connectdb");

//menu chính, đặt hàng, theo dõi đơn hàng
module.exports = function (){
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
    const sqlstring = "update sanpham set tensanpham= 'quabuon' where Masanpham = @varID";
    return await pool.request()
    .input("varID",sql.Int, id)
    .query(sqlstring, (e, data) => {
      if (!e) {
        result(null, id);
      } else {
        result(true, null);
      }
    });
  };
};
