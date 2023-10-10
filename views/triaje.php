
<div class="container-fluid">
  <div class="card">
    <div class="card-header">
      <h1 class="text-center">Historia Clínica</h1>      
    </div>
    <div class="card-body">
      <div class="mb-2 row g-2">
        <div class="col-md-1">
          <label for="">Buscar:</label>
        </div>
        <div class="col-md-3 mb-4">
          <input type="text" class="form-control form-control-sm" id="buscarPaciente" maxlength="8">
        </div>
      </div>
      <div class="mb-2 row g-2" id="historia">  

      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="registrar-Historias" tabindex="-1"  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Historia Clinica</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row mt-2 mb-3">
          <div class="col-md-12">
            <div class="row g-2 mb-3">  
              <form action="" id="form-Historia">
                <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">N° Doc:</label>          
                  </div>                  
                  <div class="col-md-3">                                  
                    <input class="form-control form-control-sm" id="dni" type="text" placeholder="88888888">
                  </div>
                  <div class="col-md-3">                                  
                    <button class="btn btn-sm" id="buscar" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #e66814;"></i></button>
                  </div>
                </div>
                
                <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">Nombre Completo:</label>          
                  </div>
                  <div class="col-md-9">                                  
                    <input class="form-control form-control-sm" id="nombrePaciente" type="text" >
                  </div>
                </div>
                <div class="mb-3 row g-2">
                  <div class="col-md-3">
                    <label for="">Antecedente Personal:</label>          
                  </div>
                  <div class="col-md-8">                                  
                    <input class="form-control form-control-sm" id="antecedentePersonal" type="text" >
                  </div>
                </div>
                <div class="mb-3 row g-2">
                  <div class="col-md-3">
                    <label for="">Antecedente Quirurgico:</label>          
                  </div>
                  <div class="col-md-8">                                  
                    <input class="form-control form-control-sm" id="antecedenteQuirurgico" type="text" >
                  </div>
                </div>
                <div class="mb-3 row g-2">
                  <div class="col-md-3">
                    <label for="">Antecedente Otros:</label>          
                  </div>
                  <div class="col-md-8">                                  
                    <input class="form-control form-control-sm" id="antecedenteOtros" type="text">
                  </div>
                </div>                
                <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">Alergias:</label>           
                  </div>
                  <div class="col-md-9">                                  
                    <select name="" id="alergias" class="form-select form-select-sm">
                        <option value=""></option>
                    </select>
                  </div>
                </div>
                <div class="row g-2 mb-3">
                  <table id="resumenAlergias" class="bg-light">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Alergia</th>
                      </tr>
                    </thead>
                    <tbody id="cuerpoAlergias">
                                                <!-- traer datos  -->
                    </tbody>
                  </table>
                </div>
              </form>
              
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
  const cardHistoria = document.querySelector("#historia");
  const buscar = document.querySelector("#buscarPaciente");

  //Modal
  const modal = new bootstrap.Modal(document.querySelector("#registrar-Historias"));
  const dni = document.querySelector("#dni");
  const nombreCompleto = document.querySelector("#nombrePaciente");
  const alergia = document.querySelector("#alergias");

  function comprobar(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listarHistoriasClinicas");
    parametros.append("nroDocumento", buscar.value);
    fetch("../controllers/detalleAtencion.php",{
      method:"POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos =>{
      //console.log(datos)
      if(datos.length>0){
        cardHistoria.innerHTML="";
        datos.forEach(element => {
        const nuevoCard = `
            <div class="col-md-3" >
              <div class="card">
                <div class="card-content">
                  <div class="card-header bg-secondary" ></div>
                    <div class="card-body bg-light-secondary" style="text-align: center;">
                        <h4>${element.numeroDocumento}</h4>
                        <h5>${element.apellidoPaterno} ${element.apellidoMaterno},<br>${element.nombres}</h5>
                        
                        <button class='btn bg-secondary m-1' type='button'>
                          <a class='ver' type='button' style='text-decoration: none;color: white;' data-idatencion='${element.idHistoriaClinica}'>Ver Detalles</a>
                        </button>
                    </div>        
                  </div>
                </div>
              </div>
            </div> 
           
            `;
        cardHistoria.innerHTML +=nuevoCard;
      });
      }
      else{
        buscarPaciente();
      }
    })
  }
  function buscarPaciente(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "getData");
    parametros.append("numeroDocumento", buscar.value);
    fetch("../controllers/persona.php", {
      method : "POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos => {
      console.log(datos);
      if(datos.length>0){
        datos.forEach(element => {
          modal.show();
          dni.value = buscar.value;
          nombreCompleto.value = element.ApellidosNombres;
          
        });
      }else{
        toast("No se encontro registro de Paciente");
      }
    })
  }
  function listarHistoriaClinicaTodos(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "list");
    fetch("../controllers/historiaClinica.php",{
      method:"POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos=>{
      cardHistoria.innerHTML="";
      datos.forEach(element => {
        const nuevoCard = `
            <div class="col-md-3" >
              <div class="card">
                <div class="card-content">
                  <div class="card-header bg-secondary" ></div>
                    <div class="card-body bg-light-secondary" style="text-align: center;">
                        <h4>${element.numeroDocumento}</h4>
                        <h5>${element.apellidoPaterno} ${element.apellidoMaterno},<br>${element.nombres}</h5>
                        
                        <button class='btn bg-secondary m-1' type='button'>
                          <a class='ver' type='button' style='text-decoration: none;color: white;' data-idatencion='${element.idHistoriaClinica}'>Ver Detalles</a>
                        </button>
                    </div>        
                  </div>
                </div>
              </div>
            </div> 
           
            `;
        cardHistoria.innerHTML +=nuevoCard;
      });
    })
  }



  // cardHistoria.addEventListener("click", (event) => {
  //   if(event.target.classList[0] == 'ver'){

  //   }
  // });
  listarHistoriaClinicaTodos();
  
  function listarHistoriaClinica(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "getData");
    parametros.append("nroDocumento", buscar.value);
    fetch("../controllers/detalleAtencion.php",{
      method:"POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos=>{
      cardHistoria.innerHTML="";
      datos.forEach(element => {
        const nuevoCard = `
        <div class="col-md-3" >
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <h5>${element.fecha} </h5>
                        </div>
                    </div>
                </div>
            </div> 
        `;
        cardHistoria.innerHTML +=nuevoCard;
      });
    })
  }
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
  listarAlergias();

  buscar.addEventListener("keypress", (evt) => {
    if(evt.charCode == 13){
      comprobar();
    } 
  });


  
</script>