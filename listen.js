const app = require("./app");

app.listen(9090, err => {
  if (err) next(err);
  else console.log("Server is listening on 9090...");
});
