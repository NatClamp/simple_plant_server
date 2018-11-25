const db = require("../db/db");

exports.getPlants = (req, res, next) => {
  db.many(
    "SELECT family_name, binomial_name FROM families JOIN latin_binomials ON families.family_id = latin_binomials.family_id JOIN common_names ON latin_binomials.binomial_id = common_names.binomial_id;"
  )
    .then(plantInfo => {
      res.status(200).json({ plantInfo });
    })
    .catch(next);
};

exports.getPlantsInFamily = (req, res, next) => {
  db.many(
    "SELECT binomial_name FROM families JOIN latin_binomials ON families.family_id = latin_binomials.family_id JOIN common_names ON latin_binomials.binomial_id = common_names.binomial_id WHERE families.family_name = $<family_name>;",
    req.params
  )
    .then(plantInfo => {
      res.status(200).json({ plantInfo });
    })
    .catch(next);
};

exports.getLatinName = (req, res, next) => {
  db.many(
    "SELECT binomial_name FROM families JOIN latin_binomials ON families.family_id = latin_binomials.family_id JOIN common_names ON latin_binomials.binomial_id = common_names.binomial_id WHERE common_names.common_name = $<common_name>;",
    req.params
  )
    .then(binomial => {
      res.status(200).json({ binomial });
    })
    .catch(next);
};
