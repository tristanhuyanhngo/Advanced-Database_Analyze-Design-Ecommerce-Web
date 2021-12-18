const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');

const indexRouter = require('./components/index/index.route')
const usersRouter = require('./components/cart/cart.route');
const cartRouter = require('./routes/cart');
const checkoutRouter = require('./routes/checkout');
const loginRouter = require('./routes/login');
const orderhistoryRouter = require('./routes/oderhistory');
const productdetailRouter = require('./routes/product-details');
const accountRouter = require('./routes/account');

const app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/cart', cartRouter);
app.use('/checkout', checkoutRouter);
app.use('/login', loginRouter);
app.use('/orderhistory', orderhistoryRouter);
app.use('/product-details', productdetailRouter);
app.use('/users', usersRouter);
app.use('/account', accountRouter);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
