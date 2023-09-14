<div class="container-fluid">
  
  <div class="card">
    <div class="card-body">
      <h5 class="card-title fw-semibold mb-4" style="color:#ff7619 ;">Registrar atención de servicios</h5>
      <div class="card">
        <div class="card-body">            
          <form id="form-atenciones">
            <div class="mb-3 row g-2">
              <div class="col-md-10">
                <label for="" class="card-title" style="color:#ff7619 ;">PACIENTE:</label>
              </div>                                                               
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-2">
                <label for="DNI_personas">N° Doc:</label>          
              </div>
              <div class="col-md-3">                                  
              <input class="form-control form-control-sm" id="DNI_personas">                
              </div>
              <div class="col-md-3">
                <button class="btn btn-sm" id="agregarPaciente" data-bs-toggle="modal" data-bs-target="#registrar-personas" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #e66814;"></i></button>
              </div>
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-2">
                <label for="">Nombre completo:</label>          
              </div>
              <div class="col-md-9">                                  
                <input class="form-control form-control-sm" id="nombrePaciente" type="text" readonly>
              </div>
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-2">
                <label for="">Edad:</label>          
              </div>
              <div class="col-md-1">                                  
                <input class="form-control form-control-sm" id="edadPaciente" type="text" readonly>
              </div>
            </div>
            <!-- familiar -->
            <div class="mb-3 row g-2">
              <div class="col-md-10">
                <label for="" class="card-title" style="color:#ff7619 ;">FAMILIAR:</label>
              </div>                                                               
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-2">
                <label for="DNI_familiar">N° Doc: </label>
              </div>
              <div class="col-md-3">
                <input type="text" class="form-control form-control-sm" id="DNI_familiar">
              </div>
              <div class="col-md-3">
                <button class="btn btn-sm" id="agregarPaciente" data-bs-toggle="modal" data-bs-target="#registrar-personas" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #e66814;"></i></button>
              </div>
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-2">
                <label for="">Nombre completo:</label>          
              </div>
              <div class="col-md-9">                                  
                <input class="form-control form-control-sm" id="nombreFamiliar" type="text" readonly>
              </div>
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-2">
                <label for="">Parentesco:</label>          
              </div>
              <div class="col-md-3">                                  
                <input class="form-control form-control-sm" id="parentescoFamilar" type="text">
              </div>
            </div>
            <!-- orden medica -->
            <div class="mb-3 row g-2">
              <div class="col-md-10">
                <label for="" class="card-title" style="color:#ff7619 ;">ORDEN MÉDICA:</label>
              </div>                                                               
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-2">
                <label for="">Doctor:</label>          
              </div>
              <div class="col-md-9">                                  
                <select name="" id="listaOrdenDoctor" class="form-select form-select-sm" >
                  <option value="">Seleccione</option>
                </select> 
              </div>
            </div>
            <!-- servicio -->
            <div class="mb-3 row g-2">
              <div class="col-md-10">
                <label for="" class="card-title" style="color:#ff7619 ;">SERVICIOS:</label>
              </div>                                                               
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-2">
                <label for="">Servicio:</label>          
              </div>
              <div class="col-md-3">                                  
                <select name="" id="listaServicios" class="form-select form-select-sm" >
                  <option value="">Seleccione</option>
                </select> 
              </div>
              <div class="col-md-4">                                  
                <select name="" id="listaServiciosFiltro" class="form-select form-select-sm" >
                  <option value="">Seleccione</option>
                </select> 
              </div>
              <div class="col-md-3">
                <button class="btn btn-sm" id="agregarServicio" type="button"><i class="fa-solid fa-cart-plus fa-2xl" style="color: #f96f12;"></i></button>
              </div>
            </div>
            <div class="row mt-5">
              <div class="col-md-12">
                <table class="table table-sm table-striped table-danger" id="tabla_atenciones_procedimientos">
                  <thead>
                    <tr>
                      <th>Descripción</th>
                      <th>Total</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="mb-3 row g-2 text-end">
              <div class="col-md-11">
                <label for="">SubTotal:</label>          
              </div>
              <div class="col-md-1">                                  
                <input class="form-control form-control-sm" id="subTotal" type="text" readonly>
              </div>
            </div>
            <div class="mb-3 row g-2 text-end">
              <div class="col-md-11">
                <label for="">I.G.V:</label>          
              </div>
              <div class="col-md-1">                                  
                <input class="form-control form-control-sm" id="IGV" type="text" readonly>
              </div>
            </div>
            <div class="mb-3 row g-2 text-end">
              <div class="col-md-11">
                <label for="">Total:</label>          
              </div>
              <div class="col-md-1">                                  
                <input class="form-control form-control-sm" id="total" type="text" readonly>
              </div>
            </div>                          
            <div class="mb-3 row g-2">
              <div class="col-md">
                <div class="d-grid">
                  <button id="agregarAtencion" class="btn btn-danger btn-sm mt-1" type="button">Guardar</button>
                </div> 
              </div>
            </div>                
          </form>

        </div>
      </div>                 
    </div>
  </div> 

</div>
<!-- modal registrar personas usando el API -->
<div class="modal fade" id="registrar-personas" tabindex="-1"  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Paciente</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row mt-2 mb-3">
          <div class="col-md-12">
            <div class="row g-2 mb-3">  
              <form action="" id="form-ganador">
                <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">N° Doc:</label>          
                  </div>                  
                  <div class="col-md-3">                                  
                    <input class="form-control form-control-sm" id="DNIp" type="text" placeholder="88888888">
                  </div>
                  <div class="col-md-3">                                  
                    <button class="btn btn-sm" id="buscar" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #e66814;"></i></button>
                  </div>
                  

                </div>
                <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">Nombres:</label>          
                  </div>
                  <div class="col-md-9">                                  
                    <input class="form-control form-control-sm" id="nombrePersona" type="text" readonly>
                  </div>
                </div>
                <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">Apellidos:</label>          
                  </div>
                  <div class="col-md-9">                                  
                    <input class="form-control form-control-sm" id="apellidosPersona" type="text" readonly>
                  </div>
                </div>
                <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">F. Nac:</label>          
                  </div>
                  <div class="col-md-9">                                  
                    <input class="form-control form-control-sm" id="fechaNacimiento" type="date">
                  </div>
                </div>
                <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">Genero:</label>          
                  </div>
                  <div class="col-md-9">                                  
                    <input class="form-control form-control-sm" id="genero" type="text">
                  </div>
                  <div class="mb-3 row g-2">
                    <div class="col-md-2">
                      <label for="">Telefono:</label>          
                    </div>
                    <div class="col-md-9">                                  
                      <input class="form-control form-control-sm" id="telefono" placeholder="999999999" type="text">
                    </div>
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
  // Pacientes
    const dniPersonas = document.querySelector("#DNI_personas");    
    const nombrePaciente = document.querySelector("#nombrePaciente");    
    const edadPaciente = document.querySelector("#edadPaciente");    

  //Familiar
    const dniFamilar = document.querySelector("#DNI_familiar");
    const nombreFamiliar = document.querySelector("#nombreFamiliar");
    const parentesco = document.querySelector("#parentescoFamilar");

  //Orden Doctor
    const listaOrdenDoctor = document.querySelector("#listaOrdenDoctor");
  
  //Servicios
    const listaServicios = document.querySelector("#listaServicios");
    const listaServiciosFiltro = document.querySelector("#listaServiciosFiltro");

  //Tabla de Resusmen de Servicios
    const tabla_servicios = document.querySelector("#tabla_atenciones_procedimientos");
    const btnagregarServicio = document.querySelector("#agregarServicio");
    let precio;
  
  //Modal API
    const modalRegistrarPersonas = new bootstrap.Modal(document.querySelector("#registrar-personas"));
    const dni = document.querySelector("#DNIp");
    const apellidos = document.querySelector("#apellidosPersona");
    const nombres = document.querySelector("#nombrePersona");
    const buscar = document.querySelector("#buscar");

    function listarEspecialistas(){
      const parametros = new URLSearchParams();
      parametros.append("operacion", "getData");
      parametros.append("estado" , "1");
      fetch("../controllers/especialista.php",{
        method : "POST",
        body: parametros
      })
      .then(response => response.json())
      .then(datos => {
        //console.log(datos);
        listaOrdenDoctor.innerHTML = "<option value=''>Seleccione</option>";
        datos.forEach(element => {
          const optionTag = document.createElement("option");
          optionTag.value = element.idEspecialista;
          optionTag.text = element.ApellidosNombres;
          listaOrdenDoctor.appendChild(optionTag);
        });
      })
    }
    
    function listarServicios(){
      const parametros = new URLSearchParams();
      parametros.append("operacion", "getData");
      fetch("../controllers/servicio.php",{
        method : "POST",
        body: parametros
      })
      .then(response => response.json())
      .then(datos => {
        //console.log(datos);
        listaServicios.innerHTML = "<option value=''>Seleccione</option>";
        datos.forEach(element => {
          const optionTag = document.createElement("option");
          optionTag.value = element.idServicio;
          optionTag.text = element.nombreServicio;
          listaServicios.appendChild(optionTag);
        });
      })
    }

    function listarServiciosFiltro(){
      const parametros = new URLSearchParams();
      parametros.append("operacion", "filtroServicios");
      parametros.append("idServicio",listaServicios.value);
      fetch("../controllers/servicio.php",{
        method : "POST",
        body: parametros
      })
      .then(response => response.json())
      .then(datos => {
        console.log(datos);
        listaServiciosFiltro.innerHTML = "<option value=''>Seleccione</option>";
        datos.forEach(element => {
        const optionTag = document.createElement("option");
        optionTag.value = element.idservicios_detalle;
        optionTag.text = element.descripcion;
        precio = element.precio;
        listaServiciosFiltro.appendChild(optionTag);
        });
      })
    }

    function agregarServicio(){
      const servicioSeleccionado = listaServiciosFiltro.options[listaServiciosFiltro.selectedIndex];
      if (servicioSeleccionado.value !== "") {


        // Crea una nueva fila
        const newRow = tabla_servicios.insertRow();

        // Crea las celdas para descripción y precio
        const cellDescripcion = newRow.insertCell(0);
        const cellPrecio = newRow.insertCell(1);

        
          for(var i = 0,cell; cell = tabla_servicios[i]; i++){
            console.log(`col: ${cell[i].innerText}`);
            if(col.innerText != servicioSeleccionado.text){
              cellDescripcion.innerHTML = servicioSeleccionado.text;
              cellPrecio.innerHTML = precio;
            }else{
              console.log("no se puede repetir");
              alert("no se puede agregar");
            }
          }
        
        // Asigna los valores a las celdas
        
      }
      else{
        console.log("algo anda mal :c");
      }
    }
    

    function consultarPaciente(){
      const parametros = new URLSearchParams();
      parametros.append("operacion", "getData");
      parametros.append("numeroDocumento", dniPersonas.value);
      fetch("../controllers/persona.php", {
        method : "POST",
        body: parametros
      })
      .then(response => response.json())
      .then(datos => {
        console.log(datos);
        if(datos.length>0){

          datos.forEach(element => {
            nombrePaciente.value = element.ApellidosNombres;
            edadPaciente.value = element.Edad;
          });
        }else{
          modalRegistrarPersonas.show();
          dni.value = dniPersonas.value;
        }
      })
    }
    function consultarFamiliar(){
      const parametros = new URLSearchParams();
      parametros.append("operacion", "getData");
      parametros.append("numeroDocumento", dniFamilar.value);
      fetch("../controllers/persona.php", {
        method : "POST",
        body: parametros
      })
      .then(response => response.json())
      .then(datos => {
        console.log(datos);
        if(datos.length>0){
          datos.forEach(element => {
          nombreFamiliar.value = element.ApellidosNombres;
        });
        }else{
          modalRegistrarPersonas.show();
          dni.value = dniFamilar.value;
        }
        
      })
    }
    function consultarDNI() {
      const documento =dni.value;
      const url = `https://dniruc.apisperu.com/api/v1/dni/${documento}?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImpvcmdlbHVpczA0bXMwMkBnbWFpbC5jb20ifQ.8wtTqlkROifFOhvTxMKR7klfD-wpVr3U5AqDtL8LhVw`;

      fetch(url)
        .then(datos => {
          if(datos.status == 200) {
            return datos.text();
          } else {
            throw `Respuesta incorrecta del servidor`; 
          }
        })
        .then(datos => {
          const resultado = JSON.parse(datos);
          console.log(resultado);
          if (resultado.dni == documento) {
            apellidos.value = resultado.apellidoPaterno + ", " + resultado.apellidoMaterno;
            nombres.value = resultado.nombres;
          } else {
            alert(content.message);
          }
        })
        .catch( e => {
          console.error(e);
        });
    }

    buscar.addEventListener("click", consultarDNI);
    
    dniPersonas.addEventListener("keypress", (evt) => {
        if (evt.charCode == 13) consultarPaciente();
    });

    dniFamilar.addEventListener("keypress", (evt) => {
      if (evt.charCode == 13) consultarFamiliar();
    });
    
    listaServicios.addEventListener("change", listarServiciosFiltro);
    btnagregarServicio.addEventListener("click", agregarServicio);
    listarEspecialistas();
    listarServicios();
    
</script>