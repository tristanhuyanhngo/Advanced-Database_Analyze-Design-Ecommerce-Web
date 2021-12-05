const { conn, sql } = require("../../connectdb");

module.exports = function () {
  this.getAll = async (result) => {
    const pool = await conn;
    const sqlstring = "SELECT * FROM Student";
    return await pool.request()
    .query(sqlstring, (e, data) => {
      if (!e) {
        result(null, data.recordset);
      } else {
        result(true, null);
      }
    });
  };

  this.getOne = async (id, result)=>{
    const pool = await conn;
    const sqlstring = "SELECT * FROM Student WHERE Student.Id = @varID";
    return await pool
      .request()
      .input("varID", sql.Int, id)
      .query(sqlstring, (e, data) => {
        if (data.recordset.length>0) {
          result(null, data.recordset[0]);
        } else {
          result(true, null);
        }
      });
  };

  this.create = async (newData, result) => {
    const pool = await conn;
    const sqlstring =
      "insert into Student(Name,Email,Phone) values(@varName, @varEmail, @varPhone)";
    return await pool
      .request()
      .input("varName", sql.NVarChar, newData.Name)
      .input("varEmail", sql.VarChar, newData.Email)
      .input("varPhone", sql.VarChar, newData.Phone)
      .query(sqlstring, (e, data) => {
        if (!e) {
          result(null, newData);
        } else {
          result(true, null);
        }
      });
  };

  this.up = async (newData, result) => {
    const pool = await conn;
    const sqlstring =
      "UPDATE student SET Name = @name, Email = @email, Phone = @phone WHERE Id = @id";
    return await pool
      .request()
      .input("name", sql.NVarChar, newData.Name)
      .input("email", sql.VarChar, newData.Email)
      .input("phone", sql.VarChar, newData.Phone)
      .input("id", sql.Int, newData.Id)
      .query(sqlstring, (e, data) => {
        if (!e) {
          result(null, newData);
        } else {
          result(true, null);
        }
      });
  };

  this.del = async (id, result) => {
    // delete from student where id = 1
    const pool = await conn;
    const sqlstring = "DELETE FROM student Where Id = @varID";
    return await pool
      .request()
      .input("varID", sql.Int, id)
      .query(sqlstring, (e, data) => {
        if (!e) {
          result(null, "xoa thanh cong");
        } else {
          result(true, null);
        }
      });
  };
};
