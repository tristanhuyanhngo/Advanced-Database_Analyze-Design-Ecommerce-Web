const Account = require("./account.model");
const accountLogin = new Account();
const store = require("store");

exports.paging = (req, res) => {
  accountLogin.page(store.get("id"), (e, data) => {
    if (!e) res.render("account", { 
      thongtinkhachang: data.thongtinkhachang,
      be: data.be,
      phieugiamgia:  data.phieugiamgia
    });
    else res.redirect("/");
  });
};


exports.edit = (req, res) => {
  accountLogin.edit(store.get("id"), (e, data) => {
    res.render("account");
  });
};