const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,


    },
    email: {
        required: true,
        type: String,
        trim: true,
        validator: {
            validator: (value) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: "Please enter valid email address",
        }

    },
    password: {
        required: true,
        type: String,

    },
    address: {
        type: String,
        default: "",
    },
    usertype: {

        type: String,
        default: "user",

    },
    //CART
});

const User = mongoose.model("User",userSchema);
module.exports = User;