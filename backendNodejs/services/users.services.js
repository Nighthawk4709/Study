const User = require("../model/users.model");
const bcrypt = require("bcryptjs");
const auth = require("../middlewares/auth.js");
const otpGenerator = require("otp-generator");
const crypto = require("crypto");
const key = "otp-secret-key";

async function createOtp(params,callback){
    const otp = otpGenerator.generate(4,{
        lowerCaseAlphabets:false,
        upperCaseAlphabets: false,specialChars : false});
    const ttl = 5*60*1000;
    const expires = Date.now()+ ttl;
    const data = `${params.phone}.${otp}.${expires}`;
    const hash = crypto.createHmac("sha256",key).update(data).digest("hex");
    const fullHash = `${hash}.${expires}`;
    console.log(`Your OTP is ${otp}`);

    
    return callback(null,fullHash);
}
async function verifyOTP(params,callback){
    let [hashValue,expires] = params.hash.split('.');
    let now = Date.now();
    if(now > parseInt(expires)) return callback("OTP Expired");

    let data = `${params.phone}.${params.otp}.${expires}`;
    let newCalculateHash = crypto.createHmac("sha256",key).update(data).digest("hex");

    if(newCalculateHash == hashValue){
        return callback(null,"Success");
    }
    return callback("Invalid OTP");

}

module.exports = {
    createOtp,
    verifyOTP
};