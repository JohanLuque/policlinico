<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <h1 class="text-center">Lista de Espera</h1>
        </div>
        <div class="card-body">
            <div class="mb-2 row g-2" id="cardAtencion">         
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalAtenciones" tabindex="-1" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-l" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="row mt-2 mb-3">                
                <div class="col-md-12">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title fw-bolder text-danger text-center mb-4">Resumen de atención</h5>
                            <div class="row mt-2 mb-3">
                                <div class="col-md-12">                                    
                                    <div class="row g-2 mb-3">                             
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Nombre completo: </label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="nombreCompleto"></label>
                                        </div>
                                    </div>      
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">DNI:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="dni"></label>
                                        </div>
                                    </div>   
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Edad:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="edad"></label>
                                        </div>
                                    </div>  
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Teléfono:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="telefono"></label>
                                        </div>
                                    </div> 
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Especialidad:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="especialidad"></label>
                                        </div>
                                    </div> 
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Fecha Atención:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="date" class="form-control form-control-sm" id="fechaAtencion" >
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <table id="detallemodalEspera" class="">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Servicio</th>
                                                    <th>Total</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="cuerpomodal">
                                                <!-- traer datos  -->
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Total:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control form-control-sm bg-light" id="total" readonly>
                                        </div>
                                    </div>  
                                    
                                </div>                      
                            </div>
                            

                        </div>
                    </div>
                </div>
                
                
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary "   id="md-actualizar">Actualizar</button>
        </div>
      </div>
    </div>
</div>

<script>

//MODAL
const modalAtencion = new bootstrap.Modal(document.querySelector("#modalAtenciones"));
const detalle = document.querySelector("#detallemodalEspera");
const cuerpomodal = document.querySelector("#cuerpomodal");
const totalTabla = document.querySelector("#total");
const btActualizar = document.querySelector("#md-actualizar");
//CARDS
const cardAtencion = document.querySelector("#cardAtencion");
const nombrePaciente = document.querySelector("#nombreCompleto");
const dniPaciente = document.querySelector("#dni");
const edad = document.querySelector("#edad");
const telefono = document.querySelector("#telefono");
const especialidad = document.querySelector("#especialidad");
const fechaAtencion = document.querySelector("#fechaAtencion");
let precio = 0;
let idatencion;
let genero= "";
function listarCardsAtencion(){
    const parametros = new URLSearchParams();
    parametros.append("operacion","listarAtenciones");

    fetch("../controllers/atencion.php", {
      method: "POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos => {
      cardAtencion.innerHTML= "";
      datos.forEach(element => {
        idatencion = element.idAtencion;
        console.log(datos);
        const nuevoCard = `
        <div class="col-md-3" >
                <div class="card">
                    <div class="card-content">
                        <div class="card-header bg-info"></div>
                        <div class="card-body bg-light-info" style="text-align: center;">
                            <h5>${element.apellidoPaterno} ${element.apellidoMaterno},<br>${element.nombres}</h5>
                            <div class='mt-2 row g-2'>
                                <div class='col-md-6'>
                                    <h6>${element.nombreServicio}</h6>
                                </div>
                                <div class='col-md-6'>
                                    <h6>S/${element.Total}</h6>
                                </div>
                            </div>
                            <div class"row mt-2 g-2">
                                <button class='btn btn-info  m-1' type='button'>
                                    <a class="resume" data-idservicio='${element.idServicio}' data-idatencion='${element.idAtencion}' style='text-decoration: none;color: white;'>Editar</a>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        `;
        cardAtencion.innerHTML +=nuevoCard;
      });
    })
  }
  let idServicioModal;
  let idatencionmodal;
  cardAtencion.addEventListener("click", (e) => {
    if(e.target.classList[0] === ("resume")){
        idatencionmodal = parseInt(e.target.dataset.idatencion);
        idServicioModal = e.target.dataset.idservicio;
        console.log(idServicioModal);
        const parametros = new URLSearchParams();
        parametros.append("operacion", "resumen");
        parametros.append("idatencion", idatencionmodal);

        fetch("../controllers/detalleServicio.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {

            datos.forEach(element => {
                console.log(element);
                nombrePaciente.innerHTML= element.apellidoPaterno+" "+element.apellidoMaterno+ ", " +element.nombres;
                dniPaciente.innerHTML = element.numeroDocumento;
                edad.innerHTML = element.Edad;
                telefono.innerHTML = element.telefono;
                especialidad.innerHTML = element.nombreServicio;
                //const inputFecha = document.getElementById('inputFecha');
                fechaAtencion.value = element.fechaAtencion;
                //fechaAtencion.innerHTML = element.fechaAtencion;
                detalleServicios(idatencionmodal);
                //listarServiciosFiltro(idServicioModal);
                //totalMedioPago.value = 0;
            })
        })
        .catch(error => console.error('Error al obtener detalles de la cita:', error))
        modalAtencion.toggle();  
    }
  });

function validarFecha(){
    const fechaActual = new Date().toISOString().split('T')[0];
    const fechaIngresada = fechaAtencion.value;
    const fechaLimite = new Date();
    fechaLimite.setDate(fechaLimite.getDate() + 15);
    const fechaLimiteISO = fechaLimite.toISOString().split('T')[0];

    if(fechaIngresada < fechaActual){
        notificar("POLICLINICO SOLIDARIO CHINCHA", "No puedes registrar fechas anteriores al día actual", 3000);
    }else if(fechaIngresada > fechaLimiteISO){
    notificar("POLICLINICO SOLIDARIO CHINCHA", "No puedes registrar fechas que estén más de 15 días en el futuro.", 3000);
    
   }else{
    editarFecha();
   }
}

function editarFecha(){
    const parametros = new URLSearchParams();
    parametros.append("operacion","editarFechaAtencion");
    parametros.append("idatencion", idatencionmodal);
    parametros.append("fechaAtencion", fechaAtencion.value);
    fetch("../controllers/atencion.php",{
        method: 'POST',
        body: parametros
    })
    .then(response => response.json())
    .then(datos => {
        console.log("prueba");
    })
}

  function calcularTotal(){
    const filas = detalle.rows;
    let montoTotal = 0;

    for(let i =1; i < filas.length; i++){

        const precioCeldas = parseFloat(filas[i].cells[2].innerText);
        console.log(precioCeldas);
        montoTotal += precioCeldas;
    }
    totalTabla.value = montoTotal.toFixed(2);
    console.log(montoTotal.toFixed(2));
}
function detalleServicios(idatencionmodal){
    const parametros = new URLSearchParams();
    parametros.append("operacion","detalle");
    parametros.append("idatencion", idatencionmodal);

    fetch("../controllers/detalleServicio.php",{
        method: 'POST',
        body: parametros
    })
    .then(response => response.json())
    .then(datos => {
        console.log(datos);
        cuerpomodal.innerHTML = ``;
            datos.forEach(element => {
                
                const datos =`
                <tr>
                    <td>${element.idservicios_detalle}</td>
                    <td>${element.descripcion}</td>
                    <td>${element.total}</td>
                </tr>
                `;
            cuerpomodal.innerHTML += datos;
            })
        calcularTotal();
    })
}
listarCardsAtencion();
btActualizar.addEventListener("click",()=>{
    mostrarPregunta("ACTUALIZAR", "¿Está seguro de actualizar?").then((result) => {
      if(result.isConfirmed){
        validarFecha();
        modalAtencion.toggle();
      }
      listarCardsAtencion();
    })
})
</script>