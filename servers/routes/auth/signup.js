// IMPORTS FROM PACKAGES
const mongoose = require("mongoose");
const express = require('express');
const bcrypt = require('bcryptjs');
const User = require("../../model/usermodel");

const loginRouter = express.Router();

loginRouter.post("/signup", async (req, result) => {
    try {
        const {
            email,
            name,
            thepassword
        } = req.body;
        const existingUser = await User.findOne({
            email
        });
        if (existingUser) {
            return result.statusCode(400).json({
                msg: "User already exists try to Sign in"
            });
        }

        const encryptedPassword = await bcrypt.hash(thepassword, 8);

        let user = new User({
            email,
            password: encryptedPassword,
            name
        });

        user = await user.save();
        result.json(user);

    } catch (error) {
        console.log('errorrrrrrrrr')
        result.status(500).json({
            error: error.message
        });
    }


});




module.exports = loginRouter;