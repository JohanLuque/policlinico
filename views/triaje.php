
<div class="container-fluid">  
  <div class="card" id="cardhistoriacli">
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
      <div  class="mb-2 row g-2" id="historia">  

      </div>
    </div>
  </div>
  <div class="row" id="detalleHistoria"style="display: none;">
    <div class="col-lg-6 d-flex align-items-strech">
        <div class="card w-100">
            <div class="card-header">
              <h1 class="text-center">Triaje</h1>      
            </div>
            <div class="card-body">
              <div class="mb-2 row g-2">
                <div class="col-md-2">
                  <label for="">Buscar:</label>
                </div>
                <div class="col-md-3 mb-4">
                  <input type="text" class="form-control form-control-sm" id="buscarDetalle" maxlength="8">
                </div>
                <div class="col-md-3">                                  
                  <button class="btn btn-sm" id="abrirmodalRegistro" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #e66814;"></i></button>
                </div>
              </div>
              <div class="mb-2 row g-2" id="carddetalleHistoria" >  
        
              </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6 d-flex align-items-strech">
      <div class="card w-100">
        <div class="card-header">
          <h1 class="text-center">Atenciones</h1>      
        </div>
        <div class="card-body">
          <table id="tablaAtenciones" class="table table-danger">
            <thead>
              <tr>
                <th>ID</th>
                <th>Especialidad</th>
                <th>Fecha</th>
                <th></th>
              </tr>
            </thead>
            <tbody  id="cuerpoAtenciones">

            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- registrar Triaje(DetalleAtencion) -->
<div class="modal fade" id="registrar-D-historia" tabindex="-1"  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Triaje</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row mt-2 mb-3">
          <div class="col-md-12">
            <div class="row g-2 mb-3">  
              <form action="" id="">
                <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">N° Doc:</label>          
                  </div>                  
                  <div class="col-md-3">                                  
                    <input class="form-control form-control-sm" id="dni-Triaje" type="text" placeholder="88888888" required>
                  </div>
                </div>                
                <div class="mb-3 row g-2">
                  <div class="col-md-3">
                    <label for="">Nombre Completo:</label>          
                  </div>
                  <div class="col-md-8">                                  
                    <input class="form-control form-control-sm" id="nombrePaciente-Triaje" type="text" >
                  </div>
                </div>
                <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">Peso:</label>          
                  </div>
                  <div class="col-md-3">                                  
                    <input class="form-control form-control-sm" id="peso-triaje" type="number" required>
                  </div>
                  <div class="col-md-2">
                    <label for="">Talla:</label>          
                  </div>
                  <div class="col-md-3">                                  
                    <input class="form-control form-control-sm" id="talla-triaje" type="number" required >
                  </div>
                </div>
                <div class="mb-3 row g-2">
                  <div class="col-md-3">
                    <label for="">Frecuencia Cardiaca:</label>          
                  </div>
                  <div class="col-md-3">                                  
                    <input class="form-control form-control-sm" id="frecuenciaCardiaca-triaje" type="text" >
                  </div>
                  <div class="col-md-3">
                    <label for="">Frecuencia Respiratoria:</label>          
                  </div>
                  <div class="col-md-3">                                  
                    <input class="form-control form-control-sm" id="frecuenciaRespiratoria-triaje" type="text"  >
                  </div>
                </div>
                <div class="mb-3 row g-2">
                  <div class="col-md-3">
                    <label for="">Presion Arterial :</label>          
                  </div>
                  <div class="col-md-3">                                  
                    <input class="form-control form-control-sm" id="presionArterial-triaje" type="text" >
                  </div>
                  <div class="col-md-3">
                    <label for="">temperatura:</label>           
                  </div>
                  <div class="col-md-3">                                  
                    <input class="form-control form-control-sm" id="temperatura-triaje" type="text" >                    
                  </div>
                </div>
                <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">Saturacion Oxigeno:</label>           
                  </div>
                  <div class="col-md-5">                                  
                    <input class="form-control form-control-sm" id="saturacionOxigeno-triaje" type="text" >                    
                  </div>
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
  const historia = document.querySelector("#cardhistoriacli");
  const detalleHistoria = document.querySelector("#detalleHistoria");
  const carddetalleHistoria = document.querySelector("#carddetalleHistoria");
  const detalles = document.querySelector("#detalles")
  const buscar = document.querySelector("#buscarPaciente");
  const buscarDetalles = document.querySelector("#buscarDetalle");
  //Tabla alergias
  const tablaAlergias = document.querySelector("#resumenAlergias");
  const agregarAlergia = document.querySelector("#agregarAlergia");
  //TRIAJE
  const tablaAtenciones = document.querySelector("#tablaAtenciones");
  const cuerpotabla = tablaAtenciones.querySelector("#cuerpoAtenciones");
  //modal de registro de triaje
  const abrirmodalRegistro = document.querySelector("#abrirmodalRegistro");
  const modalTriaje = new bootstrap.Modal(document.querySelector("#registrar-D-historia"));
  let idPersona;
  let idHistoria;
  let dnihistoriaSeleccionada;
  

  
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
                          <a class='ver' id="detalles" href='' type='button' style='text-decoration: none;color: white;' data-idatencion='${element.idHistoriaClinica}' data-dni='${element.numeroDocumento}'>Ver Detalles</a>
                        </button>
                    </div>        
                  </div>
                </div>
              </div>
            </div> 
            `;
        cardHistoria.innerHTML +=nuevoCard;
      });
    });
    cardHistoria.addEventListener("click", (e) => {
    if(e.target.classList[0] === ("ver")){
      historia.style.display = "none";
      detalleHistoria.style.display = "";
      e.preventDefault();
      idHistoria = parseInt(e.target.dataset.idHistoriaClinica);
      dnihistoriaSeleccionada = e.target.dataset.dni;
      buscarDetalles.value = dnihistoriaSeleccionada;
      console.log(dnihistoriaSeleccionada.value);
      listarDetalleHistoria();
      listarAtencionesPaciente();
    }
    });
  }
  
  function listarDetalleHistoria(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listarDetallehistorias");
    parametros.append("nroDocumento", buscarDetalles.value);
    fetch("../controllers/detalleAtencion.php",{
      method:"POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos=>{
      if(datos.length > 0){
        carddetalleHistoria.innerHTML="";
        console.log(datos);
        
        datos.forEach(element => {
          const nuevoCard = `
              <div class="col-md-6" >
                <div class="card">
                  <div class="card-content">
                    <div class="card-header bg-secondary" ></div>
                      <div class="card-body bg-light-secondary" style="text-align: center;">
                          <h4>${element.numeroDocumento}</h4>
                          <h5>${element.apellidoPaterno} ${element.apellidoMaterno},<br>${element.nombres}</h5>
                          <h6>${element.fecha}</h6>
                          <button class='btn bg-secondary m-1' type='button'>
                            <a class='resumen' type='button' style='text-decoration: none;color: white;' data-idatencion='${element.idHistoriaClinica}' data-dni='${element.numeroDocumento}'>Ver Detalles</a>
                          </button>
                      </div>        
                    </div>
                  </div>
                </div>
              </div> 
              `;
          carddetalleHistoria.innerHTML +=nuevoCard;
        });
      }
      else{
        toast("No hay historial del paciente");
      }
    });
  }

  function listarAtencionesPaciente(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listarParaTriaje");
    parametros.append("numeroDocumento",buscarDetalles.value);
    fetch("../controllers/atencion.php",{
      method:"POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos=>{
      if(datos.length > 0){
        console.log(datos);
        cuerpotabla.innerHTML = "";
        datos.forEach(element => {
          let nuevaFila = `
            <tr>
                <td>${element.idAtencion}</td>
                <td>${element.nombreServicio}</td>
                <td>${element.dia}</td>
                <td>
                    <a class ="eliminar btn btn-sm btn-danger">Eliminar</a>
                </td>
            </tr>  
            `;
            cuerpotabla.innerHTML += nuevaFila;

        })
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
        toastCheck("Guardado correctamente");
        modal.toggle();
        listarHistoriaClinicaTodos();
      }
    })
  }
  guardar.addEventListener("click", () => {
    mostrarPregunta("REGISTRAR", "¿Está seguro de guardar?").then((result) => {
      if(result.isConfirmed){
        registrarHitoria();
      
        
      }
    });  
  });
  
  agregarAlergia.addEventListener("click", () => {    
    agregarAlergiaTabla();
  });
  abrirmodalRegistro.addEventListener("click", () => {
    modalTriaje.show();
  });
  
</script>