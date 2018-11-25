const plantRouter = require("express").Router();
const {
  getPlants,
  getPlantsInFamily,
  getLatinName
} = require("../controllers/plantController");

plantRouter.route("/").get(getPlants);

plantRouter.route("/families/:family_name").get(getPlantsInFamily);

plantRouter.route("/common/:common_name").get(getLatinName);

module.exports = plantRouter;
