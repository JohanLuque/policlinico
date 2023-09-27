<div class="container-fluid">
    <div class="mb-2 row g-2" >
        <div class="col-md-3">
            <div class="card" id="cardpagos">
                <div class="card-content">
                    <div class="card-header" style="background-color: red;"></div>
                    <div class="card-body" id="cardRow" style="text-align: center;">
                        
                    </div>
                </div>
            </div>
        </div>  
    </div>
</div>
  
<div class="modal fade" id="modalPagos" tabindex="-1" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Resumen de pago:</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="row mt-2 mb-3">
                <div class="row mt-2 mb-3">
                    <div class="col-md-12">
                        <!-- <div class="row g-2 mb-3">
                            <h1>Resumen de pago:</h1>
                        </div> -->
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
                                <label for="">DNI:</label>
                            </div>
                            <div class="col-md-6">
                                <label for="" id="dni"></label>
                            </div>
                        </div>   
                        <div class="row g-2 mb-3">
                            <div class="col-md-6">
                                <label for="">Edad:</label>
                            </div>
                            <div class="col-md-6">
                                <label for="" id="edad"></label>
                            </div>
                        </div>  
                        <div class="row g-2 mb-3">
                            <div class="col-md-6">
                                <label for="">Teléfono:</label>
                            </div>
                            <div class="col-md-6">
                                <label for="" id="telefono"></label>
                            </div>
                        </div> 
                        <div class="row g-2 mb-3">
                            <div class="col-md-6">
                                <label for="">Especialidad:</label>
                            </div>
                            <div class="col-md-6">
                                <label for="" id="especialidad"></label>
                            </div>
                        </div> 
                        <div class="row g-2 mb-3">
                            <table id="detallemodal">
                                <thead>
                                    <tr>
                                        <th>Servicio</th>
                                        <th>Total</th>
                                      </tr>
                                </thead>
                                <tbody id="cuerpomodal">
                                    <!-- traer datos  -->
                                </tbody>
                            </table>
                        </div> 
                        <div class="row g-2 mb-3">
                            <div class="col-md-6">
                                <label for="">Sub Total:</label>
                            </div>
                            <div class="col-md-6">
                                <label for="" id="subtotal"></label>
                            </div>
                        </div>
                        <div class="row g-2 mb-3">
                            <div class="col-md-6">
                                <label for="">I.G.V:</label>
                            </div>
                            <div class="col-md-6">
                                <label for="" id="igv"></label>
                            </div>
                        </div>
                        <div class="row g-2 mb-3">
                            <div class="col-md-6">
                                <label for="">Total:</label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control form-control-sm bg-light" id="total" >
                            </div>
                        </div>
                        <div class="row g-2 mb-3">
                            <div class="col-md-6">
                                <label for="">Metodo de pago:</label>
                            </div>
                            <div class="col-md-6">
                                <select name="" class="form-select form-select-sm" id="metodosPago"></select>
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
const carPagos = document.querySelector("#cardpagos");
const cardRow = carPagos.querySelector("#cardRow");

const detalle = document.querySelector("#detallemodal");
const cuerpomodal = detalle.querySelector("#cuerpomodal");
const btnpagos = document.querySelector("#btnpagos");

//modal 
const modal = new bootstrap.Modal(document.querySelector("#modalPagos"));
//Modal RESUMEN DE PAGO
const nombrePaciente = document.querySelector("#nombreCompleto");
const dniPaciente = document.querySelector("#dni");
const edad = document.querySelector("#edad");
const telefono = document.querySelector("#telefono");
const especialidad = document.querySelector("#especialidad");
const total = document.querySelector("#total");
const metodosPago = document.querySelector("#metodosPago");

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
            console.log(idatencion);
            let color;
            if(element.estado == 0){
                color = "red";
            }else{
                color = "green";
            }
            const nuevoCard = `
                        <h5>${element.apellidoPaterno} ${element.apellidoMaterno},<br>${element.nombres}</h5>
                        <h6>${element.nombreServicio}</h6>
                        <div class='mt-2 row g-2'>
                            <div class='col-md-6'>
                                <h6>S/${element.Total}</h6>
                            </div>
                            <div class='col-md-6'>
                                <button class='pagar' type='button' data-idatencion='${element.idAtencion}' style='background-color: orange; color:white;'>Pagar</button>
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

cardRow.addEventListener("click", (event) => {
    if(event.target.classList[0] === 'pagar'){
        idatencion = parseInt(event.target.dataset.idatencion);
        console.log(idatencion);

        const parametros = new URLSearchParams();
        parametros.append("operacion", "resumen");
        parametros.append("idatencion", idatencion);

        fetch("../controllers/detalleServicio.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            datos.forEach(element => {
                console.log(element.nombres);
                nombrePaciente.innerHTML= element.nombres + ", "+ element.apellidoPaterno+" "+element.apellidoMaterno;
                dni.innerHTML = element.numeroDocumento;
                edad.innerHTML = element.Edad;
                telefono.innerHTML = element.telefono;
                especialidad.innerHTML = element.nombreServicio;

            })
        })

        const parametros2 = new URLSearchParams();
        parametros2.append("operacion", "detalle");
        parametros2.append("idatencion", idatencion);

        fetch("../controllers/detalleServicio.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            console.log(datos);
            cuerpomodal.innerHTML = ``;
            datos.forEach(element => {
                
                const datos1 =`
                <tr>
                    <td>${element.idDetalleServicio}</td>
                    <td>${element.descripcion}</td>
                </tr>
                `;
            cuerpomodal.innerHTML += datos1;
            })
        })


        modal.toggle();
    }
});

// Agrega un manejador de eventos clic a los botones "Pagar"
// cardRow.addEventListener("click", (event) => {
//   const target = event.target;

//   if (target.classList.contains("btnpagos")) {
//     const modalId = target.getAttribute("data-target");
//     const modal = document.querySelector(modalId);
//     if (modal) {
//       $(modal).modal("show"); 
//     }
//   }
// });

function pagar(){
    const paramettro = new URLSearchParams();
    paramettro.append("operacion", "pagar");
    paramettro.append("idatencion", idatencion);
}

function listarMetodosPago(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listar");
    fetch("../controllers/mediosPago.php",{
        method : "POST",
        body: parametros
    })
    .then(response => response.json())
    .then(datos => {
        metodosPago.innerHTML = "<option value=''>Seleccione</option>";
        datos.forEach(element => {
        const optionTag = document.createElement("option");
        optionTag.value = element.idMedioPago;
        optionTag.text = element.nombrePago;
        metodosPago.appendChild(optionTag);
    });
  })
}


listarMetodosPago();
listarCards();
</script>