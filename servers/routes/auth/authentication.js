const express = require('express');
const mongoose = require('mongoose');
const jwt = require('jsonwebtoken');
const User = require('../../model/usermodel');
const auth = require('../../middlewares/authentication_wares');
const { protect } = require('../../middlewares/jwtAuth');
const tokenCheck = express.Router();

tokenCheck.post('/authentication/usercheck', async (req, result) => {

    try {
        if (authHeader) {
            const token = authHeader.split(' ')[1];
            const verified = jwt.verify(token, "passwordKey");
            if (!verified) {
                return result.json(false);
            }
            const user = User.findById(verified.id);
            if (!user) {
                return result.json(false);
            }
            result.json(true);

        }
    } catch (error) {
        console.log('err',error);
        result.status(500).json({
            error: error.message
        });
    }


});


//getUserData

tokenCheck.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
  });

// router.route("/token").get(protect,(req,res)=>{
//     res.send("HI")
// })

module.exports = tokenCheck;