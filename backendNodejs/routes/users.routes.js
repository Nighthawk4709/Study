const userController = require("../controllers/users.controllers");
const express = require("express");
const router = express.Router();


router.post("/otpLogin",userController.otpLogin);
router.post("/verifyOTP",userController.verifyOTP);
router.get("user-profile",userController.userProfile);
module.exports = router;