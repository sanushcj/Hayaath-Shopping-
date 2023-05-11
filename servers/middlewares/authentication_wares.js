const jwt = require("jsonwebtoken");

const auth = async (req, result, next) => {
  try {
    const token = req.header("Bearer");
    if (!token)
      return result.status(401).json({ msg: "No auth token, access denied" });

    const verified = jwt.verify(token, "passwordKey");
    if (!verified)
      return result
        .status(401)
        .json({ msg: "Token verification failed, authorization denied." });
    req.user = verified.id;
    req.token = token;
    next();
  } catch (err) {
    console.log('err0r at auth middleware',err);
    result.status(500).json({ error: err.message });
  }
};

module.exports = auth;