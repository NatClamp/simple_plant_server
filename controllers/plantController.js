const db = require("../db/db");

exports.getPlants = (req,res,next) => {
    db.many(SQL QUERY GOES HERE)
    .then(plantInfo => {
        const { family_name, binomial_name, common_name  } = info;
        res.status(200).json({family_name, binomial_name, common_name})
    })
}