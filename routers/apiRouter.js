const router = require("express").Router();
const plantRouter = require("./plantRouter");

router.use("/plants", plantRouter);

module.exports = router;
