const Cart = require("./cart.model");
const modelCart = new Cart();
const store = require("store");

exports.paging = (req, res) => {
  modelCart.page(
    store.get("id"),
    store.get("idpgg"),
    store.get("phantramgiam"),
    store.get("tiengiam"),
    (e, data) => {
      res.render("cart", {
        ThongTinGioHang: data.data,
        TongTienSanPham: data.tongtiensanpham,
        PhiVanChuyen: data.phivanchuyen,
        VAT: data.VAT,
        TongCong: data.TongCong,
        GiamGia: data.giamgia,
      });
    }
  );
};

exports.addCoupons = (req, res) => {
  modelCart.addCoupons(req.body.id, store.get("id"), (e, data) => {
    if (data == null) {
      store.set("tiengiam", 0);
      store.set("phantramgiam", 0);
      store.set("idpgg", null);
      req.flash("magiamgia", "Mã không hợp lệ");
      res.redirect("/cart");
    } else {
      store.set("tiengiam", data.SoTienGiam);
      store.set("phantramgiam", data.PhanTramGiamGia);
      store.set("idpgg", data.MaPhieu);
      req.flash("magiamgia", "Mã hợp lệ");
      res.redirect("/cart");
    }
  });
};

exports.changeCart = (req, res) => {
  modelCart.changeCart(
    req.params.id,
    req.body.quantity,
    store.get("id"),
    (e, data) => {
      res.redirect("/cart");
    }
  );
};
