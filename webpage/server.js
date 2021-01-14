const {Pool} = require("pg")
const express = require ("express");
const app = express();
var path = require('path');
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());
const pool = new Pool({
    user: "rrmazoiy",
    host: "hattie.db.elephantsql.com",
    database: "rrmazoiy",
    password: "7UbgjJtkYd5IZqPZlBAIenrECU1rbHL0" 
});


app.get("/", (req, res) => res.sendFile(`${__dirname}/index.html`))
app.get("/raporty.html", (req, res) => res.sendFile(`${__dirname}/raporty.html`))

app.get("/wszyscy_wiezniowie", async(req,res)=> {
    const rows = await readAllPrisoners();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})


app.listen(8080, () => console.log("Web server is listening.. on port 8080"))
start()

async function start(){
    await connect();
}

async function connect(){
    try{
        await pool.connect();
    }
    catch(e){
        console.log("Failed to connect");
    }
}

async function readAllPrisoners(){
    try{
        const results = await pool.query("select * from wszyscy_wiezniowie;");
        //console.table(JSON.stringify(results.rows));
        return results.rows;
    }
    catch(e){
        return [];
    }
}