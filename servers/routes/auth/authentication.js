const express = require('express');
const mongoose = require('mongoose');
const jwt = require('jsonwebtoken');
const User = require('../../model/usermodel');
const auth = require('../../middlewares/authentication_wares');
const tokenRouter = express.Router();

tokenRouter.post('/authentication/usercheck', async (req, result) => {

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
        result.status(500).json({
            error: error.message
        });
    }


});


//getUserData

tokenRouter.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
  });


module.exports = tokenRouter;