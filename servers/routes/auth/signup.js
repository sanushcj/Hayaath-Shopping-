// IMPORTS FROM PACKAGES
const mongoose = require("mongoose");
const express = require('express');
const User = require("../../model/usermodel");

const loginRouter = express.Router();

loginRouter.post("/signup", async (req ,result) => {
    const {email ,name,password} = req.body;
   const existingUser = User.findOne({email});
    if (existingUser) {
        return result.statusCode(400).json({msg : "User already exists try to Sign in"})
    }
} );



module.exports = loginRouter;



