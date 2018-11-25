const plantRouter = require("express").Router();
const { getPlants } = require("../controllers/plantController");

plantRouter.route("/").get(getPlants);

module.exports = areaRouter;
