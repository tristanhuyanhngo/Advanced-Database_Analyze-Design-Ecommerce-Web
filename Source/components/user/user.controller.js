const User = require("./user.model");
const userLogin = new User();

exports.paging = (req, res) => {
  res.render("user"); 
};

