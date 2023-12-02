<?php require_once 'permisos.php'; ?>
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
                                <div class="form-floating">
                                  <input type="text" class="form-control border bg-light " id="dni_paciente" type="tel" placeholder="88888888" required>
                                  <label for="">
                                      <i class="ti ti-id-badge me-2 fs-4"></i>
                                      N° Documento
                                  </label>
                                  <div class="invalid-feedback">
                                      Complete este campo para continuar
                                  </div>  
                                </div> 
                              </div>
                              <div class="mb-2 row g-2">
                                <div class="col-md-3">
                                  <label class="form-label">Paciente:</label>          
                                </div>
                              </div>
                              <div class="mb-3 row g-2">
                                <div class="col-md-12">
                                  <input type="text" id="nombre_paciente" class="form-control bg-light" readonly>
                                </div> 
                              </div>
                              <div class="mb-1 row g-2">                  
                                <div class="col-md-6">
                                    <label class="fw-bolder">Peso:</label>          
                                </div> 
                                <div class="col-md-6">
                                  <label class="fw-bolder">Talla:</label>
                                </div>
                                
                              </div>
                              <div class="mb-3 row g-2">
                                <div class="col-md-4">
                                  <input type="number" step="any" id="triaje-peso"class="form-control" placeholder="00,0" required>            
                                </div> 
                                <div class="ms-3 col-md-1">
                                  <label >kg</label>          
                                </div>
                                <div class="col-md-4">
                                  <input type="number" step="any" id="triaje-talla"class="form-control" placeholder="000" required>         
                                </div>
                                <div class="ms-3 col-md-1">
                                  <label>cm</label>          
                                </div>
                              </div>
                              <div class="row mb-3 g-2">
                                <label class="fs-7 fw-bolder text-dark" for="">FRECUENCIAS:</label>
                              </div>
                              <div class="mb-1 row g-1">
                                <div class="col-md-6">
                                  <label class="fw-bolder">Cardiaca:</label>          
                                </div> 
                                <div class="col-md-6">
                                  <label class="fw-bolder">Respiratoria:</label>          
                                </div>
                              </div>
                              <div class="row g-2 mb-3">
                                <div class="col-md-3">
                                  <input type="number" id="f-cardiaca1"class="form-control" placeholder="60-72" required>         
                                </div> 
                                <div class="ms-3 col-md-2">
                                  <label> X 1 min</label>          
                                </div>
                                <div class="col-md-3">
                                  <input type="number" id="f-respiratoria1"class="form-control" placeholder="19-22" required>         
                                </div> 
                                <div class="ms-3 col-md-3">
                                  <label> X 1 min</label>          
                                </div> 
                              </div>
                              <div class="row mb-3 g-2">
                                <div class="col-md-3">
                                  <label class="fw-bolder">P/A:</label>          
                                </div> 
                                <div class="col-md-4">
                                  <input type="number" id="presionArterial1"class="form-control" placeholder="120-140" required>         
                                </div> 
                                <div class="ms-3 col-md-1">
                                  <label class="fs-6"> / </label>          
                                </div> 
                                <div class="col-md-3">
                                  <input type="number" id="presionArterial2"class="form-control" placeholder="80-90" required>         
                                </div>
                              </div>
                              <div class="row mb-3 g-2">
                                <div class="col-md-4">
                                  <label class="fw-bolder" for="">Temperatura(C°):</label>
                                </div>
                                <div class="col-md-3">
                                  <input type="number" id="temperatura"class="form-control" placeholder="35-37" required>
                                </div>
                              </div>
                              <div class="row mb-3 g-2">
                                <div class="col-md-3">
                                  <label class=" fw-bolder" for="">Saturación Oxígeno:</label>
                                </div>
                                <div class="col-md-3">
                                  <input type="number" id="saturacionOxigeno"class="form-control" placeholder="95-99" required>
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

  //comprobar valores
  let valorPeso;
  let valorTalla;
  let valorCardiaca;
  let valorRespiratoria;
  let valorPresionArterial1;
  let valorPresionArterial2;
  let valorTemperatura;
  let valorSaturacion;
  
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
      let numero = 1;
      datos.forEach(element => {
        let filanueva = `
        <tr>
          <td>${numero}</td>
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
        numero++

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
    valorPeso = parseFloat(peso.value);
    valorTalla = parseFloat(talla.value);
    valorCardiaca = parseFloat(cardiaca1.value);
    valorRespiratoria = parseFloat(respiratoria1.value);
    valorPresionArterial1 = parseFloat(presionArterial1.value);
    valorPresionArterial2 = parseFloat(presionArterial2.value);
    valorTemperatura = parseFloat(temperatura.value);
    valorSaturacion = parseFloat(saturacionOxigeno.value);

    if(valorPeso<=0 || valorPeso >160){
      toast("Peso invalido");
      peso.focus()
      return;
    }else if(valorTalla<=0 || valorTalla > 300){
      toast("talla invalida");
      talla.focus();
      return;
    }else if(valorCardiaca<=0 || valorCardiaca>100){
      toast("F. Cardiaca invalida");
      cardiaca1.focus();
      return;
    }else if(valorRespiratoria<=0 || valorRespiratoria>30){
      toast("F. Respiratoria invalida");
      respiratoria1.focus();
      return;
    }else if(valorPresionArterial1<=0 || valorPresionArterial1>150 || valorPresionArterial2<=0 || valorPresionArterial2>100){
      toast("P. Arterial invalida");
      if(valorPresionArterial1 <= 0 || valorPresionArterial1>150){
        presionArterial1.focus();
      } else if(valorPresionArterial2<=0 || valorPresionArterial2>100){
        presionArterial2.focus();
      }
      return;
    }else if(valorTemperatura<=0 ||valorTemperatura>40){
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

  function revisar() {
    let revisado = false;

    if (valorCardiaca < 60 || valorCardiaca > 72) {
      revisado = true;
    }
    else if (valorRespiratoria < 19 || valorRespiratoria > 22) {
      revisado = true;
    }
    else if (valorPresionArterial1 < 120 || valorPresionArterial1 > 140) {
      revisado = true;
    }
    else if (valorPresionArterial2 < 80 || valorPresionArterial2 > 90) {
      revisado = true;
    }
    else if (valorTemperatura < 35 || valorTemperatura > 37) {
      revisado = true;
    }
    else if (valorSaturacion < 95 || valorSaturacion > 99) {
      revisado = true;
    }
    if (revisado) {
      mostrarPregunta("¿Está seguro de Guardar?", "tiene información que no es tan común").then((result) => {
        if(result.isConfirmed){
          registrarTriaje();
        }
        })
    } else {
      registrarTriaje();
    }
  }

  

  registrarDetalle.addEventListener("click", validar);
  listarTriaje();
  peso.addEventListener("change", ()=>{
    valorPeso = parseFloat(peso.value);
    if (valorPeso > 150) {
      mostrarPregunta("¿Está seguro de seguir?", "El peso es superior  a 150 kg").then((result) => {
        if(result.isConfirmed){

        }else{
          peso.focus();
        }
        })
    }
  });

  talla.addEventListener("change", ()=>{
    valorTalla = parseFloat(talla.value);
    if (valorTalla > 210) {
      mostrarPregunta("¿Está seguro de seguir?", "La talla es superior  a 210 cm").then((result) => {
        if(result.isConfirmed){

        }else{
          talla.focus();
        }
        })
    }
  });

  cardiaca1.addEventListener("change", ()=>{
    valorCardiaca = parseFloat(cardiaca1.value);

    if (valorCardiaca < 60 || valorCardiaca > 72) {
      mostrarPregunta("¿Está seguro de seguir?", "La F. Cardiaca es diferente al rango entre 60 a 72").then((result) => {
        if(result.isConfirmed){

        }else{
          cardiaca1.focus();
        }
        })
    }
  });

  respiratoria1.addEventListener("change", ()=>{
    valorRespiratoria = parseFloat(respiratoria1.value);
    if (valorRespiratoria < 19 || valorRespiratoria > 22) {
      mostrarPregunta("¿Está seguro de seguir?", "La F. respiratoria es diferente al rango entre 19 a 22").then((result) => {
        if(result.isConfirmed){

        }else{
          respiratoria1.focus();
        }
        })
    }
  });

  presionArterial1.addEventListener("change", ()=>{
    valorPresionArterial1 = parseFloat(presionArterial1.value);

    if (valorPresionArterial1 < 120 || valorPresionArterial1 > 140) {
      mostrarPregunta("¿Está seguro de seguir?", "La P. arterial es diferente al rango entre 120 a 140").then((result) => {
        if(result.isConfirmed){

        }else{
          presionArterial1.focus();
        }
        })
    }
  });

  presionArterial2.addEventListener("change", ()=>{
    valorPresionArterial2 = parseFloat(presionArterial2.value);

    if (valorPresionArterial2 < 80 || valorPresionArterial2 > 90) {
      mostrarPregunta("¿Está seguro de seguir?", "La F. respiratoria es diferente al rango entre 80 a 90").then((result) => {
        if(result.isConfirmed){

        }else{
          presionArterial2.focus();
        }
        })
    }
  });

  temperatura.addEventListener("change", ()=>{
    valorTemperatura = parseFloat(temperatura.value);

    if (valorTemperatura < 35 || valorTemperatura > 37) {
      mostrarPregunta("¿Está seguro de seguir?", "La temperatura es diferente al rango entre 35 a 37").then((result) => {
        if(result.isConfirmed){

        }else{
          temperatura.focus();
        }
        })
    }
  });

  saturacionOxigeno.addEventListener("change", ()=>{
    valorSaturacion = parseFloat(saturacionOxigeno.value);

    if (valorSaturacion < 95 || valorSaturacion > 99) {
      mostrarPregunta("¿Está seguro de seguir?", "La saturacion es diferente al rango entre 95 a 99").then((result) => {
        if(result.isConfirmed){

        }else{
          saturacionOxigeno.focus();
        }
        })
    }
  });
</script>