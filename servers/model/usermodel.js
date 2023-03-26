const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
        required: true,
        trim: true,
        type: String
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
                const re =
                    /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: "Please enter a valid email address",
        },
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

const User = mongoose.model("User", userSchema);
module.exports = User;