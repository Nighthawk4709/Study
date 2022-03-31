const express = require('express');
const mongoose = require('mongoose');
const dbConfig = require('./config/db.config');
const auth = require('./middlewares/auth.js');
const unless = require('express-unless');
const errors = require('./middlewares/errors.js');
const app = express();

mongoose.Promise = global.Promise;
mongoose.connect(dbConfig.db ,{
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(
    ()=>{
        console.log('Database connected');
    },
    (error)=>{
        console.log('Database not connected : '+error);
    }
)
auth.authenticateToken.unless = unless;
app.use(
    auth.authenticateToken.unless({
        path:[
            {url:"/users/login",methods:["POST"]},
            {url:"/users/register",methods:["POST"]},
          {url : "/users/otpLogin",methods : ["POST"]},
          {url : "/users/verifyOTP",methods : ["POST"]}  
        ],
    })
);

app.use(express.json());
app.use("/users",require("./routes/users.routes"));
app.use(errors.errorHandler);
app.listen(process.env.port || 4000,function(){
    console.log("Ready to Go!");
});
