<div class="container-fluid border-0">
  
  <div class="card border-0">
    <div class="card-body border-0">
      <div class="row">
        <div class="col-md-11">
          <h2 class="fw-semibold mb-4 text-center" style="color:#ff7619 ;">REGISTRAR ATENCIÓN DE SERVICIOS</h2>
        </div>
        <div class="col-md-1">
          <button type="button" class="btn btn-sm" id="limpiar"><i class="fa-solid fa-trash-can fa-2xl" style="color: #f96f12;"></i></button>
        </div>
      </div>
      
      <div class="card border-0">
        <div class="card-body">            
          <form id="form-atenciones" class="needs-validation">
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
                <input class="form-control form-control-sm" id="DNI_personas" placeholder="12345678" maxlength="10" type="tel" required>
                <div class="invalid-feedback">
                  Complete este campo para continuar
                </div>       
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
                <input class="form-control form-control-sm bg-light" id="nombrePaciente" type="text" readonly>
              </div>
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-2">
                <label for="">Edad:</label>          
              </div>
              <div class="col-md-1">                                  
                <input class="form-control form-control-sm bg-light" id="edadPaciente" type="text" readonly>
              </div>
              <div class="col-md-2">                                  
                <input class="form-control form-control-sm bg-light" id="mesesAños" type="text" readonly></input>
              </div>
              <div class="col-md-2">
                <button class="btn btn-sm" style="background-color: #ff7619; color: white;" id="ordenMedica" type="button">Orden médica</button>
              </div>
            </div>
            
            <!-- familiar -->
            <div id="familiar" style="display: none;">
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
                <input type="text" class="form-control form-control-sm" id="DNI_familiar" placeholder="12345678" maxlength="10" type="tel">
              </div>
              <div class="col-md-3">
                <button class="btn btn-sm" id="agregarPaciente" data-bs-toggle="modal" data-bs-target="#registrar-personas" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #e66814;"></i></button>
              </div>
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-2">
                <label for="nombreFamiliar">Nombre completo:</label>          
              </div>
              <div class="col-md-9">                                  
                <input class="form-control form-control-sm bg-light" id="nombreFamiliar" type="text" readonly>
              </div>
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-2">
                <label for="">Parentesco:</label>          
              </div>
              <div class="col-md-3">
                <select name="" id="parentescoFamilar" class="form-select form-select-sm">
                  <option value="">Seleccione</option>
                  <option value="Mamá">Mamá</option>
                  <option value="Papá">Papá</option>
                  <option value="Hermano/a">Hermano/a</option>
                  <option value="Tio/a">Tio/a</option>
                  <option value="Otro">Otro</option>
                </select>                                 
                <!--<input class="form-control form-control-sm" id="parentescoFamilar" type="text" maxlength="100" disabled>-->
              </div>
              <div class="col-md-3" id="divOtroFamiliar" style="display: none;">
                <input type="text" class="form-control form-control-sm" id="otroFamiliar" placeholder="Ingrese Familiar" maxlength="80">
              </div>
            </div>
            </div>
            <!-- orden medica -->
            <div id="ordenM" style="display: none;">
              <div class="mb-3 row g-2">
                <div class="col-md-10">
                  <label for="" class="card-title" style="color:#ff7619 ;">ORDEN MÉDICA:</label>
                </div>                                                               
              </div>
              <div class="mb-3 row g-2">
                <div class="col-md-2">
                  <label for="">Doctor:</label>          
                </div>
                <div class="col-md-3">                                  
                  <select name="" id="listaEspecialidades" class="form-select form-select-sm" >
                    <option value="">Seleccione</option>
                  </select> 
                </div>
                <div class="col-md-4">                                  
                  <select name="" id="listaOrdenDoctor" class="form-select form-select-sm" >
                    <option value="">Seleccione</option>
                  </select> 
                </div>

              </div>
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-10">
                <label for="" class="card-title" style="color:#ff7619 ;">FECHA:</label>
              </div>                                                               
            </div>
            <div class="mb-3 row g-2">
              <div class="col-md-2">
                <label for="">Fecha atención:</label>          
              </div>
              <div class="col-md-3">                                  
                <input type="date" class="form-control form-control-sm" id="FechaActual" >
              </div>
            </div>
            <!-- servicio -->
            <div class="mb-3 row g-2">
              <div class="col-md-10">
                <label for="" class="card-title" style="color:#ff7619 ;">SERVICIOS:</label>
              </div>                                                               
            </div>
            <div class="row g-2">
              <div class="col-md-3">
                <label for="">Servicio:</label>          
              </div>
              <div class="col-md-5">
                <label for="">Procedimiento:</label>          
              </div>
              <div class="col-md-3">
                <label for="">Precio:</label>          
              </div>
            </div>

            <div class="mb-3 row g-2">              
              <div class="col-md-3">                                  
                <select name="" id="listaServicios" class="">
                  <option value="">Seleccione</option>
                </select> 
              </div>
              <div class="col-md-5">                                  
                <select name="" id="listaServiciosFiltro" class="">
                  <option value="">Seleccione</option>
                </select> 
              </div>
              <div class="col-md-1">                                  
                <input type="text"  class="form-control form-control-sm" id="precioProce" readonly >
              </div>
              <div class="col-md-1">                                  
                <input type="text"  class="form-control form-control-sm" id="generoProce" readonly >
              </div>
              <div class="col-md-1">
                <button class="btn btn-sm" id="agregarServicio" type="button"><i class="fa-solid fa-cart-plus fa-2xl" style="color: #f96f12;"></i></button>
              </div>
            </div>
            <div class="row mt-5">
              <div class="col-md-12 mb-2">
                <table class="table table-sm " id="tabla_atenciones_procedimientos">
                  <colgroup>
                    <col width="10%"> <!-- # -->
                    <col width="60%"> <!-- titulo -->
                    <col width="20%"> <!-- precio-->
                    <col width="10%"> <!-- eliminar-->
                  </colgroup>
                  <thead class="thead-danger">
                    <tr>
                      <th>Servicio</th>
                      <th>id</th>
                      <th>Descripción</th>
                      <th>Precio</th>
                      <th>Eliminar</th>
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
                <input class="form-control form-control-sm bg-light" id="subTotal" type="text" readonly>
              </div>
            </div>
            <div class="mb-3 row g-2 text-end">
              <div class="col-md-11">
                <label for="">I.G.V:</label>          
              </div>
              <div class="col-md-1">                                  
                <input class="form-control form-control-sm bg-light" id="IGV" type="text" readonly>
              </div>
            </div>
            <div class="mb-3 row g-2 text-end">
              <div class="col-md-11">
                <label for="">Total:</label>          
              </div>
              <div class="col-md-1">                                  
                <input class="form-control form-control-sm bg-light" id="total" type="text" readonly>
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
              <form action="" id="form-paciente">
              <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">Tipo Doc.</label>          
                  </div>
                  <div class="col-md-9">
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" checked name="inlineRadioOptions" id="rbDni" value="N">
                      <label class="form-check-label">DNI</label>
                    </div>
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rbCarnet"  value="E">
                      <label class="form-check-label">Carnet Extranjeria</label>
                    </div>
                  </div>
                </div>
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
                    <input class="form-control form-control-sm" id="nombrePersona" type="text" >
                  </div>
                </div>
                <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">Apellido Paterno:</label>          
                  </div>
                  <div class="col-md-9">                                  
                    <input class="form-control form-control-sm" id="apellidosPaternoPersona" type="text" >
                  </div>
                </div>
                <div class="mb-3 row g-2">
                  <div class="col-md-2">
                    <label for="">Apellido Materno:</label>          
                  </div>
                  <div class="col-md-9">                                  
                    <input class="form-control form-control-sm" id="apellidosMaternoPersona" type="text" >
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
                    <div class="form-check form-check-inline">                           
                      <input class="form-check-input" type="radio" name="options" id="rbFemenino" value="F">
                        <label class="form-check-label">Femenino</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="options" id="rbMasculino" value="M">
                        <label class="form-check-label">Masculino</label>
                    </div>
                  </div>
                  <div class="mb-3 row g-2">
                    <div class="col-md-2">
                      <label for="">Telefono:</label>          
                    </div>
                    <div class="col-md-9">                                  
                      <input class="form-control form-control-sm"  maxlength="9" id="telefono" placeholder="999999999" type="text">
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
//ocultar
const divOrden = document.querySelector("#ordenM");
const mostrarOrden = document.querySelector("#ordenMedica");
const divFamiliar = document.querySelector("#familiar");
const mostrarFamiliar = document.querySelector("#mostrarFamiliar");
const añosMeses = document.querySelector("#mesesAños");

// Pacientes
const dniPersonas = document.querySelector("#DNI_personas");    
const nombrePaciente = document.querySelector("#nombrePaciente");    
const edadPaciente = document.querySelector("#edadPaciente"); 
let idpersona = 0;   

//Familiar
const dniFamiliar = document.querySelector("#DNI_familiar");
const nombreFamiliar = document.querySelector("#nombreFamiliar");
const parentesco = document.querySelector("#parentescoFamilar");
const divOtroFamiliar = document.querySelector("#divOtroFamiliar");
const otroFamiliar = document.querySelector("#otroFamiliar");
let idfamiliar = 0;

//Orden Doctor
const listaEspecialidades = document.querySelector("#listaEspecialidades");
const listaOrdenDoctor = document.querySelector("#listaOrdenDoctor");

//Servicios
const listaServicios = document.getElementById("listaServicios");
const listaServiciosFiltro = document.querySelector("#listaServiciosFiltro");
const precioProce = document.querySelector("#precioProce");
const generoProce = document.querySelector("#generoProce");

//Tabla de Resusmen de Servicios
const tabla_servicios = document.querySelector("#tabla_atenciones_procedimientos");
const btnagregarServicio = document.querySelector("#agregarServicio");
const igv = document.querySelector("#IGV");
const subTotal = document.querySelector("#subTotal");
const total_servicios = document.querySelector("#total");
let precio = 0;
let genero= "";

//Modal API
const modalRegistrarPersonas = new bootstrap.Modal(document.querySelector("#registrar-personas"));
const dni = document.querySelector("#DNIp");
const apellidoPaterno = document.querySelector("#apellidosPaternoPersona");
const apellidoMaterno = document.querySelector("#apellidosMaternoPersona");
const nombres = document.querySelector("#nombrePersona");
const fechanacimiento = document.querySelector("#fechaNacimiento");
const telefono = document.querySelector("#telefono");
const buscar = document.querySelector("#buscar");
const guardarRegistro = document.querySelector("#md-guardar");
const formPaciente = document.querySelector("#form-paciente");
//Guardar atención
const fecha = document.querySelector("#FechaActual");
const agregarAtencion = document.querySelector("#agregarAtencion");
const form = document.querySelector("#form-atenciones");
//limpiar
const limpiar = document.querySelector("#limpiar");
let fechaHoy;
function obtenerFecha(){
  const fechaAhora = new Date();
  const año = fechaAhora.getFullYear();
  const mes = (fechaAhora.getMonth() + 1).toString().padStart(2,"0");
  const dia = fechaAhora.getDate().toString().padStart(2, "0");

  const fechaTotal = `${año}-${mes}-${dia}`;
  fecha.value = fechaTotal;
  fechaHoy = fechaTotal;
  console.log(fecha.value);
}
obtenerFecha();

function mostrardivOrden(){
  var presionar=1;
  if(presionar == 1){
    divOrden.style.display = "";
    presionar = presionar+1;
  }else{
    divOrden.style.display = "none";
    presionar = 1
  }
}

function registrarPaciente(){
  const tipoDocumento = document.querySelector('input[name="inlineRadioOptions"]:checked');
  if (!tipoDocumento) {
      alert("Por favor, selecciona un tipo de documento.");
      return;  // No hay opción seleccionada, no continuamos
  }
  const genero = document.querySelector('input[name="options"]:checked');
  if (!genero) {
    alert("Por favor, seleccione un genero");
    return;  // No hay opción seleccionada, no continuamos
  }
  const parametros = new URLSearchParams();
  parametros.append("operacion", "registrarPersona");
  parametros.append("nombres", nombres.value);
  parametros.append("apellidoPaterno",apellidoPaterno.value);
  parametros.append("apellidoMaterno",apellidoMaterno.value);
  parametros.append("tipoDocumento", tipoDocumento.value);
  parametros.append("numeroDocumento", dni.value);
  parametros.append("fechaNacimiento", fechanacimiento.value);
  parametros.append("genero", genero.value);
  parametros.append("telefono", telefono.value);
  fetch("../controllers/persona.php", {
    method : "POST",
    body : parametros
  })
  .then(response => response.json())
  .then(datos => {
    if(datos.status){
      toastCheck("Guardado Correctamente");   
      modalRegistrarPersonas.toggle();
      formPaciente.reset();
    }else{
      alert(datos.mensaje);
    }
  })
  .catch(error => {
    alert("Error al guardar")
  })
}

function validar(){
  if (!form.checkValidity()) {
      event.preventDefault()
      event.stopPropagation()
      form.classList.add('was-validated');
  }else{
    if(edadPaciente.value <18){
      if(!dniFamiliar.value){
        toast("Por favor, ingrese el DNI del familiar");
        return;
      }
      if(!parentesco.value || parentesco.value === "Seleccione"){
        toast("Por favor, seleccione el parentesco del familiar.");
        return;
      }
    }
    const filasDatos = tabla_servicios.querySelectorAll('tbody tr');
    if (filasDatos.length < 1) {
      toast('Agregue al menos un servicio.');
    } else {
      mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
        if(result.isConfirmed){
          validarFecha();  
        }
        else{
          console.log("validar fecha error");
        }
      })
    }
  }
}

function validarFecha(){
  const fechaActual = new Date();
  const fechaQuince = new Date(fechaActual);
  fechaQuince.setDate(fechaQuince.getDate() + 15);
  if(fecha.value < fechaHoy){
    notificar("POLICLINICO SOLIDARIO CHINCHA", "La fecha ingresada no puede ser menor a la fecha Actual", 3000);
  
  }else if(fecha.value > fechaQuince){
    notificar("POLICLINICO SOLIDARIO CHINCHA", "La fecha ingresada no puede ser mayor a dentro de 15 dias", 3000);
  }else{
    registrarAtencion();
  }
}

function registrarAtencion(){
  let listaParentesco = parentesco.value;
  const parentescoF = listaParentesco === "Otro" ? otroFamiliar.value : listaParentesco;
  const parametros = new URLSearchParams();
  parametros.append("operacion", "add");
  parametros.append("turno", "T");
  parametros.append("idusuario", 1);
  parametros.append("idfamiliar", idfamiliar);
  parametros.append("idpersona", idpersona);
  parametros.append("parentesco", parentescoF);
  parametros.append("orden", listaOrdenDoctor.value);
  parametros.append("fechaAtencion", fecha.value); // arreglar
  fetch("../controllers/atencion.php", {
    method : "POST",
    body : parametros
  })
  .then(response => response.json())
  .then(datos => {
      registrarServiciosDetalles();
      toastCheck("Guardado correctamente"); 
      form.reset();
      listarServicios();
      listarServiciosFiltro();
      limpiarTabla();
      obtenerFecha();
  })
}

function registrarServiciosDetalles() {
  const tabla_servicios = document.querySelector("#tabla_atenciones_procedimientos");
  const filas = tabla_servicios.rows;
  // Crear un array de promesas para almacenar las solicitudes fetch
  const promesasFetch = [];
  for (let i = 1; i < filas.length; i++) {
  const fila = filas[i];
  const idservicios_detalle = fila.cells[1].innerHTML;

  const parametros = new URLSearchParams();
  parametros.append("operacion", "add");
  parametros.append("idServicioDetalle", idservicios_detalle);

  // Agregar la solicitud fetch al array de promesas
  const fetchPromise = fetch("../controllers/detalleServicio.php", {
    method: "POST",
    body: parametros
  })
  .then(response => {
    if (response.ok) {
      // Si la respuesta es exitosa, puedes realizar acciones adicionales aquí si es necesario.
      console.log(`Detalle ${idservicios_detalle} registrado con éxito.`);
    } else {
      // Manejar errores de solicitud aquí
      console.error(`Error al registrar el detalle ${idservicios_detalle}.`);
    }
  })
  .catch(error => {
    // Manejar errores de red aquí
    console.error(`Error de red al registrar el detalle ${idservicios_detalle}.`, error);
  });

  promesasFetch.push(fetchPromise);
  }
}

function limpiarTodo(){
  limpiarSelect();
  limpiarTabla();
  form.reset();
  obtenerFecha();
}

function limpiarSelect(){
  listarServiciosFiltro();
  listarServicios();
}

function limpiarTabla() {
  const filasDatos = tabla_servicios.querySelectorAll('tbody tr');
  // Itera sobre las filas de datos y elimínalas
  filasDatos.forEach((fila) => {
    fila.remove();
  });

  calcularTotal(); 
}
// div orden doctor
function listarEspecialidades(){
  const parametros = new URLSearchParams();
  parametros.append("operacion", "listarEspecialidades");
  fetch("../controllers/servicio.php",{
    method: "POST",
    body: parametros
  })
  .then(response => response.json())
  .then(datos => {
    listaEspecialidades.innerHTML = "<option value=''>Seleccione</option>";
    datos.forEach(element=>{
      const optionTag = document.createElement("option");
      optionTag.value = element.idServicio;
      optionTag.text = element.nombreServicio;
      listaEspecialidades.appendChild(optionTag);
    });
  })
}
function listarEspecialistas(){
  const parametros = new URLSearchParams();
  parametros.append("operacion", "filtroDoctores");
  parametros.append("idServicio" , listaEspecialidades.value);
  fetch("../controllers/servicio.php",{
    method : "POST",
    body: parametros
  })
  .then(response => response.json())
  .then(datos => {
    listaOrdenDoctor.innerHTML = "<option value=''>Seleccione</option>";
    datos.forEach(element => {
      const optionTag = document.createElement("option");
      optionTag.value = element.idEspecialistasServicios;
      optionTag.text = element.NombreCompleto;
      listaOrdenDoctor.appendChild(optionTag);
    });
  })
}
//Agregar servicios a la tabla
function listarServicios() {
  const choiselistaServicios = new Choices(listaServicios, {
    searchEnabled: true,
    itemSelectText: '',
    allowHTML: true
  });

  const parametros = new URLSearchParams();
  parametros.append("operacion", "getData");

  fetch("../controllers/servicio.php", {
    method: "POST",
    body: parametros
  })
    .then(response => response.json())
    .then(datos => {
      listaServicios.innerHTML = "<option value=''>Seleccione</option>";

      datos.forEach(element => {
        const optionTag = document.createElement("option");
        optionTag.value = element.idServicio;
        optionTag.text = element.nombreServicio;
        listaServicios.appendChild(optionTag);
      });

      choiselistaServicios.setChoices([], 'value', 'label', true); // Vacía las opciones
      choiselistaServicios.setChoices(datos, 'idServicio', 'nombreServicio', true); // Agrega las nuevas opciones
      
    });
}

const choiseFiltro = new Choices(listaServiciosFiltro, {
    searchEnabled: true,
    itemSelectText: '',
    allowHTML: true
  });

//let precioProcedimiento;
function listarServiciosFiltro() {
  const parametros = new URLSearchParams();
  parametros.append("operacion", "filtroServicios");
  parametros.append("idServicio", listaServicios.value);

  fetch("../controllers/servicio.php", {
    method: "POST",
    body: parametros
  })
    .then(response => response.json())
    .then(datos => {
      listaServiciosFiltro.innerHTML = "<option value=''>Seleccione</option>";
      choiseFiltro.setChoices([], 'value', 'label', true); // Vacía las opciones
      choiseFiltro.setChoices(datos, 'idservicios_detalle', 'descripcion','precio', true); // Agrega las nuevas opciones
      
    });
    
}

listarServicios();
listaServicios.addEventListener("change", () => {
  choiseFiltro.setChoices([], 'value', 'label', true); // Vacía las opciones
  listarServiciosFiltro();
  
});
listaServiciosFiltro.addEventListener("change", () => {
  generoPrecio();
});


function generoPrecio(){
  const parametros = new URLSearchParams();
  parametros.append("operacion", "precioGenero");
  parametros.append("idservicios_detalle", listaServiciosFiltro.value);

  fetch("../controllers/serviciosDetalle.php", {
    method: "POST",
    body: parametros
  })
    .then(response => response.json())
    .then(datos => {
      precioProce.value = "";

      datos.forEach(element => {
        precioProce.value = element.precio;
        generoProce.value = element.genero;
      });
    });
}

function validarGenero(){
  console.log(generoPaciente);
  console.log(generoProce.value);

  if(generoProce.value == generoPaciente || generoProce.value == ""){
    validarEspecialidadServicio();
  }else{
    notificar("POLICLINICO SOLIDARIO DE CHINCHA","SERVICIO NO DISPONIBLE", 3000 );

  }
}

function validarEspecialidadServicio(){
  const servicioSeleccionado  = listaServicios.options[listaServicios.selectedIndex];
  const filas = tabla_servicios.rows;
  let especialidad = false;
  
  for(let i = 1; i < filas.length; i++){
    const idservicioEspecialidad = filas[i].cells[0].innerText;
    if(idservicioEspecialidad != servicioSeleccionado.value){
      especialidad = true;
      break;
      console.log(idservicioEspecialidad);
      console.log(servicioSeleccionado.value);      
    }
  }
  if(!especialidad){
    agregarServicio();
  } 
  else{
    mostrarPregunta("ADVERTENCIA", "Si cambia el servicio se reseteara la tabla").then((result) => {
      if(result.isConfirmed){
        limpiarTabla(); 
      }
    })
  }
}

function agregarServicio() {
  const servicioSeleccionado = listaServiciosFiltro.options[listaServiciosFiltro.selectedIndex];

  if (servicioSeleccionado.value !== "") {
    // Obtener el precio del servicio seleccionado desde el atributo de datos
    // Verificar si el servicio ya está en la tabla
    const tablaFilas = tabla_servicios.rows;
    let servicioRepetido = false;

    for (let i = 1; i < tablaFilas.length; i++) {
      const descripcionCelda = tablaFilas[i].cells[2].innerText;
      if (descripcionCelda === servicioSeleccionado.text) {
        servicioRepetido = true;
        break;
      }
    }

    if (!servicioRepetido) {
      // Crea una nueva fila
      let newRow = `
        <tr>
          <td>${listaServicios.value}</td>
          <td>${listaServiciosFiltro.value}</td>
          <td>${servicioSeleccionado.text}</td>
          <td>${precioProce.value}</td>
          <td>
            <a class ="eliminar btn btn-sm btn-danger">Eliminar</a>
          </td>
        </tr>    
      `;
      tabla_servicios.innerHTML += newRow;
      calcularTotal();
    } else {
      toast("El servicio ya ha sido agregado a la tabla.");
    }
  } else {
    console.log("algo anda mal :c");
  }
}



function calcularTotal() {
  const tablaFilas = tabla_servicios.rows;
  let total = 0, tigv = 0;tsubTotal = 0 ;

  for (let i = 1; i < tablaFilas.length; i++) {

    const precioCelda = parseFloat(tablaFilas[i].cells[3].innerText);
    total += precioCelda;
    

  }
  tigv = total*0.18;
  tsubTotal = total-tigv;
  // Mostrar el total en la caja de texto
  total_servicios.value = total.toFixed(2); // Formatear el total a 2 decimales
  igv.value = tigv.toFixed(2);
  subTotal.value = tsubTotal.toFixed(2);
}

let generoPaciente;
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
    if(datos.length>0){

      datos.forEach(element => {
        idpersona = element.idPersona;
        nombrePaciente.value = element.ApellidosNombres;
        if(element.Edad == 1){
          edadPaciente.value = element.Edad ;
          añosMeses.value = "Año";
        }else if(element.Edad > 1){
          edadPaciente.value = element.Edad ;
          añosMeses.value = "Años";
        }else if(element.Edad == 0){
          if(element.meses == 1){
            edadPaciente.value = element.meses;
          añosMeses.value = "Mes";
          }else{
            edadPaciente.value = element.meses;
          añosMeses.value = "Meses";
          }
        }
        generoPaciente = element.genero;
      });
    }else{
      modalRegistrarPersonas.show();
      dni.value = dniPersonas.value; 
    }
    if(edadPaciente.value <18){
      divFamiliar.style.display = "";
    }else if(edadPaciente.value >65){
      divFamiliar.style.display = "";
    }else if(edadPaciente.value){
      divFamiliar.style.display = "none";
    }
  })
}

function consultarFamiliar(){
  const parametros = new URLSearchParams();
  parametros.append("operacion", "getData");
  parametros.append("numeroDocumento", dniFamiliar.value);
  fetch("../controllers/persona.php", {
    method: 'POST',
    body: parametros
  })
  .then(response => response.json())
  .then(datos =>{
    if(datos.length>0){
      datos.forEach(element =>{
        idfamiliar = element.idPersona;
        nombreFamiliar.value = element.ApellidosNombres;
      });
    }else{
      modalRegistrarPersonas.show();
      dni.value = dniFamiliar.value;
      buscar.click();
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
        apellidoPaterno.value = resultado.apellidoPaterno;
        apellidoMaterno.value = resultado.apellidoMaterno;
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


dniFamiliar.addEventListener("keypress", (evt) => {
  if(evt.charCode == 13) consultarFamiliar();
    parentesco.disabled = false;
});


listaEspecialidades.addEventListener("change", listarEspecialistas);

btnagregarServicio.addEventListener("click", () => {
  if(listaServiciosFiltro.value >0){
    validarGenero();
    limpiarSelect();
  }
  else{
    notificar("Seleccione el servicio", "Ingrese un valor", 2);
  }
  
});
limpiar.addEventListener("click", limpiarTodo);

agregarAtencion.addEventListener("click", validar);

tabla_servicios.addEventListener("click", (e)=>{
  if (e.target.closest(".eliminar")) {
        const row = e.target.closest("tr");
        row.remove();
        calcularTotal();
      }
});

parentesco.addEventListener("change", function(){
  const valorSeleccionado = parentesco.value;
  if(valorSeleccionado ==="Otro"){
    divOtroFamiliar.style.display = "block";
  } else{
    divOtroFamiliar.style.display ="none";
  }
});
listarEspecialistas();

calcularTotal();
listarEspecialidades();
guardarRegistro.addEventListener("click", registrarPaciente);
mostrarOrden.addEventListener("click", mostrardivOrden);
</script>