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

/****  Nadanie ścieżek do odpowiednik zapytań ****/

app.get("/", (req, res) => res.sendFile(`${__dirname}/index.html`))     //Przpadek domyślny - przekierowanie na index.html
app.get("/index.html", (req, res) => res.sendFile(`${__dirname}/index.html`))   //Przekierowanie na index.html "ręczne"
app.get("/raporty.html", (req, res) => res.sendFile(`${__dirname}/raporty.html`))   //Przekierowanie na stronę z raportami
app.get("/wpisy.html", (req, res) => res.sendFile(`${__dirname}/wpisy.html`))       //Przekierowanie na stronę z wpisem więźnia
app.get("/wpisPracownika.html", (req, res) => res.sendFile(`${__dirname}/wpisPracownika.html`)) //Przekierowanie na stronę do zatrudnienia pracownika


/****  Realizacja metody GET dla wszystkich zapytań ****/

app.get("/wszyscy_wiezniowie", async(req,res)=> {
    /* Wczytanie wszystkich więźniów */
    const rows = await wczytajWszystkichWiezniow();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/wszystkie_cele", async(req,res)=> {
    /* Wczytanie wszystkich dostępnych cel */
    const rows = await wczytajWszystkieCele();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/dozywotni_wiezniowie", async(req,res)=> {
    /* Wczytanie więźniów z dożywotnim wyrokiem */
    const rows = await wczytajDozywotnichWiezniow();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/wszyscy_pracownicy", async(req,res)=> {
    /* Wczytanie wszystkich pracowników więzienia */
    const rows = await wczytajWszystkichPracownikow();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/depozyt_wiezniow", async(req,res)=> {
    /* Wczytanie depozytu więźniów */
    const rows = await wczytajDepozytWiezniow();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/cele_wiezniow", async(req,res)=> {
    /* Wczytanie więźniów wraz z odpowiadającymi im celami */
    const rows = await wczytajCeleWiezniow();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/wyroki_wiezniow", async(req,res)=> {
    /* Wczytanie więźniów wraz ich wyrokami */
    const rows = await wczytajWyrokiWiezniow();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/wszystkie_pokoje", async(req,res)=> {
    /* Wczytanie wszystkich pokojów */
    const rows = await wczytajWszystkiePokoje();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/wszystkie_pokoje_depozyt", async(req,res)=> {
    /* Wczytanie wszystkich pokojów wraz z depozytem w nich się znajdującym */
    const rows = await wczytajWszystkiePokojeDepozyt();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})

app.get("/depozyt_wiezniow_pokoje", async(req,res)=> {
    /* Wczytanie więźniów, ich depozytu oraz pokoju w którym się znajduje */
    const rows = await wczytajDepozytWiezienPokoj();
    res.setHeader("content-type", "application/json");
    res.send(JSON.stringify(rows))
})


/**** Realizacja metody POST ****/

app.post("/wpis_wieznia", async (req, res) => {
    /* Wpis więźnia do więzienia */

    let result = {}
    try{
        const reqJson = req.body;
        result.success = await wpisWieznia(reqJson)
    }
    catch(e){
        console.log("Zlapano wyjatek w app.post dla wpisu wieźnia "+e)
        result.success=false;
    }
   
})

app.post("/wpis_pracownika", async (req, res) =>{
    /* Zatrudnienie pracownika */

    let result = {}
    try{
        const reqJson = req.body;
        result.success = await wpisPracownika(reqJson)
    }
    catch(e){
        console.log("Zlapano wyjatek w app.post pracownika " + e)
        result.success = false;
    }
})

app.post("/przenies_wieznia", async (req, res) =>{
    /* Przeniesienie więźnia do innej celi */

    let result = {}
    try{
        const reqJson = req.body;
        result.success = await przeniesWieznia(reqJson)
    }
    catch(e){
        console.log("Zlapano wyjatek w app.post przeniesienia wieznia " + e)
        result.success = false;
    }
})




app.delete("/wypisz_wieznia", async (req, res)=>{
    /* Wypis więźnia z więzienia */

    let result = {}
    try{
        const reqJson = req.body;
        result.success = await wypiszWieznia(reqJson)
    }
    catch(e){
        console.log("Zlapano wyjatek w app.delete wieznia " + e)
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


/****** FUNKCJE ODPOWIADAJACE ZA REALIZACJĘ ZAPYTAŃ ******/

async function wczytajWszystkichWiezniow(){
    /* Wczytanie wszystkich więźniów z widoku */

    try{
        const results = await pool.query("select * from wszyscy_wiezniowie;");
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function wczytajDozywotnichWiezniow(){
    /* Wczytanie więźniów z dożywotnim wyrokiem z widoku */

    try{
        const results = await pool.query("select * from dozywotni_wiezniowie;");
        return results.rows;
    }
    catch(e){
        return [];
    }
}

async function wczytajWszystkichPracownikow(){
    /* Wczytanie wszystkich pracowników więzienia z widoku */
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
    /* Wczytanie więźniów wraz z ich depozytem z widoku */

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
    /* Wczytanie wszystkich dostępnych cel z widoku */

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
    /* Wczytanie więźniów wraz z ich celami z widoku */

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
    /* Wczytanie więźniów i odpowiadającym im wyrokom z widoku */

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
    /* Wczytanie wszystkich pokoi z widoku */

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
    /* Wczytanie wszystkich pokoi z depozytem w nich się znajdującym z widoku */

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
    /* Wczytanie więźniów, ich depozytu oraz pokoju, w którym się znajduje z widoku */

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
    /* Wpis więźnia do więzienia zrealizowany przy pomocy wyzwalaczy oraz tabeli pomocniczej */

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
        //console.log("insert into wiezienie.wpis_wieznia values( '"+ imie +"', '"+nazwisko+ "', "+Number(pesel)+","+parseInt(nr_celi,10)+","+parseInt(nr_segmentu,10)+",'"+nazwa_wyroku+"','"+data_zakonczenia_wyroku+"','"+nazwa_depozytu+"',"+parseInt(ilosc_depozytowa,10)+")")  
        const queryResult = await pool.query("insert into wiezienie.wpis_wieznia values( '"+ imie +"', '"+nazwisko+ "', "+Number(pesel)+","+parseInt(nr_celi,10)+","+parseInt(nr_segmentu,10)+",'"+nazwa_wyroku+"','"+data_zakonczenia_wyroku+"','"+nazwa_depozytu+"',"+parseInt(ilosc_depozytowa,10)+")")
        //console.log(queryResult)
        return true;
    }
    catch(e){
        console.log("Złapano wyjątek przy wpisie wieznia" + e)
        return false;
    }
}

async function wpisPracownika(dane){
    /* Zatrudnienie pracownika zrealizowane przy pomocy wyzwalaczy oraz tabeli pomocniczej */
    try{
        const imie = dane.imie;
        const nazwisko= dane.nazwisko;
        const nr_pokoju = dane.pokoj;
        const zawod = dane.zawod;
        //console.log("insert into wiezienie.wpis_pracownika values('"+ imie +"', '" + nazwisko + "', '" + zawod +"' , ' " + parseInt(nr_pokoju,10)+ "');")
        const queryResult = await pool.query("insert into wiezienie.wpis_pracownika values('"+ imie +"', '" + nazwisko + "', '" + zawod +"' , ' " + parseInt(nr_pokoju,10)+ "');")
        //console.log(queryResult)
        return true;
    }
    catch(e){
        console.log("Zlapano wyjatek przy wpisie pracownika" + e)
        return false;
    }   
}


async function wypiszWieznia(dane){
    /* Wypis więźnia realizowany przy po mocy kaskadowego usuwania jego danych oraz wyzwalaczy */

    try{
        await pool.query("delete from wiezienie.wiezien w where imie = '"+dane.imie+"' and nazwisko = '"+dane.nazwisko+"' ;") 
        return true;
    }
    catch(e){
        console.log("Złapano wyjątek podczas wpisu wieznia "+ e)
        return false
    }
}

async function przeniesWieznia(dane){
    /* Aktualizowanie danych dotyczących celi, w której przebywa więzień realizowane przy pomocy wyzwalaczy */

    try{
        /*DO POPRAWY, NIE DZIALA */
        const imie = dane.imie;
        const nazwisko = dane.nazwisko;
        const nr_noweCeli = dane.cela;
        console.log("UPDATE wiezienie.wpis_wieznia ww SET wi.nr_celi = "+ parseInt(nr_noweCeli,10) + " WHERE ww.imie = '"+ imie +"' AND ww.nazwisko= '"+ nazwisko+"';")
    }
    catch(e){
        console.log("Złapano wyjątek podczas przenoszenia więźnia: "+ e)
        return false
    }
}
