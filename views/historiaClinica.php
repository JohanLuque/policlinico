<div class="row">
  <div class="col-lg-6 d-flex align-items-strech">
    <div class="card w-100">
      <div class="card-header bg-white mt-4">
        <h2 class="text-center ">HISTORIA CLÍNICA</h2>
      </div>
      <div class="card-body">
        <div class="d-sm-flex d-block align-items-center justify-content-between ">
          <div class="mb-sm-0 text-center">
          </div>
        <div>
      </div>
    </div>
    <div>
      <form id="form-historiaClinica" >
        <div class="mb-3 row g-2">
          <div class="form-floating col-md-5">
              <input type="text" class="form-control border " id="dni" placeholder="N° Documento" maxlength="10" type="tel" required>
              <label for="">
                  <i class="ti ti-user me-2 fs-4"></i>
                  N° Documento
              </label>
              <div class="invalid-feedback">
                  Complete este campo para continuar
              </div>  
          </div>
        </div>
        <div class="mb-3 row g-2">
          <div class="col-md-6">
            <label for="">Nombre Completo:</label>          
          </div>
        </div>
        <div class="mb-3 row g-2">
          <div class="col-md-12">                                  
            <input class="form-control bg-light" id="nombrePaciente" type="text" >
          </div>
        </div>
        
        <div class="mb-3 row g-2">
          <div class="col-md-4">
            <label for="">Antecedente Personal:</label>          
          </div>
          <div class="col-md-8">                                  
            <input class="form-control " id="antecedentePersonal" type="text" >
          </div>
        </div>
        <div class="mb-3 row g-2">
          <div class="col-md-4">
            <label for="">Antecedente Familiar:</label>          
          </div>
          <div class="col-md-8">                                  
            <input class="form-control " id="antecedenteFamiliar" type="text" >
          </div>
        </div>
        <div class="mb-3 row g-2">
          <div class="col-md-4">
            <label for="">Antecedente Quirurgico:</label>          
          </div>
          <div class="col-md-8">                                  
            <input class="form-control " id="antecedenteQuirurgico" type="text"  >
          </div>
        </div>
        <div class="mb-3 row g-2">
          <div class="col-md-4">
            <label for="">Antecedente Otros:</label>          
          </div>
          <div class="col-md-8">                                  
            <input class="form-control " id="antecedenteOtros" type="text" >
          </div>
        </div>                
        <div class="mb-3 row g-2">
          <div class="col-md-4">
            <label for="">Alergias:</label>           
          </div>
          <div class="col-md-6">                                  
            <select name="" id="alergias" class="form-select ">
                <option value=""></option>
            </select>
          </div>
          <div class="col-md-2">
            <button class="btn btn-sm" id="agregarAlergia" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #f96f12;"></i></button>
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
<script>
  const registrarHistoria = document.querySelector("#registrar-historia");
  const dni = document.querySelector("#dni");
  const nombreCompleto = document.querySelector("#nombrePaciente");
  const antecedentePersonal = document.querySelector("#antecedentePersonal");
  const antecedenteQuirurgico = document.querySelector("#antecedenteQuirurgico");
  const antecedenteOtros = document.querySelector("#antecedenteOtros");
  const antecedenteFamiliar = document.querySelector("#antecedenteFamiliar");
  const alergia = document.querySelector("#alergias");
  const tablaAlergias = document.querySelector("#tabla-Alergias");
  const agregarAlergia = document.querySelector("#agregarAlergia");
  let idhistoria;
  let idPersona;
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
      }
    })
  }
  registrarHistoria.addEventListener("click", () => {
    mostrarPregunta("REGISTRAR", "¿Está seguro de guardar?").then((result) => {
      if(result.isConfirmed){
        registrarHitoria();
      }
    });  
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
    tablaAlergias.reset();
  }
  dni.addEventListener("keypress", (evt) => {
    if(evt.charCode == 13){
      buscarHistoria();
      
    } 
  });
</script>