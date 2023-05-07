// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

//IMPORTS FROM OTHER FILES 
const signUpRouter = require("./routes/auth/signup.js");
const loginrouter = require('./routes/auth/login.js');
const tokenCheck = require("./routes/auth/authentication.js");


// INIT
const DB = "mongodb+srv://sanushcj:prosanush@cluster0.wixg0g1.mongodb.net/?retryWrites=true&w=majority"
const PORT = process.env.PORT || 3000;
const app = express();

//MIDDILEWARE
app.use(express.json());
app.use(signUpRouter);
app.use(loginrouter);
app.use(tokenCheck);

//api
app.get("/hello-world",(req,result) => {
result.json({hi : "mutheee"})
} );
//CONNECTIONS
app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
  });

  mongoose.connect(DB).then(()=>{
    console.log('DataBase Connected Area51')
  })