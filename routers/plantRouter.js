const plantRouter = require("express").Router();
const {
  getPlants,
  getPlantsInFamily,
  getLatinName,
  addPlant
} = require("../controllers/plantController");

plantRouter
  .route("/")
  .get(getPlants)
  .post(addPlant);

plantRouter.route("/families/:family_name").get(getPlantsInFamily);

plantRouter.route("/common/:common_name").get(getLatinName);

module.exports = plantRouter;
