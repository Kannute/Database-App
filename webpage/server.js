const {Pool} = require("pg")
const express = require ("express");
const app = express();
app.use(express.json());
const pool = new Pool({
    user: "rrmazoiy",
    host: "hattie.db.elephantsql.com",
    database: "rrmazoiy",
    password: "7UbgjJtkYd5IZqPZlBAIenrECU1rbHL0" 
});

app.use(express.static(__dirname + '/public'));

app.get("/", (req, res) => res.sendFile(`${__dirname}/index.html`))
app.get("/index.html", (req, res) => res.sendFile(`${__dirname}/index.html`))
app.get("/raporty.html", (req, res) => res.sendFile(`${__dirname}/raporty.html`))
app.get("/wpisy.html", (req, res) => res.sendFile(`${__dirname}/wpisy.html`))

app.get("/wszyscy_wiezniowie", async(req,res)=> {
    const rows = await readAllPrisoners();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/wszystkie_cele", async(req,res)=> {
    const rows = await readAllCells();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/dozywotni_wiezniowie", async(req,res)=> {
    const rows = await readLifeSentencePrisoners();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/wszyscy_pracownicy", async(req,res)=> {
    const rows = await readAllEmployees();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/depozyt_wiezniow", async(req,res)=> {
    const rows = await readPrisonersDeposit();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})


app.post("/wpis_wieznia", async (req, res) => {
    let result = {}
    try{
        const reqJson = req.body;
        result.success = await wpisWieznia(reqJson)
    }
    catch(e){
        result.success=false;
    }
    finally{
        res.setHeader("content-type", "application/json")
        res.send(JSON.stringify(result))
    }
   
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
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function readLifeSentencePrisoners(){
    try{
        const results = await pool.query("select * from dozywotni_wiezniowie;");
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function readAllEmployees(){
    try{
        const results = await pool.query("select * from wszyscy_pracownicy;");
        //console.table(JSON.stringify(results.rows));
        return results.rows;
    }
    catch(e){
        return [];
    }
}


async function readPrisonersDeposit(){
    try{
        const results = await pool.query("select * from depozyt_wiezniow;");
        //console.table(JSON.stringify(results.rows));
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function readAllCells(){
    try{
        const results = await pool.query("select * from wszystkie_dostepne_cele;");
        //console.table(JSON.stringify(results.rows));
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function wpisWieznia(dane){
    try{
        /*TODO pomyslec nad triggerem - jak sprawdzic czy query bylo poprawne */
        const imie = dane.fname;
        const nazwisko= dane.lname;
        const pesel = dane.peseltext;
        const nr_celi = dane.cellno;
        const nr_segmentu = dane.segmentno;
        const nazwa_wyroku =  dane.wyroktext;
        const data_zakonczenia_wyroku = dane.enddate;
        const nazwa_depozytu = dane.depozyttext;
        const ilosc_depozytowa =  dane.depozytilosc;
        //console.log("insert into wiezienie.wpis_wieznia values( '"+ imie +"', '"+nazwisko+ "', "+Number(pesel)+","+parseInt(nr_celi,10)+","+parseInt(nr_segmentu,10)+",'"+nazwa_wyroku+"','"+data_zakonczenia_wyroku+"','"+nazwa_depozytu+"',"+parseInt(ilosc_depozytowa,10)+")")  
        const queryResult = await pool.query("insert into wiezienie.wpis_wieznia values( '"+ imie +"', '"+nazwisko+ "', "+Number(pesel)+","+parseInt(nr_celi,10)+","+parseInt(nr_segmentu,10)+",'"+nazwa_wyroku+"','"+data_zakonczenia_wyroku+"','"+nazwa_depozytu+"',"+parseInt(ilosc_depozytowa,10)+")")
        console.log(queryResult)
        return true;
    }
    catch(e){
        console.log("Złapano wyjątek przy wpisie")
        return false;
    }
}