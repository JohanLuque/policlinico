<div class="container-fluid">
    <div class="mb-2 row g-2" id="cardRow">
    </div>
</div>
  
<div class="modal fade" id="modalPagos" tabindex="-1"  aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Paciente</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="row mt-2 mb-3">
                <div class="row mt-2 mb-3">
                    <div class="col-md-12">
                        <div class="row g-2 mb-3">
                            <h1>Resumen de pago:</h1>
                        </div>
                        <div class="row g-2 mb-3"> 
                            <div class="col-md-6">
                                <label for="">Nombre completo: </label>
                            </div>
                            <div class="col-md-6">
                                <label for="" id="nombreCompleto"></label>
                            </div>
                        </div>      
                        <div class="row g-2 mb-3">
                            <div class="col-md-6">
                                
                            </div>
                        </div>    
                    </div>
                  </div>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary" id="md-guardar">Guardar</button>
        </div>
      </div>
    </div>
</div>
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
                                    <button class="btn btn-sm btnpagos" id="btnpagos"  type="button" data-toggle="modal" data-target="#modalPagos" style="background-color: orange; color:white;">Pagar</button>
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

// Agrega un manejador de eventos clic a los botones "Pagar"
cardRow.addEventListener("click", (event) => {
  const target = event.target;

  if (target.classList.contains("btnpagos")) {
    // Cuando se hace clic en un botón "Pagar"
    // Abre el modal correspondiente
    const modalId = target.getAttribute("data-target");
    const modal = document.querySelector(modalId);
    if (modal) {
      $(modal).modal("show"); // Utilizamos jQuery para abrir el modal
    }
  }
});

function pagar(){
    const paramettro = new URLSearchParams();
    paramettro.append("operacion", "pagar");
    paramettro.append("idatencion", idatencion);
}



listarCards();
</script>