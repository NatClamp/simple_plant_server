const app = require("express")();
const bodyParser = require("body-parser");
const router = require("./routers/apiRouter");

app.use(bodyParser);

app.use("/api", router);

app.use((err, req, res, next) => {
  console.log(err);
  res.status(500).json({ err });
});

module.exports = app;
