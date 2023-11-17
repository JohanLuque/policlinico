<?php require_once 'permisos.php'; ?>
<div class="row mt-2 mb-3">                
    <div class="col-md-4">
        <div class="card">
            <form id="form-gastos" class="needs-validation">
                <div class="card-body">
                    <div class="card-header bg-white">
                        <h1 class="text-center text-danger">Gastos</h1>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control border " id="dni" placeholder="N° Documento" maxlength="10" type="tel" required>
                        <label for="">
                            <i class="ti ti-user me-2 fs-4"></i>
                            N° Documento
                        </label>
                        <div class="invalid-feedback">
                            Complete este campo para continuar
                        </div>  
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control border bg-light"  placeholder="Nombre Completo" id="nombre" type="text"  readonly>
                        <label for="">
                            <i class="ti ti-user me-2 fs-4"></i>
                            Nombre Completo
                        </label> 
                    </div>
                    <div class="row g-2 mb-3">
                        <label class="fw-bolder text-dark" for="">Método de pago:</label>                        
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-md-8">
                            <select name="" class="form-select border " id="metodosPago" required></select>
                            <div class="invalid-feedback">
                            Complete este campo para continuar
                            </div>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control border" placeholder="monto" id="monto" required>
                            <div class="invalid-feedback">
                            Complete este campo para continuar
                            </div>
                        </div>
                    </div>
                    <div class="row g-2 mb-3">
                        <label class="fw-bolder text-dark" for="">Descripcion:</label>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <textarea type="text" id="descripcion" class="form-control border " cols="10" rows="5" required></textarea>
                            <div class="invalid-feedback">
                            Complete este campo para continuar
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3 align-items-center">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <button type="button" class="btn btn-danger font-medium rounded-pill px-4" id="guardar">
                                <div class="d-flex align-items-center">
                                    <i class="ti ti-send me-2 fs-4"></i>
                                    Guardar
                                </div>
                            </button>
                        </div>
                        <div class="col-md-4"></div>

                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="col-md-8">
        <div class="card">
            <div class="card-body">
                <h1 class="text-center text-danger">Lista de gastos por dia</h1>
                <div class="row mt-5">
                    <div class="col-md">
                        <table class=" table rounded-2" id="tabla-lista-gastos">
                        <colgroup>
                            <col width="10%"> <!-- # -->
                            <col width="35%"> <!-- descripcion-->
                            <col width="10%"> <!-- monto-->
                            <col width="20%"> <!-- fechaHora-->
                            <col width="10%"> <!-- persona-->
                            <col width="15%"> <!-- medio gasto-->
                        </colgroup>
                        <thead class="table-danger">
                            <tr>
                            <th>#</th>
                            <th>Descripción</th>
                            <th>Monto</th>
                            <th>Fecha/Hora</th>
                            <th>Persona</th>
                            <th>Medio P.</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--Inyecta datos-->
                        </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>        
    </div>
</div>

<script> 
    const metodosPago = document.querySelector("#metodosPago");
    const monto = document.querySelector("#monto");
    const descripcion = document.querySelector("#descripcion");
    const btGuardar = document.querySelector("#guardar");
    const btCancelar = document.querySelector("#cancelar");
    const dni = document.querySelector("#dni");    
    const nombrePersona = document.querySelector("#nombre");   
    let idPersona = 0;
    // tabla
    const tabla = document.querySelector("#tabla-lista-gastos");
    const cuerpoTabla = document.querySelector("tbody");
    const form = document.querySelector("#form-gastos");
    //capturando ingresos;
    let totalingresos;

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
    
    function ingresos(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "ingresos");
        fetch("../controllers/pago.php", {
            method : "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos =>{
            if(datos.length){
                datos.forEach(element => {
                    if(element.MontoTotal == null){
                        totalingresos = 0;
                    }else{
                        totalingresos =  element.MontoTotal;
                    }
                    console.log(totalingresos);
                
                })
            }
        })
    }

let cantmontoMedioPago;
function montoMedioPago(){
    const mediopago = metodosPago.options[metodosPago.selectedIndex];    
    const parametros = new URLSearchParams();
    parametros.append("operacion" , "montoMedioPago");
    parametros.append("idmedio" , mediopago.value);

    fetch("../controllers/pago.php",{
        method : "POST",
        body: parametros
    })
    .then(response => response.json())
    .then(datos => {
        datos.forEach(element => {
            const gasto = parseFloat(monto.value);
            if(mediopago.value == 1){
                cantmontoMedioPago = element.total;
                if(gasto <= cantmontoMedioPago){
                    console.log("yape");
                    registrarGasto();
                }else{
                    toast("Monto insuficiente en YAPE");
                }
            }else if (mediopago.value == 2){
                cantmontoMedioPago = element.total;
                if(gasto <= cantmontoMedioPago){
                    console.log("TRANSFERENCIA");
                    registrarGasto();
                }else{
                    toast("Monto insuficiente en TRANSFERENCIA");
                }
            }else if (mediopago.value == 3){
                cantmontoMedioPago = element.total;
                if(gasto <= cantmontoMedioPago){
                    console.log("EFECTIVO");
                    registrarGasto();
                }else{
                    toast("Monto insuficiente en EFECTIVO");
                }
            }else if (mediopago.value == 4){
                cantmontoMedioPago = element.total;
                if(gasto <= cantmontoMedioPago){
                    console.log("PLIN");
                    registrarGasto();
                }else{
                    toast("Monto insuficiente en PLIN");
                }
            }else if (mediopago.value == 5){
                cantmontoMedioPago = element.total;
                if(gasto <= cantmontoMedioPago){
                    console.log("POS");
                    registrarGasto();
                }else{
                    toast("Monto insuficiente en POS");
                }
            }
        });
    })
}

function validarMontoMP(){
    if(metodosPago.value > 0){
        montoMedioPago();
    }
}


    function consultarPaciente(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "getData");
        parametros.append("numeroDocumento", dni.value);
        fetch("../controllers/persona.php", {
            method : "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            if(datos.length>0){

            datos.forEach(element => {
                idPersona = element.idPersona;
                nombre.value = element.ApellidosNombres;
            });
            }else{
                console.log("no hay")
            }
        })
    }
    //ingresos();
    function registrarGasto() {
        const parametros = new URLSearchParams();
        parametros.append("operacion", "registrarGasto");
        parametros.append("idMedioPago", metodosPago.value);
        parametros.append("descripcionGasto", descripcion.value);
        parametros.append("montoGasto", monto.value);
        parametros.append("idPersona", idPersona);

        fetch("../controllers/gasto.php", {
            method: "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            if (datos) {
                reset();
                form.reset();
                toastCheck("Guardado Correctamente");
                // Después de guardar con éxito, actualiza la tabla
                listarGastosTabla();
                // totalingresos = totalingresos - monto.value;
                // console.log(totalingresos);
                //ingresos();

            } else {
                console.log("Algo salió mal");
            }
        })
        .catch(error => {
            console.log("Error al guardar");
        })
    }

    function listarGastosTabla() {
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarGastos");

        fetch("../controllers/gasto.php", {
            method: "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            let nro = 1;
            cuerpoTabla.innerHTML = ``;
            datos.forEach(element => {
                const fila =
                    `
                    <tr>
                        <td>${nro}</td>
                        <td>${element.descripcionGasto}</td>
                        <td>${element.montoGasto}</td>
                        <td>${element.fechaHoraGasto}</td>
                        <td>${element.personas}</td>
                        <td>${element.nombrePago}</td>
                    </tr>
                    `;
                cuerpoTabla.innerHTML += fila;
                nro +=1;
            })
        })
    }

    // function validarGasto(){
    //     const gasto = parseFloat(monto.value);
        
    //     if(gasto > totalingresos){
    //         toast("El monto ingresado no puede ser mayor al ingreso");
    //     }else if(gasto < 0){
    //         toast("El monto es inválido");
    //     }else{
    //         validarMontoMP();

    //     }
    // }
    
    function validar(){
        if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
            form.classList.add('was-validated');
        }else{
            mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
                if(result.isConfirmed){
                    validarMontoMP();
                }
            })
        }
    }

    function reset(){
       monto.value = null;
       descripcion.value = null;
       metodosPago.selectedIndex = 0;
    }

    listarMetodosPago();
    listarGastosTabla();
    btGuardar.addEventListener("click", validar);
    //btCancelar.addEventListener("click", reset);
    dni.addEventListener("keypress", (evt) => {
        if (evt.charCode == 13) consultarPaciente();
    });

</script>