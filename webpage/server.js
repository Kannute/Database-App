const {Client} = require('pg')
const client = new Client("//rrmazoiy:7UbgjJtkYd5IZqPZlBAIenrECU1rbHL0@hattie.db.elephantsql.com:5432/rrmazoiy");

client.connect()
.then(()=> console.log("Connected Succesfuly"))
.then(() => client.query("select * from test"))
.then(results => console.table(results.rows))
.catch(e => console.log)
.finally(()=> client.end());

