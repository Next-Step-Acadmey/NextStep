const express = require("express");
const app = express();
require("dotenv").config();
const cores = require("cors");
app.use(cores());


app.use(express.json());


const PORT = process.env.PORT;
app.listen(PORT, () => {
  console.log(`SERVER LISTENING AT http://localhost:${PORT}`);
});
