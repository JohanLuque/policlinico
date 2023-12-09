<?php require_once 'permisos.php'; ?>
<div class="container-fluid">
    <div class="card">
        <div class="mb-3 row g-2">
            <h1 class="form-label fs-13 text-center text-danger">Sala de espera</h1>  
        </div>
        <div class="card-body">
            <div class="mb-2 row g-2" id="cardListado">         
            </div>
        </div>
    </div>  
</div>

<div class="modal fade" id="modalHC" tabindex="-1" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row mt-2 mb-3">                
                    <div class="col-md-12">
                        <div class="card">
                            <form action="" id="form-hc" class="needs-validation">
                                <div class="card-body">
                                    <h3 class=" fw-bolder text-danger text-center mb-4">HISTORIA CLÍNICA</h3>
                                    <div class="row g-2 mb-2">
                                        <h5 style="text-align: center;" id="nombrepaciente"></h5>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <h5 class="fw-bolder">ENFERMEDAD ACTUAL</h5>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-12">                
                                            <div class="row g-2 mb-3">                             
                                                <div class="col-md-2">
                                                    <label class="fw-bolder" for="">INICIO: </label>
                                                </div>
                                                <div class="col-md-10">
                                                    <input class="form-control form-control-m bg-light" id="mdInicio" type="text" required>
                                                    <div class="invalid-feedback">
                                                        Complete este campo
                                                    </div>   
                                                </div>
                                            </div>
                                        </div> 
                                    </div>   
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-2">
                                            <label class="fw-bolder" for="">CURSO:</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input class="form-control form-control-m bg-light" id="mdCurso" type="text" required>
                                            <div class="invalid-feedback">
                                                Complete este campo
                                            </div> 
                                        </div>
                                    </div>   
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-2">
                                            <label class="fw-bolder" for="">RELATO:</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input class="form-control form-control-m bg-light" id="mdRelato" type="text" required>
                                            <div class="invalid-feedback">
                                                Complete este campo
                                            </div> 
                                        </div>
                                    </div>  
                                    <div class="row g-2 mb-2">
                                        <h5 class="fw-bolder">EXAMEN GENERAL</h5>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-12">
                                            <textarea class="form-control form-control-m" id="examenGeneral" required></textarea>
                                            <div class="invalid-feedback">
                                                Complete este campo
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-2">
                                        <h5 class="fw-bolder">IMPRESIÓN DIAGNOSTICA</h5>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-2">
                                            <label class="fw-bolder" for="">CIE-10:</label>
                                        </div>
                                        <div class="col-md-5">
                                            <input class="form-control form-control-m bg-light" id="cie-10" type="text">
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rbP" value="P">
                                                <label class="form-check-label">P</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rbD"  value="D">
                                                <label class="form-check-label">D</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rbR"  value="R">
                                                <label class="form-check-label">R</label>
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="row g-2 mb-2">
                                        <div class="col-md-2">
                                            <label class="fw-bolder" for="">DESCRIPCIÓN:</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input class="form-control form-control-m bg-light" id="descripcion" type="text">
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-2">
                                        <h5 class="fw-bolder">PROCEDIMIENTO/INTERVENCIÓN</h5>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-12">
                                            <textarea class="form-control" id="procedimiento" required></textarea>
                                            <div class="invalid-feedback">
                                                Complete este campo
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-2">
                                        <h5 class="fw-bolder">TRATAMIENTO</h5>
                                    </div>
                                    <div class="row g-2 mb-2">
                                        <div class="col-md-2">
                                            <label class="fw-bolder" for="">MEDICAMENTO:</label>
                                        </div>
                                        <div class="col-md-4">
                                            <input class="form-control form-control-m bg-light" id="medicamento" type="text">
                                        </div>
                                        <div class="col-md-2">
                                            <label class="fw-bolder" for="">PRESENTACIÓN:</label>
                                        </div>
                                        <div class="col-md-4">
                                            <input class="form-control form-control-m bg-light" id="presentacion" type="text">
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-2">
                                    <div class="col-md-2">
                                            <label class="fw-bolder" for="">DOSIS:</label>
                                        </div>
                                        <div class="col-md-4">
                                            <input class="form-control form-control-m bg-light" id="dosis" type="text">
                                        </div>
                                        <div class="col-md-1">
                                            <label class="fw-bolder" for="">CANTIDAD:</label>
                                        </div>
                                        <div class="col-md-1">
                                            <input type="number" class="form-control form-control-m bg-light" id="cantidad" type="text">
                                        </div>
                                        <div class="col-md-1">
                                            <label class="fw-bolder" for="">DÍAS:</label>
                                        </div>
                                        <div class="col-md-2">
                                            <input class="form-control form-control-m bg-light" id="dias" type="text">
                                        </div>
                                        <div class="col-md-1">
                                            <button class="btn btn-sm" id="agregarTratamiento" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #e66814;"></i></button>
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-2 mt-3">
                                    <table class=" table table-sm" id="tabla-tratamiento">
                                        <thead class="table-info">
                                            <tr>
                                                <th>Medicamento</th>
                                                <th>Presentación</th>
                                                <th>Dosis</th>
                                                <th>Cantidad</th>
                                                <th>Días</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!--Inyecta datos-->
                                        </tbody>
                                        </table>
                                    </div>
                                    <div class="row g-2 mb-2">
                                        <h5 class="fw-bolder">OBSERVACIONES</h5>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-12">
                                            <textarea class="form-control" id="observaciones"></textarea>
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-2">
                                        <h5 class="fw-bolder">DATOS DEL PROFESIONAL</h5>
                                    </div>
                                    <div class="row g-2 mb-2">
                                        <div class="col-md-2">
                                            <label class="fw-bolder" for="">PROFESIONAL:</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input class="form-control form-control-m bg-light" id="" type="text" readonly>
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-2">
                                        <div class="col-md-2">
                                            <label class="fw-bolder" for="">CÓDIGO:</label>
                                        </div>
                                        <div class="col-md-2">
                                            <input class="form-control form-control-m bg-light" id="" type="text" readonly>
                                        </div>
                                        <div class="col-md-1"></div>
                                        <div class="col-md-1">
                                            <label class="fw-bolder" for="">TURNO:</label>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" checked name="RadioOptions" id="rbMañana" value="M">
                                                <label class="form-check-label">M</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="RadioOptions" id="rbTarde"  value="T">
                                                <label class="form-check-label">T</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
    //Modal
    const inicio = document.querySelector("#mdInicio");
    const curso = document.querySelector("#mdCurso");
    const relato = document.querySelector("#mdRelato");
    const examenGeneral = document.querySelector("#examenGeneral");
    const procedimiento = document.querySelector("#procedimiento");
    const observaciones = document.querySelector("#observaciones");
    const nombrepaciente = document.querySelector("#nombrepaciente");
    const btnActualizar = document.querySelector("#md-actualizar");
    const cie10 = document.querySelector("#cie-10");
    const descripcion = document.querySelector("#descripcion");
    const tabla = document.querySelector("#tabla-tratamiento");
    //TRATAMIENTO
    const medicamento = document.querySelector("#medicamento");
    const presentacion = document.querySelector("#presentacion");
    const dosis = document.querySelector("#dosis");
    const cantidad = document.querySelector("#cantidad");
    const dias = document.querySelector("#dias");
    const btnTratamiento = document.querySelector("#agregarTratamiento");
    
    const modalHC = new bootstrap.Modal(document.querySelector("#modalHC"));
    const formHC = document.querySelector("#form-hc");
    const cardListado = document.querySelector("#cardListado");

    let tratamientosAgregados = [];
    function listar(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listaDoctores");

        fetch("../controllers/detalleAtencion.php",{
            method: "POST",
            body:parametros
        })
        .then(response => response.json())
        .then(datos=>{
            console.log("todoo ok",datos)
            datos.forEach(element =>{
                
                const nuevoCard = `
                    <div class="col-md-3" >
                        <div class="card">
                            <div class="card-content">
                                <div class="card-header bg-danger text-center text-white" >${element.numeroAtencion}</div>
                                <div class="card-body bg-light-danger">
                                <h5 style="text-align: center;">${element.ApellidosNombres}</h5>
                                    <div class='mt-2 row g-2'>
                                        <div class='col-md-4'>
                                            <button class='btn btn-danger' type='button'>
                                                <a class='clinica' data-idservicio='${element.idServicio}' data-idatencion='${element.idDetalleAtenciones}' style='text-decoration: none;color: white;' >Imprimir</a>
                                            </button>
                                        </div>
                                        <div class='col-md-3'></div>
                                        <div class='col-md-3 ocultar' style="display: '';">
                                            <button class='btn btn-danger' type='button'>
                                                <a class='historia' data-idservicio='${element.idServicio}' data-idatencion='${element.idDetalleAtenciones}' style='text-decoration: none;color: white;' >Registrar</a>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> 
                `;
                cardListado.innerHTML += nuevoCard;
            })
        })
    }

    let idDetalleModal;
    cardListado.addEventListener("click", (e) => {
        idDetalleModal = parseInt(e.target.dataset.idatencion);
        if(e.target.classList[0] === ("historia")){
        
        const parametros = new URLSearchParams();
        parametros.append("operacion", "obtenerDatos");
        parametros.append("idDetalleAtenciones", idDetalleModal);

        fetch("../controllers/detalleServicio.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            datos.forEach(element =>{
                nombrepaciente.innerHTML=element.ApellidosNombres;
            })
        })
        .catch(error => console.error('Error al obtener detalles de la cita:', error))
        modalHC.toggle();  
    }else if(event.target.classList[0] == 'clinica'){
        console.log(idDetalleModal)
        if(idDetalleModal >0){
            const parametros = new URLSearchParams();
            parametros.append("idDetalleAtenciones", idDetalleModal);
            parametros.append("idHistoria", idDetalleModal);
            parametros.append("idDetalleAtenciones1", idDetalleModal);
            window.open(`../reports/historia.report.php?${parametros}`, '_blank');
        }else{
            console.log(idDetalleModal);
        }
    }
  });

  function validarForm(){
    if(!formHC.checkValidity()){
        event.preventDefault()
        event.stopPropagation()
        formHC.classList.add('was-validated');
    }else{
        agregarDetalleHistoria();
    }
  }
  function agregarDetalleHistoria() {
    const frecuencia = document.querySelectorAll('input[name="inlineRadioOptions"]');
    let valorRadio = '';
    if(descripcion.value.trim() === ""){
        valorRadio;
    }else{
        frecuencia.forEach(radio => {
            if (radio.checked) {
                //console.log(`El radio con id ${radio.id} está seleccionado.`);
                if (radio.id === 'rbP') {
                    valorRadio = 'P';
                } else if (radio.id === 'rbD') {
                    valorRadio = 'D';
                } else if (radio.id === 'rbR') {
                    valorRadio = 'R';
                }else{
                    valorRadio;
                }
            }
        });
    }
    const parametros = new URLSearchParams();

    parametros.append("operacion", "detalleHC");
    parametros.append("idDetalleatencion", idDetalleModal);
    parametros.append("inicio", inicio.value);
    parametros.append("curso", curso.value);
    parametros.append("relato", relato.value);
    parametros.append("procedimiento", procedimiento.value);
    parametros.append("observaciones", observaciones.value);
    parametros.append("examenGeneral", examenGeneral.value);
    parametros.append("frecuencia", valorRadio);


    fetch("../controllers/historiaClinica.php", {
        method: "POST",
        body: parametros
    })
        .then(response => response.json())
        .then(datos => {
            if (datos.status) {
                registrarDetalleTratamiento();
                toastCheck("Guardado correctamente");
                modalHC.toggle();
                formHC.reset();
                registrarEnfermedad();
                limpiarTabla();
            } else {
                alert(datos.mensaje);
            }
        })
        .catch(error => {
            toast("Error al guardar");
        });
}

  let idEnfermedad;
  function consultarEnfermedad(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "obtenerEnfermedad");
    parametros.append("codigoCie_10",cie10.value);
    fetch("../controllers/historiaClinica.php",{
        method : "POST",
        body: parametros
    })
    .then(response => response.json())
    .then(datos => {
        if(datos.length>0){
            datos.forEach(element =>{
            idEnfermedad = element.idEnfermedad;
            console.log(idEnfermedad);
            descripcion.value = element.descripcion;
        });
        }
    })
    .catch(error => {
        toast("Error al guardar");
    });
  }

function registrarDetalleTratamiento(){
    const filas = tabla.rows;
    const promesas = [];
    for(let i = 1; i < filas.length; i++){
        const medicamentoTabla = filas[i].cells[0].innerText;
        const presentacionTabla = filas[i].cells[1].innerText;
        const dosisTabla = filas[i].cells[2].innerText;
        const cantidadTabla = filas[i].cells[3].innerText;
        const diasTabla = filas[i].cells[4].innerText;
        const parametros = new URLSearchParams();
        parametros.append("operacion", "detalleTratamiento");
        parametros.append("idDetalleAtencion", idDetalleModal);
        parametros.append("medicamento", medicamentoTabla);
        parametros.append("presentacion", presentacionTabla);
        parametros.append("cantidad", cantidadTabla);
        parametros.append("dosis", dosisTabla);
        parametros.append("dias", diasTabla);

        const fetchPromesa = fetch("../controllers/historiaClinica.php",{
            method: "POST",
            body: parametros
        });
        promesas.push(fetchPromesa);
    }
}
function limpiarTabla(){
    const datosFilas = tabla.querySelectorAll('tbody tr');
    datosFilas.forEach((filas)=>{
        filas.remove();
    });
}

function validarTratamientos(campo) {
    return campo.trim() === ''; 
}

function agregarTratamiento(){
    if(
        validarTratamientos(medicamento.value) ||
        validarTratamientos(presentacion.value) ||
        validarTratamientos(dosis.value) ||
        validarTratamientos(cantidad.value) ||
        validarTratamientos(dias.value)
    ){
        toast("Por favor, complete todos los campos.");
        return;
    }

    const campos = [medicamento, presentacion, dosis, cantidad, dias];

    for (const campo of campos) {
        campo.value = campo.value.trim(); 
    }
    const nuevoTratamiento = {
        medicamento: medicamento.value,
        presentacion: presentacion.value,
        dosis: dosis.value,
        cantidad: cantidad.value,
        dias: dias.value
    };

    const tratamientoDuplicado = tratamientosAgregados.find(tratamiento => (
        tratamiento.medicamento == nuevoTratamiento.medicamento
    ));

    if (tratamientoDuplicado) {
        notificar('Alerta','Este tratamiento ya ha sido agregado.', 5);
        return;
    }

    tratamientosAgregados.push(nuevoTratamiento);

    let nuevaFila = `
        <tr>
        <td>${nuevoTratamiento.medicamento}</td>
        <td>${nuevoTratamiento.presentacion}</td>
        <td>${nuevoTratamiento.dosis}</td>
        <td>${nuevoTratamiento.cantidad}</td>
        <td>${nuevoTratamiento.dias}</td>
        </tr>
    `;
    tabla.innerHTML += nuevaFila;

    //Limpiar campos 
    medicamento.value = "";
    presentacion.value = "";
    dosis.value = "";
    cantidad.value = "";
    dias.value = "";    
}

  function registrarEnfermedad(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "agregarEnfermedad");
    parametros.append("idEnfermedad",idEnfermedad);
    parametros.append("idDetalleAtencion",idDetalleModal);
    fetch("../controllers/historiaClinica.php",{
        method : "POST",
        body: parametros
    })
    .then(response=> response.json())
    .then(datos => {
        console.log("guardado correctamente");
    })
    .catch(error => {
        alert("Error al guardar")
    })
  }
    cie10.addEventListener("keypress", (evt) => {
        if (evt.charCode === 13){
            consultarEnfermedad();
            if (descripcion.value) {
                toast("Por favor, seleccione una frecuencia.");
                return;
            }
        }
    });
    listar();
    btnTratamiento.addEventListener("click",agregarTratamiento);
    btnActualizar.addEventListener("click", () =>{
        mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
                if(result.isConfirmed){
                    validarForm();
                    // const btnHistoria = document.querySelectorAll('.ocultar');
                    // btnHistoria.forEach(boton => {
                    // boton.style.display = 'none';
                    // });
                }
            })
    });
</script>