const Account = require("./account.model");
const accountLogin = new Account();
const store = require("store");

exports.paging = (req, res) => {
  accountLogin.page(store.get("id"), (e, data) => {
    if (!e) res.render("account", { user: data });
    else res.redirect("/");
  });
};
