const express = require("express");
const app = express();
const cores = require("cors");
require("dotenv").config();
// add .env file / and add PORT=5000 inside it

app.use(cores());
app.use(express.json());



const PORT = process.env.PORT;
app.listen(PORT, () => { 
  console.log(`SERVER LISTENING AT http://localhost:${PORT}`);
});
