btnSubmit = document.getElementById("submitBtn");
btnSubmit.addEventListener("click", async e=> {
                   //const jsonRequest = {} /TO DO JAK POBIERAC WARTOSCI Z FORMULARZA??? !!!!!!!!!!!!!!!!
                    const jsonRequest = document.getElementById("formularz");
                    let result = await fetch("http://localhost:8080/wpis_wieznia", {method: "POST", 
                    headers: {"content-type": "application/json"}, body: JSON.stringify(jsonRequest) })
                    result = await result.json();
                
                    if (!result.success)  alert("FAILED! ")


async function wpisz_wieznia(){
    try{
        const result = await fetch("http://localhost:8080/wpis_wieznia", {method:"POST"})
        const raport = await result.json();
       
    }
    catch(e){
            console.log("Blad we wczytywaniu wszystkich wiezniow!");
    }
}