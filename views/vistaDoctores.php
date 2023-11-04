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
                            <form action="" id="form-hc">
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
                                                    <input class="form-control form-control-m bg-light" id="mdInicio" type="text">
                                                </div>
                                            </div>
                                        </div> 
                                    </div>   
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-2">
                                            <label class="fw-bolder" for="">CURSO:</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input class="form-control form-control-m bg-light" id="mdCurso" type="text">
                                        </div>
                                    </div>   
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-2">
                                            <label class="fw-bolder" for="">RELATO:</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input class="form-control form-control-m bg-light" id="mdRelato" type="text">
                                        </div>
                                    </div>  
                                    <div class="row g-2 mb-2">
                                        <h5 class="fw-bolder">EXAMEN GENERAL</h5>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-12">
                                            <textarea class="form-control form-control-m" id="examenGeneral"></textarea>
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
                                                <input class="form-check-input" type="radio" checked name="inlineRadioOptions" id="rbP" value="P">
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
                                            <textarea class="form-control" id="procedimiento"></textarea>
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-2">
                                        <h5 class="fw-bolder">TRATAMIENTO</h5>
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

    const modalHC = new bootstrap.Modal(document.querySelector("#modalHC"));
    const formHC = document.querySelector("#form-hc");
    const cardListado = document.querySelector("#cardListado");
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
                                <div class="card-body bg-light-danger" style="text-align: center;">
                                <h5>${element.ApellidosNombres}</h5>
                                    <div class='mt-2 row g-2'>
                                        <div class='col-md-6'>
                                        </div>
                                        <div class='col-md-6'>
                                            <button class='btn m-1 btn-danger' type='button'>
                                                <a class='historia' data-idservicio='${element.idServicio}' data-idatencion='${element.idDetalleAtenciones}' style='text-decoration: none;color: white;' >ver</a>
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
    if(e.target.classList[0] === ("historia")){
        idDetalleModal = parseInt(e.target.dataset.idatencion);
        const parametros = new URLSearchParams();
        parametros.append("operacion", "resumen");
        parametros.append("idatencion", idDetalleModal);

        fetch("../controllers/detalleServicio.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            datos.forEach(element =>{
                nombrepaciente.innerHTML=element.apellidoPaterno+" "+element.apellidoMaterno+ ", " +element.nombres;
            })
        })
        .catch(error => console.error('Error al obtener detalles de la cita:', error))
        modalHC.toggle();  
    }
  });
  function agregarDetalleHistoria(){
    const frecuencia = document.querySelector('input[name="inlineRadioOptions"]:checked');
    if(!frecuencia){
        alert("Por favor, seleccione una frecuencia.");
        return;
    }
    const parametros = new URLSearchParams();
    parametros.append("operacion","detalleHC");
    parametros.append("idDetalleatencion", idDetalleModal);
    parametros.append("inicio", inicio.value);
    parametros.append("curso", curso.value);
    parametros.append("relato", relato.value);
    parametros.append("procedimiento", procedimiento.value);
    parametros.append("observaciones", observaciones.value);
    parametros.append("examenGeneral", examenGeneral.value);
    parametros.append("frecuencia", frecuencia.value);
    fetch("../controllers/historiaClinica.php",{
        method : "POST",
        body : parametros
    })
    .then(response=> response.json())
    .then(datos => {
        if(datos.status){
            toastCheck("Guardado correctamente");
            modalHC.toggle();
            formHC.reset()
        }else{
            alert(datos.mensaje);
        }
    })
    .catch(error => {
        alert("Error al guardar")
    })
  }
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
            descripcion.value = element.descripcion;
        });
        }
    })
  }

  cie10.addEventListener("keypress", (evt) => {
   if (evt.charCode == 13) consultarEnfermedad();
});
    listar();
btnActualizar.addEventListener("click", agregarDetalleHistoria);
</script>