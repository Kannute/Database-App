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
app.get("/wpisPracownika.html", (req, res) => res.sendFile(`${__dirname}/wpisPracownika.html`))

app.get("/wszyscy_wiezniowie", async(req,res)=> {
    const rows = await wczytajWszystkichWiezniow();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/wszystkie_cele", async(req,res)=> {
    const rows = await wczytajWszystkieCele();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/dozywotni_wiezniowie", async(req,res)=> {
    const rows = await wczytajDozywotnichWiezniow();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/wszyscy_pracownicy", async(req,res)=> {
    const rows = await wczytajWszystkichPracownikow();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/depozyt_wiezniow", async(req,res)=> {
    const rows = await wczytajDepozytWiezniow();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/cele_wiezniow", async(req,res)=> {
    const rows = await wczytajCeleWiezniow();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/wyroki_wiezniow", async(req,res)=> {
    const rows = await wczytajWyrokiWiezniow();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/wszystkie_pokoje", async(req,res)=> {
    const rows = await wczytajWszystkiePokoje();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/wszystkie_pokoje_depozyt", async(req,res)=> {
    const rows = await wczytajWszystkiePokojeDepozyt();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/depozyt_wiezniow_pokoje", async(req,res)=> {
    const rows = await wczytajDepozytWiezienPokoj();
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
        console.log("Zlapano wyjatek w app.post "+e)
        result.success=false;
    }
   
})

app.post("/wpis_pracownika", async (req, res) =>{
    let result = {}
    try{
        const reqJson = req.body;
        result.success = await wpisPracownika(reqJson)
    }
    catch(e){
        console.log("Zlapano wyjatek w app.post pracownikia " + e)
        result.success = false;
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

async function wczytajWszystkichWiezniow(){
    try{
        const results = await pool.query("select * from wszyscy_wiezniowie;");
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function wczytajDozywotnichWiezniow(){
    try{
        const results = await pool.query("select * from dozywotni_wiezniowie;");
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function wczytajWszystkichPracownikow(){
    try{
        const results = await pool.query("select * from wszyscy_pracownicy;");
        //console.table(JSON.stringify(results.rows));
        return results.rows;
    }
    catch(e){
        return [];
    }
}


async function wczytajDepozytWiezniow(){
    try{
        const results = await pool.query("select * from depozyt_wiezniow;");
        //console.table(JSON.stringify(results.rows));
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function wczytajWszystkieCele(){
    try{
        const results = await pool.query("select * from wszystkie_dostepne_cele;");
        //console.table(JSON.stringify(results.rows));
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function wczytajCeleWiezniow(){
    try{
        const results = await pool.query("select * from wiezniowie_cele;");
        //console.table(JSON.stringify(results.rows));
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function wczytajWyrokiWiezniow(){
    try{
        const results = await pool.query("select * from wiezniowie_wyrok;");
        //console.table(JSON.stringify(results.rows));
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function wczytajWszystkiePokoje(){
    try{
        const results = await pool.query("select * from wszystkie_pokoje;");
        //console.table(JSON.stringify(results.rows));
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function wczytajWszystkiePokojeDepozyt(){
    try{
        const results = await pool.query("select * from wszystkie_pokoje_depozyt;");
        //console.table(JSON.stringify(results.rows));
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function wczytajDepozytWiezienPokoj(){
    try{
        const results = await pool.query("select * from wiezniowie_depozyt_pokoj;");
        //console.table(JSON.stringify(results.rows));
        return results.rows;
    }
    catch(e){
        return [];
    }
}



async function wpisWieznia(dane){
    try{
        const imie = dane.imie;
        const nazwisko= dane.nazwisko;
        const pesel = dane.peseltext;
        const nr_celi = dane.cela;
        const nr_segmentu = dane.segmentno;
        const nazwa_wyroku =  dane.wyroktext;
        const data_zakonczenia_wyroku = dane.koniecwyroku;
        const nazwa_depozytu = dane.depozyttext;
        const ilosc_depozytowa =  dane.depozytilosc;
        console.log("insert into wiezienie.wpis_wieznia values( '"+ imie +"', '"+nazwisko+ "', "+Number(pesel)+","+parseInt(nr_celi,10)+","+parseInt(nr_segmentu,10)+",'"+nazwa_wyroku+"','"+data_zakonczenia_wyroku+"','"+nazwa_depozytu+"',"+parseInt(ilosc_depozytowa,10)+")")  
        const queryResult = await pool.query("insert into wiezienie.wpis_wieznia values( '"+ imie +"', '"+nazwisko+ "', "+Number(pesel)+","+parseInt(nr_celi,10)+","+parseInt(nr_segmentu,10)+",'"+nazwa_wyroku+"','"+data_zakonczenia_wyroku+"','"+nazwa_depozytu+"',"+parseInt(ilosc_depozytowa,10)+")")
        console.log(queryResult)
        return true;
    }
    catch(e){
        console.log("Złapano wyjątek przy wpisie wieznia" + e)
        return false;
    }
}

async function wpisPracownika(dane){
    try{
        const imie = dane.imie;
        const nazwisko= dane.nazwisko;
        const nr_pokoju = dane.pokoj;
        const zawod = dane.zawod;
        console.log("insert into wiezienie.wpis_pracownika values('"+ imie +"', '" + nazwisko + "', '" + zawod +"' , ' " + parseInt(nr_pokoju,10)+ "');")
        const queryResult = await pool.query("insert into wiezienie.wpis_pracownika values('"+ imie +"', '" + nazwisko + "', '" + zawod +"' , ' " + parseInt(nr_pokoju,10)+ "');")
        console.log(queryResult)
        return true;
    }
    catch(e){
        console.log("Zlapano wyjatek przy wpisie pracownika" + e)
        return false;
    }   
}