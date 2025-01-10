const { Pool } = require("pg");
const connectionString = process.env.DB_URL;
//take the connection string from neon and create DB_URL inside .env file
const pool = new Pool({
  connectionString: connectionString,
});
pool
  .connect()
  .then((res) => {
    console.log(`DB connected to ${res.database}`);
  })
  .catch((err) => {
    console.log(err);
  });
  module.exports = { pool };