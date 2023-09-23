<div class="container-fluid">
    <div class="mb-2 row g-2" id="cardRow">
    </div>
</div>
  
  <!-- Modal -->
  

<script>
const cardRow = document.querySelector("#cardRow");
const btnpagos = document.querySelector("#btnpagos");

let idatencion;
function listarCards(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listarAtenciones");

    fetch("../controllers/atencion.php", {
        method: "POST",
        body: parametros
    })
    .then(response => response.json())
    .then(datos => {
        console.log(datos);
        cardRow.innerHTML = ""; // Limpiar el contenido de la fila de tarjetas
        
        for(let i = datos.length - 1; i >= 0; i--){
            const element = datos[i];
            idatencion = element.idAtencion;
            let color;
            if(element.estado == 0){
                color = "red";
            }else{
                color = "green";
            }
            const nuevoCard = `
            <div class="col-md-3">
                <div class="card">
                    <div class="card-content">
                        <div class="card-header" style="background-color: ${color};"></div>
                        <div class="card-body" style="text-align: center;">
                            <h5>${element.apellidoPaterno} ${element.apellidoMaterno},<br>${element.nombres}</h5>
                            <h6>${element.nombreServicio}</h6>
                            <div class="mt-2 row g-2">
                                <div class="col-md-6">
                                    <h6>S/${element.Total}</h6>
                                </div>
                                <div class="col-md-6">
                                    <button class="btn btn-sm" id="btnpagos" type="button" data-toggle="modal" data-target="#modalPagos" style="background-color: orange; color:white;">Pagar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
            `;
            cardRow.innerHTML += nuevoCard;
        }
    })
    .catch(error => {
        alert("No se pudieron obtener los datos.");
    });
}

function pagar(){
    const paramettro = new URLSearchParams();
    paramettro.append("operacion", "pagar");
    paramettro.append("idatencion", idatencion);
}


listarCards();
</script>