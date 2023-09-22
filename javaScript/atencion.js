document.addEventListener("DOMContentLoaded", () => {
// Pacientes
const dniPersonas = document.querySelector("#DNI_personas");    
const nombrePaciente = document.querySelector("#nombrePaciente");    
const edadPaciente = document.querySelector("#edadPaciente"); 
let idpersona = 0;   

//Familiar
const dniFamilar = document.querySelector("#DNI_familiar");
const nombreFamiliar = document.querySelector("#nombreFamiliar");
const parentesco = document.querySelector("#parentescoFamilar");
let idfamiliar = 0;

//Orden Doctor
const listaOrdenDoctor = document.querySelector("#listaOrdenDoctor");

//Servicios
const listaServicios = document.querySelector("#listaServicios");
const listaServiciosFiltro = document.querySelector("#listaServiciosFiltro");

//Tabla de Resusmen de Servicios
const tabla_servicios = document.querySelector("#tabla_atenciones_procedimientos");
const btnagregarServicio = document.querySelector("#agregarServicio");
const igv = document.querySelector("#IGV");
const subTotal = document.querySelector("#subTotal");
const total_servicios = document.querySelector("#total");
let precio;

//Modal API
const modalRegistrarPersonas = new bootstrap.Modal(document.querySelector("#registrar-personas"));
const dni = document.querySelector("#DNIp");
const apellidos = document.querySelector("#apellidosPersona");
const nombres = document.querySelector("#nombrePersona");
const buscar = document.querySelector("#buscar");

//Guardar atención
const agregarAtencion = document.querySelector("#agregarAtencion");
const form = document.querySelector("#form-atenciones");

//Guardar servicios detalles
const tablaServicios = document.querySelector("#tabla_atenciones_procedimientos");
const filas = tablaServicios.rows;

function validar(){
  if (!form.checkValidity()) {
      event.preventDefault()
      event.stopPropagation()
      form.classList.add('was-validated');
  }else{
    mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
      if(result.isConfirmed){
        registrarAtencion();
        registrarServiciosDetalles();
      }
    })
  }
}

function registrarAtencion(){
  const parametros = new URLSearchParams();
  parametros.append("operacion", "add");
  parametros.append("turno", "T");
  parametros.append("idusuario", 1);
  parametros.append("idfamiliar", idfamiliar);
  parametros.append("idpersona", idpersona);
  parametros.append("parentesco", parentesco.value);
  parametros.append("orden", listaOrdenDoctor.value);
  fetch("../controllers/atencion.php", {
    method : "POST",
    body : parametros
  })
  .then(response => response.json())
  .then(datos => {
    //if(datos.status){
      form.reset();
    //}
    //else{
     // console.log("algo mal")
    //}
  })
}

function registrarServiciosDetalles() {
const tabla_servicios = document.querySelector("#tabla_atenciones_procedimientos");
const filas = tabla_servicios.rows;

// Crear un array de promesas para almacenar las solicitudes fetch
const promesasFetch = [];

for (let i = 1; i < filas.length; i++) {
const fila = filas[i];
const idservicios_detalle = fila.cells[0].innerHTML;

const parametros = new FormData();
parametros.append("operacion", "add");
parametros.append("idservicios_detalle", idservicios_detalle);

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

// Esperar a que todas las promesas fetch se completen antes de mostrar "Registrado"
Promise.all(promesasFetch)
.then(() => {
  console.log("Todos los detalles registrados.");
})
.catch(error => {
  console.error("Error al registrar uno o más detalles.", error);
});
}


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

function agregarServicio() {
  const servicioSeleccionado = listaServiciosFiltro.options[listaServiciosFiltro.selectedIndex];

  if (servicioSeleccionado.value !== "") {
    // Verificar si el servicio ya está en la tabla
    const tablaFilas = tabla_servicios.rows;
    let servicioRepetido = false;

    for (let i = 1; i < tablaFilas.length; i++) {
      const descripcionCelda = tablaFilas[i].cells[0].innerText;
      console.log(descripcionCelda);
      if (descripcionCelda === servicioSeleccionado.text) {
        servicioRepetido = true;
        break;
      }
    }

    if (!servicioRepetido) {
      // Crea una nueva fila
      const newRow = tabla_servicios.insertRow();

      // Crea las celdas para descripción y precio
      const cellDescripcion = newRow.insertCell(0);
      const cellPrecio = newRow.insertCell(1);

      // Asigna los valores a las celdas
      cellDescripcion.innerHTML = servicioSeleccionado.text;
      cellPrecio.innerHTML = precio;
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
    const precioCelda = parseFloat(tablaFilas[i].cells[1].innerText);
    total += precioCelda;
    

  }
  tigv = total*0.18;
  tsubTotal = total-tigv;
  // Mostrar el total en la caja de texto
  total_servicios.value = total.toFixed(2); // Formatear el total a 2 decimales
  igv.value = tigv.toFixed(2);
  subTotal.value = tsubTotal.toFixed(2);
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
    if(datos.length>0){

      datos.forEach(element => {
        idpersona = element.idPersona;
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

function limpiarSelect(){
  listaServicios.selectedIndex = 0;
  listaServiciosFiltro.selectedIndex = 0;
}

buscar.addEventListener("click", consultarDNI);

dniPersonas.addEventListener("keypress", (evt) => {
    if (evt.charCode == 13) consultarPaciente();
});

dniFamilar.addEventListener("keypress", (evt) => {
  if (evt.charCode == 13) consultarFamiliar();
});

listaServicios.addEventListener("change", listarServiciosFiltro);

btnagregarServicio.addEventListener("click", () => {
  if(listaServiciosFiltro.value >0){
    agregarServicio();
    calcularTotal();
    limpiarSelect();
  }
  else{
    notificar("Seleccione el servicio", "Ingrese un valor", 2);
  }
  
});

agregarAtencion.addEventListener("click", validar)

dniFamilar.addEventListener('input', ()=>{
  const dniFamiliarValue = dniFamilar.value;

  // Verificar si el campo dniFamiliar tiene datos
  if (dniFamiliarValue.length > 0) {
  // Habilitar el campo parentesco para edición
  parentesco.disabled = false;
  } else {
  // Deshabilitar el campo parentesco si no hay datos en dniFamiliar
  parentesco.disabled = true;
}
});

listarEspecialistas();
listarServicios();

})