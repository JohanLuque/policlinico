<div class="row">
    <div class="col-lg-12 d-flex align-items-strech">
        <div class="card w-100">
            <div class="card-body">
                <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                    <!-- <div class="mb-3 mb-sm-0">
                        <h5 class="card-title fw-semibold">Realizar Triaje:</h5>
                    </div> -->
                </div>
                <div>
                    <div class="mb-3 row g-2">
                      <h1 class="form-label fs-13 text-center text-danger">Realizar Triaje</h1>
                    </div>
                    <table class="table table-hover" id="tabla-triaje">
                      <thead class="table-danger">
                        <tr>
                          <th>id</th>
                          <th>Paciente</th>
                          <th>Especialidad</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody id="cuerpoTriaje">

                      </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- modal de registro de triaje -->
<div class="modal fade" id="modalTriaje" tabindex="-1" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-l" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5 fw-bold" id="exampleModalLabel"> Triaje:</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="row mt-2 mb-3">                
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                          <div>                    
                            <form id="form-triaje" >
                              <div class="mb-3 row g-2">
                                <div class="col-md-3">
                                  <label class="form-label">N° Doc:</label>          
                                </div>
                                <div class="col-md-4">
                                  <input type="text" id="dni_paciente"class="form-control form-control-sm bg-light" readonly>
                                </div> 
                              </div>
                              <div class="mb-3 row g-2">
                                <div class="col-md-3">
                                  <label class="form-label">Paciente:</label>          
                                </div>
                                <div class="col-md-8">
                                  <input type="text" id="nombre_paciente" class="form-control form-control-sm bg-light" readonly>
                                </div> 
                              </div>
                              <div class="mb-3 row g-2">                  
                                <div class="col-md-3">
                                    <label class="form-label">Peso:</label>          
                                </div> 
                                <div class="col-md-3">
                                  <input type="number" step="any" id="triaje-peso"class="form-control form-control-sm" required>         
                                </div>
                                <div class="ms-3 col-md-2">
                                  <label>kg</label>          
                                </div>
                              </div>
                              <div class="mb-3 row g-2">
                                <div class="col-md-3">
                                  <label class="form-label">Talla:</label>          
                                </div> 
                                <div class="col-md-3">
                                  <input type="number" step="any" id="triaje-talla"class="form-control form-control-sm" required>         
                                </div>
                                <div class="ms-3 col-md-2">
                                  <label>m</label>          
                                </div>
                              </div>
                              <div class="row mb-3 g-2">
                                <label class="fs-7" for="">FRECUENCIAS:</label>
                              </div>
                              <div class="mb-3 row g-2">
                                <div class="col-md-3">
                                  <label class="form-label">Cardiaca:</label>          
                                </div> 
                                <div class="col-md-3">
                                  <input type="number" id="f-cardiaca1"class="form-control form-control-sm" required>         
                                </div>
                                <div class="ms-3 col-md-2">
                                  <label> X 1 min</label>          
                                </div>
                              </div>
                              <div class="row g-2 mb-3">
                                <div class="col-md-3">
                                  <label class="form-label">Respiratoria:</label>          
                                </div> 
                                <div class="col-md-3">
                                  <input type="number" id="f-respiratoria1"class="form-control form-control-sm" required>         
                                </div> 
                                <div class="ms-3 col-md-2">
                                  <label> X 1 min</label>          
                                </div> 
                              </div>
                              <div class="row mb-3 g-2">
                                <div class="col-md-3">
                                  <label class="form-label">Presión Arterial:</label>          
                                </div> 
                                <div class="col-md-3">
                                  <input type="number" id="presionArterial1"class="form-control form-control-sm" required>         
                                </div> 
                                <div class="ms-3 col-md-1">
                                  <label> / </label>          
                                </div> 
                                <div class="col-md-2">
                                  <input type="number" id="presionArterial2"class="form-control form-control-sm" required>         
                                </div>
                              </div>
                              <div class="row mb-3 g-2">
                                <div class="col-md-4">
                                  <label class="form-label" for="">Temperatura(C°):</label>
                                </div>
                                <div class="col-md-3">
                                  <input type="text" id="temperatura"class="form-control form-control-sm" required>
                                </div>
                              </div>
                              <div class="row mb-3 g-2">
                                <div class="col-md-3">
                                  <label class="form-label" for="">Saturación Oxígeno:</label>
                                </div>
                                <div class="col-md-3">
                                  <input type="text" id="saturacionOxigeno"class="form-control form-control-sm " required>
                                </div>
                              </div>
                            </form>
                          </div>
                        </div>
                    </div>
                </div>           
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary "   id="registrar-triaje">Guardar</button>
        </div>
      </div>
    </div>
</div>
<script>
  const modal = new bootstrap.Modal(document.querySelector("#modalTriaje"));
  const dniPaciente = document.querySelector("#dni_paciente");
  const nombrePaciente = document.querySelector("#nombre_paciente");
  const peso = document.querySelector("#triaje-peso");
  const talla = document.querySelector("#triaje-talla");
  //Frecuencia Cardiaca
  const cardiaca1 = document.querySelector("#f-cardiaca1");
  const cardiaca2 = document.querySelector("#f-cardiaca2");
  //Frecuencia Respiratoria
  const respiratoria1 = document.querySelector("#f-respiratoria1");
  const respiratoria2 = document.querySelector("#f-respiratoria2");
  //Presión Arterial
  const presionArterial1 = document.querySelector("#presionArterial1");
  const presionArterial2 = document.querySelector("#presionArterial2");
  //Temperatura
  const temperatura = document.querySelector("#temperatura");
  const saturacionOxigeno = document.querySelector("#saturacionOxigeno");
  // botón de registro
  const registrarDetalle = document.querySelector("#registrar-triaje");
  const formulario = document.querySelector("#form-triaje");

  const tablaTriaje = document.querySelector("#tabla-triaje");
  const cuerpoTriaje = tablaTriaje.querySelector("#cuerpoTriaje")

  //para capturar el idAtencion
  let idAtencion;
  let numeroDocumento;
  let idhistoria = 0;
  
  function listarTriaje(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listarTriaje");

    fetch("../controllers/historiaClinica.php", {
      method: "POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos => {
      cuerpoTriaje.innerHTML = "";
      datos.forEach(element => {
        let filanueva = `
        <tr>
          <td>${element.idAtencion}</td>
          <td>${element.ApellidosNombres}</td>
          <td>${element.nombreServicio}</td>
          <td>
              <a class ="triaje btn btn-sm btn-danger" data-idhistoria='${element.idHistoriaClinica}' data-idatencion='${element.idAtencion}'>
                triaje
              </a>
          </td>
        </tr>
        `;
        cuerpoTriaje.innerHTML += filanueva;

      });
    })
  }
  cuerpoTriaje.addEventListener("click", (event) => {
    if(event.target.classList[0] == 'triaje'){
      idAtencion = parseInt(event.target.dataset.idatencion);
      idhistoria = parseInt(event.target.dataset.idhistoria);

      obtenerDatos(idAtencion);
      modal.toggle();
    }
  });
  function obtenerDatos(idAtencion){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "obtenerDatosTriaje");
    parametros.append("idatencion", idAtencion);
    fetch("../controllers/historiaClinica.php", {
      method:'POST',
      body: parametros
    })
    .then(response => response.json())
    .then(datos => {
      datos.forEach(element => {
        idhistoria = element.idHistoriaClinica;
        dniPaciente.value = element.numeroDocumento;
        nombrePaciente.value = element.ApellidosNombres;
        //console.log(idhistoria);       
      })
    })
  }
  
  function registrarTriaje(){
    const frecuenciaCardiaca =`${cardiaca1.value}x1`;
    const frecuenciaRespiratoria =`${respiratoria1.value}x1`;
    const presionArterial =`${presionArterial1.value}/${presionArterial2.value}`;
    console.log(frecuenciaRespiratoria);
    const parametros =new URLSearchParams();
    parametros.append("operacion", "registrarDetalle");
    parametros.append("idatencion", idAtencion);
    parametros.append("idhistoria", idhistoria);
    parametros.append("peso", peso.value);
    parametros.append("talla", talla.value);
    parametros.append("frecuenciaCardiaca", frecuenciaCardiaca);
    parametros.append("frecuenciaRespiratoria", frecuenciaRespiratoria);
    parametros.append("presionArterial", presionArterial);
    parametros.append("temperatura", temperatura.value);
    parametros.append("saturacionOxigeno", saturacionOxigeno.value);
    parametros.append("idusuario", 1);

    fetch("../controllers/detalleAtencion.php",{
      method: 'POST',
      body: parametros
    })
    .then(response => response.json())
    .then(datos =>{
      if(datos.status){
        toastCheck("Guardado correctamente");
        listarTriaje();
        formulario.reset();
        modal.toggle();
      }else{
        toast("Error al guardar");
      }      
    })
    
  }
  function validar(){
    if(!formulario.checkValidity()){
      event.preventDefault();
      event.stopPropagation();
      formulario.classList.add('was-validated');
    }else{
      comprobar();
    }
  }
  function comprobar() {
    const valorPeso = parseFloat(peso.value);
    const valorTalla = parseFloat(talla.value);
    const valorCardiaca = parseFloat(cardiaca1.value);
    const valorRespiratoria = parseFloat(respiratoria1.value);
    const valorPresionArterial1 = parseFloat(presionArterial1.value);
    const valorPresionArterial2 = parseFloat(presionArterial2.value);
    const valorTemperatura = parseFloat(temperatura.value);
    const valorSaturacion = parseFloat(saturacionOxigeno.value);

    if(valorPeso<=0){
      toast("Peso invalido");
      peso.focus()
      return;
    }else if(valorTalla<=0){
      toast("talla invalida");
      talla.focus();
      return;
    }else if(valorCardiaca<=0){
      toast("F. Cardiaca invalida");
      cardiaca1.focus();
      return;
    }else if(valorRespiratoria<=0){
      toast("F. Respiratoria invalida");
      respiratoria1.focus();
      return;
    }else if(valorPresionArterial1<=0 ||valorPresionArterial2<=0){
      toast("P. Arterial invalida");
      if(valorPresionArterial1 <= 0){
        presionArterial1.focus();
      } else {
        presionArterial2.focus();
      }
      return;
    }else if(valorTemperatura<=0){
      toast("Temperatura  invalida");
      temperatura.focus();
      return;
    }else if(valorSaturacion<0 || valorSaturacion >100){
      toast("Saturación de oxigeno invalida");
      saturacionOxigeno.focus();
      return;
    }else{
      registrarTriaje();
    }
  }
  registrarDetalle.addEventListener("click", validar);
  listarTriaje();


</script>