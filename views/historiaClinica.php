<?php require_once 'permisos.php'; ?>
<div class="row">
  <div class="col-lg-6 d-flex align-items-strech">
    <div class="card w-100">
      <div class="card-header bg-white mt-4">
        <h2 class="text-center ">HISTORIA CLÍNICA</h2>
      </div>
      <div class="card-body">
        <div>
          <form id="form-alergias" >
            <div class="mb-3 row g-2">
              
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-6">
                <label class="fw-bolder text-dark" for="">Nombre Completo:</label>          
              </div>
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-12">                                  
                <input class="form-control bg-light" id="nombrePaciente" type="text"readonly >
              </div>
            </div>
            
            <div class="mb-3 row g-2">
              <div class="col-md-4">
                <label class="fw-bolder text-dark" for="">Antecedente Personal:</label>          
              </div>
              <div class="col-md-8">                                  
                <input class="form-control " id="antecedentePersonal" type="text" >
              </div>
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-4">
                <label class="fw-bolder text-dark" for="">Antecedente Familiar:</label>          
              </div>
              <div class="col-md-8">                                  
                <input class="form-control " id="antecedenteFamiliar" type="text" >
              </div>
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-4">
                <label class="fw-bolder text-dark" for="">Antecedente Quirurgico:</label>          
              </div>
              <div class="col-md-8">                                  
                <input class="form-control " id="antecedenteQuirurgico" type="text"  >
              </div>
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-4">
                <label class="fw-bolder text-dark" for="">Antecedente Otros:</label>          
              </div>
              <div class="col-md-8">                                  
                <input class="form-control " id="antecedenteOtros" type="text" >
              </div>
            </div>                
            <div class="mb-3 row g-2">
              <div class="col-md-4">
                <label class="fw-bolder text-dark"  for="">Alergias:</label>           
              </div>
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-2">
              </div>
              <div class="col-md-6">                                  
                <select name="" id="alergias" class="form-select ">
                    <option value=""></option>
                </select>
              </div>
              <div class="col-md-2">
                <button class="btn btn-sm" id="agregarAlergia" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #f96f12;"></i></button>
              </div>
              <div class="col-md-2">
                <button class="btn btn-sm btn-danger" id="registrarAlergia" data-bs-toggle="modal" data-bs-target="#registrar-alergia" type="button">Registrar</button>
              </div>
            </div>

            <div class="row g-2 mb-3">
              <table id="tabla-Alergias" class="table">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Alergia</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody id="cuerpoAlergias">
                  <!-- traer datos  -->
                </tbody>
              </table>
            </div>  
            <div class="mb-3 row g-2">
              <div class="d-grid">
                <button id="registrar-historia" class="btn btn-danger btn-sm mt-1" type="button">Guardar</button>
              </div> 
            </div>
          </form>
        </div>  
        
      </div>
    </div>
  </div>
  <div class="col-lg-6 d-flex align-items-strech">
    <div class="card w-100">
      <div class="card-body p-4">
        <div class="d-flex align-items-center justify-content-between">
          <div>
            <h5 class="card-title fw-semibold">Historias pendientes:</h5>
            <p class="card-subtitle mb-0">Pendientes</p>
          </div>          
        </div>
        <div class="d-flex align-items-center gap-3 py-3">
          <div>
            <table class="table table-responsive-md" id="sinHistorias">
              <thead>
                <tr>
                  <th>#</th>
                  <th>N° DOC</th>
                  <th>Paciente</th>
                  <th>Especialidad</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>

              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="registrar-alergia" tabindex="-1"  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5 fw-bolder" id="exampleModalLabel">Registrar Alergia</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row mt-2 mb-3">
          <div class="col-md-12">
            <div class="row g-2 mb-3">  
              <form action="" id="form-alergias">
                <div class="mb-3 row g-2">
                  <div class="form-floating">
                    <input type="text" class="form-control border"  placeholder="Nombre Completo" id="nombreAlergia" type="text" required>
                    <label for="">
                        <i class="ti ti-user me-2 fs-4"></i>
                        Nombre Alergia
                    </label> 
                  </div>
                </div>
              </form>
            </div>          
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="guardarAlergia">Guardar</button>
      </div>
    </div>
  </div>
</div>
<script>
  const modalRegistrarPersonas = new bootstrap.Modal(document.querySelector("#registrar-alergia"));
  const registrarHistoria = document.querySelector("#registrar-historia");
  const dni = document.querySelector("#dni");
  const nombreCompleto = document.querySelector("#nombrePaciente");
  const nombreAlergia = document.querySelector("#nombreAlergia");
  const guardarAlergia = document.querySelector("#guardarAlergia");
  const formAlergias = document.querySelector("#form-alergias");


  const antecedentePersonal = document.querySelector("#antecedentePersonal");
  const antecedenteQuirurgico = document.querySelector("#antecedenteQuirurgico");
  const antecedenteOtros = document.querySelector("#antecedenteOtros");
  const antecedenteFamiliar = document.querySelector("#antecedenteFamiliar");
  const sinHistoria = document.querySelector("#sinHistorias");
  const cuerpoHistoria = sinHistoria.querySelector("tbody");
  const alergia = document.querySelector("#alergias");
  const tablaAlergias = document.querySelector("#tabla-Alergias");
  const agregarAlergia = document.querySelector("#agregarAlergia");
  let idhistoria;
  let idPersona;
  let buscar;
  function buscarHistoria(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "getData");
    parametros.append("nroDocumento", dni.value);
    fetch("../controllers/historiaClinica.php",{
      method:"POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos =>{
      //console.log(datos)
      if(datos.length > 0){
        datos.forEach(element => {
          if(element.historiaClinica == 'si'){
            toastCheck("El Paciente ya tiene historia clinica");
            nombreCompleto.value = "";
          }else{
            toast("El paciente no tiene historia");
            nombreCompleto.value = element.ApellidosNombres;
            idPersona = element.idPersona;
          } 
        });
      }
      else{
        toast("No existe atención")

      }
    })
  }

  function listarSinHistoria(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listarSinHistoria");

    fetch("../controllers/historiaClinica.php", {
            method: "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            let nro = 1;
            cuerpoHistoria.innerHTML = ``;
            datos.forEach(element => {
                const fila =
                    `
                    <tr>
                        <td>${nro}</td>
                        <td>${element.numeroDocumento}</td>
                        <td>${element.ApellidosNombres}</td>
                        <td>${element.nombreServicio}</td>
                        <td>
                          <a class ="historia btn btn-sm btn-danger" data-buscar='${element.numeroDocumento}'>
                              Ir
                          </a>
                        </td>
                    </tr>
                    `;
                cuerpoHistoria.innerHTML += fila;
                nro +=1;
            })
        })
  }
  listarSinHistoria();
  function registrarHitoria(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "add");
    parametros.append("idpersona", idPersona);
    parametros.append("idusuario", 1);
    parametros.append("antecedentePersonal", antecedentePersonal.value);
    parametros.append("antecedenteFamiliar", antecedenteFamiliar.value);
    parametros.append("antecedenteQuirurgico", antecedenteQuirurgico.value);
    parametros.append("antecedenteOtro", antecedenteOtros.value);
    fetch("../controllers/historiaClinica.php",{
      method:"POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos=>{
      if(datos.status){
        capturandoIdhistoria();
        listarSinHistoria();

      }
    })
  }
  registrarHistoria.addEventListener("click", () => {
    mostrarPregunta("REGISTRAR", "¿Está seguro de guardar?").then((result) => {
      if(result.isConfirmed){
        registrarHitoria();
        listarSinHistoria();
      }
    });  
  });
  const choiseAlergias = new Choices(alergia, {
    searchEnabled: true,
    itemSelectText: '',
    allowHTML: true
  });
  function listarAlergias(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listar");
    fetch("../controllers/alergia.php", {
      method : "POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos => {
      console.log(datos);
      alergia.innerHTML = "<option value=''>Seleccione</option>";

      datos.forEach(element => {
        const optionTag = document.createElement("option");
        optionTag.value = element.idAlergia;
        optionTag.text = element.alergia
        alergia.appendChild(optionTag);
      })
      choiseAlergias.setChoices([], 'value', 'label', true); // Vacía las opciones
      choiseAlergias.setChoices(datos, 'idAlergia', 'alergia', true); // Agrega las nuevas opciones
      
    })
  }
  function agregarAlergiaTabla (){
    if(alergia.value > 0){
      const alergiaSeleccionada = alergia.options[alergias.selectedIndex];
      
      if(alergiaSeleccionada.value != ""){
        let alergiaRepetida = false;
        const filas  = tablaAlergias.rows;
        
        for(let i=1; i < filas.length; i++){
          const alergiaCelda = filas[i].cells[1].innerText;
          console.log(alergiaCelda);
          if(alergiaCelda === alergiaSeleccionada.text){
            alergiaRepetida = true;
            break;
          }          
        } 
        if(!alergiaRepetida){
            let filanueva =            
            `
            <tr>
              <td>${alergiaSeleccionada.value}</td>
              <td>${alergiaSeleccionada.text}</td>
              <td>
                <a class ="eliminar btn btn-sm btn-danger">Eliminar</a>
              </td>
            </tr>
            `;
            tablaAlergias.innerHTML += filanueva;
            alergia.value = 0;
            listarAlergias();
        }
        else{
          toast("No se puede repetir las alergias");
        }
      }
    }
  }
  tablaAlergias.addEventListener("click", (e) => {
    if(e.target.closest(".eliminar")){
      const row = e.target.closest("tr");
      row.remove();

    }
  });
  agregarAlergia.addEventListener("click", () => {    
    agregarAlergiaTabla();
  })
  listarAlergias();
  function capturandoIdhistoria(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "getData");
    parametros.append("nroDocumento", dni.value);
    fetch("../controllers/historiaClinica.php",{
      method:"POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos =>{
      //console.log(datos)
      if(datos.length > 0){
        datos.forEach(element => {
          if(element.historiaClinica == 'si'){
            idhistoria = element.idHistoriaClinica;
            console.log(idhistoria);
            registrarAlergiasHistoria(idhistoria);
            listarSinHistoria();
          }
        });
      }
      else{
        toast("solicitud invalida")
      }
    })
  }
  function registrarAlergiasHistoria(idhistoria){
    const filaAlergia  = tablaAlergias.rows;
    for (let i = 1; i < filaAlergia.length; i++){
      const idAlergia = parseInt(filaAlergia[i].cells[0].innerText);
      const parametros = new URLSearchParams();
      parametros.append("operacion", "add");
      parametros.append("idHistoriaClinica", idhistoria);
      parametros.append("idAlergia", idAlergia);

      fetch("../controllers/alergia.php", {
        method: "POST",
        body: parametros
      })
      .then(response => response.json())
      .then(datos => {
        if(datos.status){
          toastCheck("Guardado correctamente");
          listarSinHistoria();
          window.location.href = "index.php?view=triaje.php"
        }
      })
    }
  }

  function resetdata(){
    dni.value = "";
    nombreCompleto.value = "";
    antecedentePersonal.value = "";
    antecedenteQuirurgico.value = "";
    antecedenteOtros.value = "";
    antecedenteFamiliar.value = "";
    tablaAlergias.innerHTML=`<table id="tabla-Alergias" class="table"><thead><tr><th>ID</th><th>Alergia</th><th></th></tr></thead><tbody id="cuerpoAlergias"></tbody></table>`;
  }

  function registrarAlergias() {
    const parametros = new URLSearchParams();
    parametros.append("operacion", "registrarAlergias");
    parametros.append("alergia", nombreAlergia.value);
    fetch("../controllers/alergia.php",{
        method: 'POST',
        body: parametros
    })
    .then(response => response.json())
    .then(datos =>{
        if(datos.status){
            toastCheck("Guardado correctamente");
            listarAlergias();
            formAlergias.reset();
        }else{
            notificar("Error", "La alergia ya existe",2)
        }
    })
  } 

  cuerpoHistoria.addEventListener("click", (event) => {
    buscar = event.target.dataset.buscar;
    if(event.target.classList[0] == 'historia'){
      if(dni.value){
        mostrarPregunta("Cambiar", "¿Está seguro de cambiar?, los datos ingresados se borraran").then((result) => {
          if(result.isConfirmed){
            resetdata();
            dni.value = buscar;
            buscarHistoria();
          }
        }) 
      }else{
        dni.value = buscar;
        buscarHistoria();
      }
    }
  });

  guardarAlergia.addEventListener("click", () => {
      mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
              if(result.isConfirmed){
                  registrarAlergias();
              }
          })
  });
</script>