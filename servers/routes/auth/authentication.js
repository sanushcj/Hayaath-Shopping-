const express = require('express');
const mongoose = require('mongoose');
const jwt = require('jsonwebtoken');
const User = require('../../model/usermodel');
const auth = require('../../middlewares/authentication_wares');
const { protect } = require('../../middlewares/jwtAuth');
const tokenCheck = express.Router();

tokenCheck.post('/authentication/usercheck', async (req, result) => {
// console.log(req);

    try {
        const authHeader = req.header("Bearer");
        console.log(authHeader);
        if (authHeader) {
            const token = authHeader
            console.log(token);
            const verified = jwt.verify(token, "passwordKey");
            console.log(verified,'ttttt');
            if (!verified) {
                console.log('ffff');
                return result.json(false);
            }
            const user = User.findById(verified.id);
            if (!user) {
                console.log('iiiii');
                return result.json(false);
            }
            result.status(200).json(true);

        }
    } catch (error) {
        console.log('err',error);
        result.status(500).json({
            error: error.message
        });
    }


});


//getUserData

tokenCheck.get("/authentication/userdata", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
  });

// router.route("/token").get(protect,(req,res)=>{
//     res.send("HI")
// })

module.exports = tokenCheck;