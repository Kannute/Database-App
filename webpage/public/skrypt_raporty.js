     /* Raport wszystkich więźniów */
    const btnWszyscyWiezniowie = document.getElementById("btnWszyscyWiezniowie");
    btnWszyscyWiezniowie.addEventListener("click", async e=>{
        wczytajWszystkichWiezniow()

    })
    /* Raport dożywotnich więźniów */
    const btnDozywotniWiezniowie = document.getElementById("btnDozywotniWiezniowie");
    btnDozywotniWiezniowie.addEventListener("click", async e=>{
        wczytajDozywotnichWiezniow()
      
    })

    /*Raport wszystkich pracowników*/
    const btnPokazPracownikow = document.getElementById("btnPokazPracownikow");
    btnPokazPracownikow.addEventListener("click", async e=>{
        wczytajWszystkichPracownikow()
    })

    /*Raport depozytu wiezniow*/
    const btnDepozytWiezniow = document.getElementById("btnDepozytWiezniow");
    btnDepozytWiezniow.addEventListener("click", async e=>{
        wczytajDepozytWiezniow()
    })
    /*Raport wszystkich wolnych cel */
    const btnPokazCele = document.getElementById("btnPokazCele");
    btnPokazCele.addEventListener("click", async e=>{
        wczytajWszystkieCele();
    })

    /* Wczytaj cele wraz z wiezniami */
    const btnCeleWiezniow = document.getElementById("btnCeleWiezniow");
    btnCeleWiezniow.addEventListener("click", async e=>{
        wczytajCeleWiezniow();
    })

    /*Wczytaj wyroki wiezniow */
    const btnWyrokiWiezniow = document.getElementById("btnWyrokiWiezniow");
    btnWyrokiWiezniow.addEventListener("click", async e=>{
        wczytajWyrokiWiezniow();
    })
    /*Wczytaj wszystkie pokoje*/
    const btnWszystkiePokoje = document.getElementById("btnWszystkiePokoje");
    btnWszystkiePokoje.addEventListener("click", async e=>{
        wczytajWszystkiePokoje();
    })

    /*Wczytaj wszystkie pokoje zd depozytem*/
    const btnDepozytPokoje = document.getElementById("btnDepozytPokoje");
    btnDepozytPokoje.addEventListener("click", async e=>{
        wczytajWszystkiePokojeDepozyt();
    })

    async function wczytajWszystkiePokojeDepozyt(){
        try{
            const result = await fetch("http://localhost:8080/wszystkie_pokoje_depozyt", {method:"GET"})
            const raport = await result.json();

            stworzTabele(raport);
        }
        catch(e){
            console.log("Blad we wczytywaniu wszystkich pokoi z depozytem!");
        }
    }

    async function wczytajWszystkiePokoje(){
        try{
            const result = await fetch("http://localhost:8080/wszystkie_pokoje", {method:"GET"})
            const raport = await result.json();

            stworzTabele(raport);
        }
        catch(e){
            console.log("Blad we wczytywaniu wszystkich pokoi!");
        }
    }


    async function wczytajWyrokiWiezniow(){
        try{
            const result = await fetch("http://localhost:8080/wyroki_wiezniow", {method:"GET"})
            const raport = await result.json();

            stworzTabele(raport);
        }
        catch(e){
            console.log("Blad we wczytywaniu wyrokow wiezniow!");
        }
    }

    async function wczytajCeleWiezniow(){
        try{
            const result = await fetch("http://localhost:8080/cele_wiezniow", {method:"GET"})
            const raport = await result.json();

            stworzTabele(raport);
        }
        catch(e){
            console.log("Blad we wczytywaniu cel wiezniow!");
        }
    }


    async function wczytajWszystkichWiezniow(){
        try{
            const result = await fetch("http://localhost:8080/wszyscy_wiezniowie", {method:"GET"})
            const raport = await result.json();

            stworzTabele(raport);
        }
        catch(e){
            console.log("Blad we wczytywaniu wszystkich wiezniow!");
        }
    }


    async function wczytajDozywotnichWiezniow(){
        try{
            const result = await fetch("http://localhost:8080/dozywotni_wiezniowie", {method:"GET"})
            const raport = await result.json();

            stworzTabele(raport);
        }
        catch(e){
            console.log("Blad we wczytywaniu wszystkich wiezniow z dozywotnim wyrokiem!");
        }
    }


async function wczytajWszystkichPracownikow(){
        try{
            const result = await fetch("http://localhost:8080/wszyscy_pracownicy", {method:"GET"})
            const raport = await result.json();

            stworzTabele(raport);
        }
        catch(e){
            console.log("Blad we wczytywaniu pracownikow!");
        }
    }

    
async function wczytajDepozytWiezniow(){
        try{
            const result = await fetch("http://localhost:8080/depozyt_wiezniow", {method:"GET"})
            const raport = await result.json();

            stworzTabele(raport);
        }
        catch(e){
            console.log("Blad we wczytywaniu depozytu wiezniow!");
        }
    }

async function wczytajWszystkieCele(){
    try{
        const result = await fetch("http://localhost:8080/wszystkie_cele", {method:"GET"})
        const raport = await result.json();

        stworzTabele(raport);
    }
    catch(e){
        console.log("Blad we wczytywaniu cel!");
    }
}


function stworzTabele(raport){
    
    const tableDiv = document.getElementById("tableDiv");
    while(tableDiv.firstChild)
        tableDiv.removeChild(tableDiv.firstChild);

    var tbl = document.createElement("table");
    var tblBody  = document.createElement("tbody");
    var firstLoop = true;
    raport.forEach(t=>{
     
        var row = document.createElement("tr");

        for(var key in t){
            if(firstLoop){
                var cell = document.createElement("th");
                var cellText = document.createTextNode(key);
                cell.appendChild(cellText);
                row.appendChild(cell);
            }else{
        
                var cell = document.createElement("td");
                var cellText = document.createTextNode(t[key]);
                cell.appendChild(cellText);
                row.appendChild(cell);
            }
        }
        firstLoop=false;                
        tblBody.appendChild(row);

        

    })

    tbl.appendChild(tblBody);
    tableDiv.appendChild(tbl);
    
}