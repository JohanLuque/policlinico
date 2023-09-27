<div class="container-fluid">
    <div class="mb-2 row g-2" id="cardresumen">
         
    </div>
</div>
  
<div class="modal fade" id="modalPagos" tabindex="-1" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Resumen de pago:</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="row mt-2 mb-3">
                <div class="col-md-5">
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
                        <!-- <div class="row g-2 mb-3">
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
                        </div> -->
                        <div class="row g-2 mb-3">
                            <div class="col-md-6">
                                <label for="">Total:</label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control form-control-sm bg-light" id="total" >
                            </div>
                        </div>
                        
                    </div>
                </div>
                </div>
                <div class="col-md-7">
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
                                <button class="btn btn-sm" id="agregarPago" type="button"><i class="fa-solid fa-cart-plus fa-2xl" style="color: #f96f12;"></i></button>

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
                        
                    </div>
                    <div class="row g-2 mb-3">
                        <table id="detallepagos" class="bg-light">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>método</th>
                                    <th>Cantidad</th>
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
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary" id="md-guardar">Guardar</button>
        </div>
      </div>
    </div>
</div>
<script>
const cardresumen = document.querySelector("#cardresumen");

const detalle = document.querySelector("#detallemodal");

const cuerpomodal = detalle.querySelector("#cuerpomodal");
const btnpagos = document.querySelector("#btnpagos");
const detallepagos = document.querySelector("#detallepagos");
const totalMedioPago = document.querySelector("#totalMedioPago");
const totalRestante = document.querySelector("#totalRestante");
const agregarPago = document.querySelector("#agregarPago");
const guardarPago = document.querySelector("#md-guardar");

//modal 
const modal = new bootstrap.Modal(document.querySelector("#modalPagos"));
//Modal RESUMEN DE PAGO
const nombrePaciente = document.querySelector("#nombreCompleto");
const dniPaciente = document.querySelector("#dni");
const edad = document.querySelector("#edad");
const telefono = document.querySelector("#telefono");
const especialidad = document.querySelector("#especialidad");
const totalResumen = document.querySelector("#total");
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
        //console.log(datos);
        cardresumen.innerHTML = ""; // Limpiar el contenido de la fila de tarjetas
        
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
            <div class="col-md-3" >
                <div class="card">
                    <div class="card-content">
                        <div class="card-header" style="background-color: ${color};"></div>
                        <div class="card-body" style="text-align: center;">
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
                        </div>
                    </div>
                </div>
            </div> 
           
            `;
            cardresumen.innerHTML += nuevoCard;
        }
    })
    .catch(error => {
        alert("No se pudieron obtener los datos.");
    });
}

cardresumen.addEventListener("click", (event) => {
    if(event.target.classList[0] === 'pagar'){
        idatencion = parseInt(event.target.dataset.idatencion);
        //console.log(idatencion);

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
                tablaDetalle(idatencion);

            })
        })   
        modal.toggle();
    }
});

function calcularTotalResumen() {
  const tablaFilas = detalle.rows;
  let total = 0;

  for (let i = 1; i < tablaFilas.length; i++) {

    const precioCelda = parseFloat(tablaFilas[i].cells[1].innerText);
    //console.log(precioCelda);
    total += precioCelda;   

  }
  
  totalResumen.value = total.toFixed(2);
}

function agregarPagoTabla(){
    const medioSeleccionado = metodosPago.options[metodosPago.selectedIndex];

    if(medioSeleccionado.value != ""){
        let medioRepetido = false;
        const filaMedios = detallepagos.rows;
        
        for(let i=1; i< filaMedios.length; i++){
            const medioCelda = filaMedios[i].cells[1].innerText;
            if(medioCelda === medioSeleccionado.text){
                medioRepetido = true;
                break;
            }
        }
        //console.log(metodosPago.text);
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
        }
        else{
            toastCheck("No puede repetir dos métodos de pago");
        }        
        calcularRestante();      
        
    }else{
        toast("Por favor seleccione un método de pago");
    }
}

detallepagos.addEventListener("click", (e) => {
    if(e.target.closest(".eliminar")){
        const row = e.target.closest("tr");
        row.remove();
        calcularRestante();
    }
});

function calcularRestante(){
    const filaPagos = detallepagos.rows;
    let restante = totalResumen.value;
    for(let i = 1; i<filaPagos.length; i++){
        const precioCelda = parseFloat(filaPagos[i].cells[2].innerText);
        //console.log(precioCelda);
        restante = restante - precioCelda;
    }
    totalRestante.value = restante;
    //console.log(restante);
}
calcularRestante();



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


listarMetodosPago();
listarCards();
agregarPago.addEventListener("click", () => {
    if(metodosPago.value > 0){
        agregarPagoTabla();
    }
});

guardarPago.addEventListener("click", () => {
    mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
      if(result.isConfirmed){
        registrarPagos();
        cambiarEstadoPago();
      }
    })
});

</script>