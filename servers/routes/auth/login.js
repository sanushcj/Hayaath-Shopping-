//package import
const express = require('express');
const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const User = require('../../model/usermodel');
const loginrouter = express.Router();

loginrouter.post('/authentication/login', async (req, result) => {
    try {
        const {
            email,
            password
        } = req.body;

        const user = await User.findOne({
            email
        });
        if (!user) {
            return result.status(400).json({
                msg: 'User with this email does not match'
            });
        }
        const checkpass = await bcrypt.compare(password, user.password);

        if (!checkpass) {
            return result.status(400).json({
                msg: 'User with this email or password does not match'
            });
        } else {
            const mytoken = await jwt.sign({
                id: user._id
            }, "passwordKey");

            result.json({
                mytoken,
                ...user._doc
            });
        }
    } catch (error) {
        console.log('Sanush Sir there is an error,'+error)
        result.status(500).json({
            error: error.message
        });
    }
})

module.exports = loginrouter;