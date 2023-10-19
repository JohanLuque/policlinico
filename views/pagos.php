<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <h1 class="text-center">Lista de Atenciones</h1>
        </div>
        <div class="card-body">
            <div class="mb-2 row g-2" id="cardresumen">         
            </div>
        </div>
    </div>
    
</div>
  
<!-- modal de registro de pagos -->
<div class="modal fade" id="modalPagos" tabindex="-1" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-l" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5 fw-bold" id="exampleModalLabel">Pago:</h1>
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
                                            <label for="" id="fechaAtencion"></label>
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <table id="detallemodal" class="bg-light">
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
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Total:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control form-control-sm bg-light" id="total" >
                                        </div>
                                    </div>  
                                    <div class="row g-2 mb-3">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label for="">Método de pago:</label>
                                            </div>
                                            <div class="col-md-4">
                                                <select name="" class="form-select form-select-sm" id="metodosPago"></select>
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" class="form-control form-control-sm bg-light" placeholder="a pagar" id="totalMedioPago" >
                                            </div>
                                            <div class="col-md-2">
                                                <button class="btn btn-sm" id="agregarPago" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #f96f12;"></i></button>
                                            </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-4">
                                            <label for="">Restante:</label>
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control form-control-sm bg-light" readonly  id="totalRestante" >
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <table id="detallepagos" class="table-danger">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>método</th>
                                                    <th>Cantidad</th>
                                                    <th></th>
                                                  </tr>
                                            </thead>
                                            <tbody id="cuerpoPagos">
                                                <!-- traer datos  -->
                                            </tbody>
                                        </table>
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
          <button type="button" class="btn btn-primary "   id="md-guardar">Guardar</button>
        </div>
      </div>
    </div>
</div>
<!-- modal de registro de devoluciones -->
<div class="modal fade" id="modalDevoluciones" tabindex="-1" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-l" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5 fw-bold" id="exampleModalLabel">Devolucion:</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="row mt-2 mb-3">                
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title fw-bolder text-danger text-center mb-4">Resumen de atención</h5>
                            <div class="row g-2 mb-3">                             
                                <div class="col-md-4">
                                    <label class="fw-bolder" for="">Nombre completo: </label>
                                </div>
                                <div class="col-md-8">
                                    <label for="" id="paciente"></label>
                                </div>
                            </div>      
                            <div class="row g-2 mb-3">
                                <div class="col-md-4">
                                    <label class="fw-bolder" for="">DNI:</label>
                                </div>
                                <div class="col-md-8">
                                    <label for="" id="nroDocumento"></label>
                                </div>
                            </div>
                            <div class="row g-2 mb-3">
                                <div class="col-md-4">
                                    <label class="fw-bolder" for="">Especialidad:</label>
                                </div>
                                <div class="col-md-8">
                                    <label for="" id="detEspecialidad"></label>
                                </div>
                            </div> 
                            <div class="row g-2 mb-3">
                                <div class="col-md-4">
                                    <label class="fw-bolder" for="">Total:</label>
                                </div>
                                <div class="col-md-8">
                                    <label for="" id="monto"></label>
                                </div>
                            </div>  
                            <textarea type="text" id="descripcion" class="form-control form-control-sm" cols="10" rows="5" placeholder="Motivo de devolucion"></textarea>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary "   id="devGuardar">Guardar</button>
        </div>
      </div>
    </div>
</div>
<script>
const cardresumen = document.querySelector("#cardresumen");

const detalle = document.querySelector("#detallemodal");

const cuerpomodal = detalle.querySelector("#cuerpomodal");
//const btnpagos = document.querySelector("#btnpagos");
const detallepagos = document.querySelector("#detallepagos");
const totalMedioPago = document.querySelector("#totalMedioPago");
const totalRestante = document.querySelector("#totalRestante");
const agregarPago = document.querySelector("#agregarPago");
const guardarPago = document.querySelector("#md-guardar");

//modal 
const modal = new bootstrap.Modal(document.querySelector("#modalPagos"));
const modalDevolucion = new bootstrap.Modal(document.querySelector("#modalDevoluciones"));
//Modal RESUMEN DE PAGO
const nombrePaciente = document.querySelector("#nombreCompleto");
const dniPaciente = document.querySelector("#dni");
const edad = document.querySelector("#edad");
const telefono = document.querySelector("#telefono");
const especialidad = document.querySelector("#especialidad");
const fechaAtencion = document.querySelector("#fechaAtencion");
const totalResumen = document.querySelector("#total");
const metodosPago = document.querySelector("#metodosPago");
//modal devolucion
const devPaciente = document.querySelector("#paciente");
const devNroDocumento = document.querySelector("#nroDocumento");
const devEspecialidad = document.querySelector("#detEspecialidad");
const devMonto = document.querySelector("#monto");
const devGuardar = document.querySelector("#devGuardar");
const descripcion =document.querySelector("#descripcion");

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
        //console.log(datos);
        cardresumen.innerHTML = ""; // Limpiar el contenido de la fila de tarjetas
        
        datos.forEach(element =>{
            idatencion = element.idAtencion;
            console.log(idatencion);
            let color;
            if(element.estado == 0){
                color = " bg-danger";
                nombreBoton = "Pagar";
                colorBoton = "btn-danger";
                colorFondo = "bg-light-danger";
                clase="pagar"
            }else{
                color = "bg-info";
                nombreBoton = "Devolución";
                colorBoton = "btn-info";
                colorFondo = "bg-light-info";
                clase = "devolucion"
            }

            const nuevoCard = `
            <div class="col-md-3" >
                <div class="card">
                    <div class="card-content">
                        <div class="card-header ${color}" ></div>
                        <div class="card-body ${colorFondo}" style="text-align: center;">
                            <h5>${element.apellidoPaterno} ${element.apellidoMaterno},<br>${element.nombres}</h5>
                            <h6>${element.nombreServicio}</h6>
                            <div class='mt-2 row g-2'>
                                <div class='col-md-6'>
                                    <h6>S/${element.Total}</h6>
                                </div>
                                <div class='col-md-6'>
                                    <button class='btn ${colorBoton} m-1' type='button'>
                                        <a class='${clase}' type='button' style='text-decoration: none;color: white;' data-idatencion='${element.idAtencion}' >${nombreBoton}</a>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
            `;
            cardresumen.innerHTML += nuevoCard;
        })
    })
    .catch(error => {
        alert("No se pudieron obtener los datos.");
    });
}

cardresumen.addEventListener("click", (event) => {
    idatencion = parseInt(event.target.dataset.idatencion);
    if (event.target.classList[0] == 'pagar') {
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
                dniPaciente.innerHTML = element.numeroDocumento;
                edad.innerHTML = element.Edad;
                telefono.innerHTML = element.telefono;
                especialidad.innerHTML = element.nombreServicio;
                fechaAtencion.innerHTML = element.fechaAtencion;
                tablaDetalle(idatencion);
                totalMedioPago.value = 0;
            })
        })   
        modal.toggle();
    }else if(event.target.classList[0] == 'devolucion'){
        const parametros =new URLSearchParams();
        parametros.append("operacion", "traerDatosDevolucion");
        parametros.append("idAtencion", idatencion);

        fetch("../controllers/pago.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos =>{
            datos.forEach(element => {
                console.log(datos);
                devPaciente.innerHTML = element.Paciente;
                devNroDocumento.innerHTML = element.numeroDocumento;
                devEspecialidad.innerHTML = element.Servicio;
                devMonto.innerHTML = element.MontoTotal;
            })
        })
        modalDevolucion.toggle();
    }
});

// suma del total a pagar en detalle atencion
function calcularTotalResumen() {
    const tablaFilas = detalle.rows;
    let total = 0;

    for (let i = 1; i < tablaFilas.length; i++) {

    const precioCelda = parseFloat(tablaFilas[i].cells[1].innerText);
    //console.log(precioCelda);
    total += precioCelda;   
    }

    totalResumen.value = total.toFixed(2);
    totalRestante.value = total;
}

function calcularRestante(){
    const filaPagos = detallepagos.rows;
    let restante = totalResumen.value;
    let totaltablapagos = 0;
    for(let i = 1; i<filaPagos.length; i++){
        const precioCelda = parseFloat(filaPagos[i].cells[2].innerText);
        totaltablapagos +=precioCelda;
        //console.log(precioCelda);
        if(restante >= 0){
            restante = restante - precioCelda;
        }
        
    }
    
    totalRestante.value = restante;
    //console.log(totalRestante.value);
}
function agregarPagoTabla(){
    const montoIngresado = parseFloat(totalMedioPago.value);
    const restante = parseFloat(totalRestante.value);
    if(totalMedioPago.value > 0){  
        const medioSeleccionado = metodosPago.options[metodosPago.selectedIndex];
    
        if(medioSeleccionado.value != ""){
            let medioRepetido = false;
            let totaltablapagos = 0;
            const filaMedios = detallepagos.rows;
            
            for(let i=1; i< filaMedios.length; i++){
                const medioCelda = filaMedios[i].cells[1].innerText;
                const precioCelda = parseFloat(filaMedios[i].cells[2].innerText);              
                if(medioCelda === medioSeleccionado.text){
                    medioRepetido = true;
                    totaltablapagos  +=  precioCelda;                
                    //break;
                    console.log(precioCelda);
                }
                
                
            }
            console.log(totaltablapagos);
            calcularRestante();
            if(montoIngresado > restante){
                toast("excede el monto restante");
            }else{
                if(!medioRepetido){
                    
                    let nuevaFila = `
                    <tr>
                        <td>${medioSeleccionado.value}</td>
                        <td>${medioSeleccionado.text}</td>
                        <td>${totalMedioPago.value}</td>
                        <td>
                            <a class ="eliminar btn btn-sm btn-danger">Eliminar</a>
                        </td>
                    </tr>  
                    `;
                    detallepagos.innerHTML += nuevaFila;
                    totalMedioPago.value = "";
                    listarMetodosPago();
                    calcularRestante();   
                }
                else{
                    toast("No puede repetir dos métodos de pago");
                }
                
            }
        }
     }else{
        toast("Monto inválido");
        totalMedioPago.value = 0;
    }  
    //calcularRestante();
}

detallepagos.addEventListener("click", (e) => {
    if(e.target.closest(".eliminar")){
        const row = e.target.closest("tr");
        row.remove();
        //calcularRestante();
    }
});

//calcularRestante();

function registrarPagos(){
    const filaspagos = detallepagos.rows;
    const promesas = [];
    for (let i = 1; i < filaspagos.length; i++){
        const idmediopago = parseInt(filaspagos[i].cells[0].innerText);
        const monto = parseFloat(filaspagos[i].cells[2].innerText);
        const parametros = new URLSearchParams();
        parametros.append("operacion", "RegistrarPago");
        parametros.append("idatencion", idatencion);
        parametros.append("idMedioPago", idmediopago);
        parametros.append("monto", monto);
        
        const fetchPromesa = fetch("../controllers/pago.php", {
            method: "POST",
            body: parametros
        });
        promesas.push(fetchPromesa);
    }

}

function tablaDetalle(idatencion){
    const parametros2 = new URLSearchParams();
        parametros2.append("operacion", "detalle");
        parametros2.append("idatencion", idatencion);

        fetch("../controllers/detalleServicio.php", {
            method: 'POST',
            body: parametros2
        })
        .then(response => response.json())
        .then(datos => {
            //console.log(datos);
            cuerpomodal.innerHTML = ``;
            datos.forEach(element => {
                
                const datos1 =`
                <tr>
                    <td>${element.descripcion}</td>
                    <td>${element.total}</td>
                </tr>
                `;
            cuerpomodal.innerHTML += datos1;
            })
            calcularTotalResumen();
        })
}

function cambiarEstadoPago(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "cambiarEstado");
    parametros.append("idatencion", idatencion);
    fetch("../controllers/pago.php",{
        method : "POST",
        body: parametros
    })
    .then(response => response.json())
    .then(datos => {  
        toastCheck("estado cambiado");  
        
        listarCards();    
  })
}

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

function GuardarDevolucion(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "registrarDevolucion");
    parametros.append("idAtencion", idatencion);
    parametros.append("descripcion", descripcion.value);
    fetch("../controllers/pago.php",{
        method: "POST",
        body: parametros
    })
    .then(response => response.json())
    .then(datos=>{
        
    })
}

listarMetodosPago();
listarCards();
agregarPago.addEventListener("click", () => {
    if(metodosPago.value > 0 ){
        agregarPagoTabla();
    }else{
        toast("Seleccion un metodo de pago");
    }
});

guardarPago.addEventListener("click", () => {
    mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
      if(result.isConfirmed){
        registrarPagos();
        cambiarEstadoPago();
        modal.toggle();
        
      }
      listarCards();
    })
});

devGuardar.addEventListener("click", GuardarDevolucion);
</script>