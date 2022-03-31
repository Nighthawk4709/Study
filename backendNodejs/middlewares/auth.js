const jwt = require('jsonwebtoken');

function authenticateToken(req,res,next){
    const authHeader = req.headers["authorization"];
    const token = authHeader && authHeader.split(' ')[1];

    if(token == null) return res.sendStatus(401);
    jwt.verify(token,"Auth_key",(err,user)=>{
        if(err) return res.sendStatus(403);
        req.user = user;
        next();
    });
}

function generateAcessToken(username){
    return jwt.sign({data: username},"Auth_key",{
        expiresIn : "1h",
    });
}
module.exports = {
    authenticateToken,
    generateAcessToken,
};