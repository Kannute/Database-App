     /* Raport wszystkich więźniów */
    const btnAllPrisoners = document.getElementById("btnAllPrisoners");
    btnAllPrisoners.addEventListener("click", async e=>{
        readAllPrisoners()
        if(!result.success) 
            alert("Failed");
    })
    /* Raport dożywotnich więźniów */
    const btnLifeSentencePrisonsers = document.getElementById("btnLifeSentencePrisonsers");
    btnLifeSentencePrisonsers.addEventListener("click", async e=>{
        readLifeSentencePrisoners()
        if(!result.success) 
            alert("Failed");
    })

    /*Raport wszystkich pracowników*/
    const btnAllEmployees = document.getElementById("btnAllEmployees");
    btnAllEmployees.addEventListener("click", async e=>{
        readAllEmployees()
        if(!result.success) 
            alert("Failed");
    })

    /*Raport depozytu wiezniow*/
    const btnPrisonersDeposit = document.getElementById("btnPrisonersDeposit");
    btnPrisonersDeposit.addEventListener("click", async e=>{
        readPrisonersDeposit()
        if(!result.success) 
            alert("Failed");
    })
    /*Raport wszystkich wolnych cel */
    const btnShowCells = document.getElementById("btnShowCells");
    btnShowCells.addEventListener("click", async e=>{
    readAllCells();
    if(!result.success) 
        alert("Failed");
    })


    //readAllPrisoners();
    async function readAllPrisoners(){
        try{
            const result = await fetch("http://localhost:8080/wszyscy_wiezniowie", {method:"GET"})
            const raport = await result.json();

            generateTable(raport);
        }
        catch(e){
            console.log("Blad we wczytywaniu wszystkich wiezniow!");
        }
    }

    //readLifeSentencePrisoners();
    async function readLifeSentencePrisoners(){
        try{
            const result = await fetch("http://localhost:8080/dozywotni_wiezniowie", {method:"GET"})
            const raport = await result.json();

            generateTable(raport);
        }
        catch(e){
            console.log("Blad we wczytywaniu wszystkich wiezniow z dozywotnim wyrokiem!");
        }
    }

    //readAllEmployees();
async function readAllEmployees(){
        try{
            const result = await fetch("http://localhost:8080/wszyscy_pracownicy", {method:"GET"})
            const raport = await result.json();

            generateTable(raport);
        }
        catch(e){
            console.log("Blad we wczytywaniu pracownikow!");
        }
    }

        //readAllEmployees();
async function readPrisonersDeposit(){
        try{
            const result = await fetch("http://localhost:8080/depozyt_wiezniow", {method:"GET"})
            const raport = await result.json();

            generateTable(raport);
        }
        catch(e){
            console.log("Blad we wczytywaniu depozytu wiezniow!");
        }
    }

async function readAllCells(){
    try{
        const result = await fetch("http://localhost:8080/wszystkie_cele", {method:"GET"})
        const raport = await result.json();

        generateTable(raport);
    }
    catch(e){
        console.log("Blad we wczytywaniu cel!");
    }
}


function generateTable(raport){
    
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