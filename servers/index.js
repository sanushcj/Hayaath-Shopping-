// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

//IMPORTS FROM OTHER FILES 
const authRouter = require("./routes/auth/signup.js");


// INIT
const DB = "mongodb+srv://sanushcj:prosanush@cluster0.wixg0g1.mongodb.net/?retryWrites=true&w=majority"
const PORT = process.env.PORT || 3000;
const app = express();

//MIDDILEWARE
app.use(authRouter);

//api
app.get("/hello-world",(req,result) => {
result.json({hi : "mutheee"})
} );


//CONNECTIONS
app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
  });

  mongoose.connect(DB).then(()=>{
    console.log('Nee oru killadi thanne')
  })