<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <h1 class="text-center">Lista de Atenciones - Admisión</h1>
        </div>
        <div class="card-body">
            <div class="mb-2 row g-2" id="cardAtencion">         
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalAtenciones" tabindex="-1" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-l" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="row mt-2 mb-3">                
                <div class="col-md-12">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title fw-bolder text-danger text-center mb-4">Resumen de atención</h5>
                            <div class="row mt-2 mb-3">
                                <div class="col-md-12">                                    
                                    <div class="row g-2 mb-3">                             
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Nombre completo: </label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="nombreCompleto"></label>
                                        </div>
                                    </div>      
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">DNI:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="dni"></label>
                                        </div>
                                    </div>   
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Edad:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="edad"></label>
                                        </div>
                                    </div>  
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Teléfono:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="telefono"></label>
                                        </div>
                                    </div> 
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Especialidad:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="especialidad"></label>
                                        </div>
                                    </div> 
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Fecha Atención:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="fechaAtencion"></label>
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-3">
                                            <label class="" for="">Servicio:</label>
                                        </div>
                                        <div class="col-md-6">                                  
                                            <select name="" id="listaServicios" class="form-select form-select-sm">
                                              <option value="">Seleccione</option>
                                            </select> 
                                        </div>
                                        <div class="col-md-3">
                                            <button class="btn btn-sm" id="agregarServicio" type="button"><i class="fa-solid fa-cart-plus fa-2xl" style="color: #f96f12;"></i></button>
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <table id="detallemodal" class="">
                                            <thead>
                                                <tr>
                                                    <th>Servicio</th>
                                                    <th>Total</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="cuerpomodal">
                                                <!-- traer datos  -->
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Total:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control form-control-sm bg-light" id="total" >
                                        </div>
                                    </div>  
                                    
                                </div>                      
                            </div>
                            

                        </div>
                    </div>
                </div>
                
                
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary "   id="md-guardar">Guardar</button>
        </div>
      </div>
    </div>
</div>

<script>

//MODAL
const modalAtencion = new bootstrap.Modal(document.querySelector("#modalAtenciones"));
const detalle = document.querySelector("#detallemodal");
const cuerpomodal = document.querySelector("#cuerpomodal");
const agregarServicio = document.querySelector("#agregarServicio");
//CARDS
const cardAtencion = document.querySelector("#cardAtencion");
const listaServicios = document.querySelector("#listaServicios");
const nombrePaciente = document.querySelector("#nombreCompleto");
const dniPaciente = document.querySelector("#dni");
const edad = document.querySelector("#edad");
const telefono = document.querySelector("#telefono");
const especialidad = document.querySelector("#especialidad");
const fechaAtencion = document.querySelector("#fechaAtencion");
let precio = 0;
let idatencion;
function listarCardsAtencion(){
    const parametros = new URLSearchParams();
    parametros.append("operacion","listarAtenciones");

    fetch("../controllers/atencion.php", {
      method: "POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos => {
      cardAtencion.innerHTML= "";
      datos.forEach(element => {
        idatencion = element.idAtencion;
        console.log(datos);
        const nuevoCard = `
        <div class="col-md-3" >
                <div class="card">
                    <div class="card-content">
                        <div class="card-header bg-info"></div>
                        <div class="card-body" style="text-align: center;">
                            <h5>${element.apellidoPaterno} ${element.apellidoMaterno},<br>${element.nombres}</h5>
                            <div class="servicio">${element.nombreServicio}</div>
                            <div class='mt-2 row g-2'>
                                <div class='col-md-8'>
                                    <h6>S/${element.Total}</h6>
                                </div>
                                <div class="card col-md-4" id="">
                                    <a class="resume" data-idservicio='${element.idServicio}' data-idatencion='${element.idAtencion}'>ver</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        `;
        cardAtencion.innerHTML +=nuevoCard;
      });
    })
  }
  let idServicioModal;
  let idatencionmodal;
  cardAtencion.addEventListener("click", (e) => {
    if(e.target.classList[0] === ("resume")){
        idatencionmodal = parseInt(e.target.dataset.idatencion);
        idServicioModal = e.target.dataset.idservicio;
        console.log(idServicioModal);
        const parametros = new URLSearchParams();
        parametros.append("operacion", "resumenAtencion");
        parametros.append("idatencion", idatencionmodal);

        fetch("../controllers/detalleServicio.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {

            datos.forEach(element => {
                console.log(element);
                nombrePaciente.innerHTML= element.nombres + ", "+ element.apellidoPaterno+" "+element.apellidoMaterno;
                dniPaciente.innerHTML = element.numeroDocumento;
                edad.innerHTML = element.Edad;
                telefono.innerHTML = element.telefono;
                especialidad.innerHTML = element.nombreServicio;
                fechaAtencion.innerHTML = element.fechaAtencion;
                detalleServicios(idatencionmodal);
                listarServiciosFiltro(idServicioModal);
                //totalMedioPago.value = 0;
            })
        })
        .catch(error => console.error('Error al obtener detalles de la cita:', error))
        modalAtencion.toggle();  
    }
  });

  function listarServiciosFiltro(idServicioModal){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "filtroServicios");
    parametros.append("idServicio",idServicioModal);
    fetch("../controllers/servicio.php",{
      method : "POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos => {
      listaServicios.innerHTML = "<option value=''>Seleccione</option>";
      datos.forEach(element => {
      const optionTag = document.createElement("option");
      optionTag.value = element.idservicios_detalle;
      optionTag.text = element.descripcion;
      optionTag.dataset.precio = element.precio; // Agregar el precio como atributo de datos
      optionTag.dataset.genero = element.genero;
      listaServicios.appendChild(optionTag);
      });
      
    })
  }

function detalleServicios(idatencionmodal){
    const parametros = new URLSearchParams();
    parametros.append("operacion","detalle");
    parametros.append("idatencion", idatencionmodal);

    fetch("../controllers/detalleServicio.php",{
        method: 'POST',
        body: parametros
    })
    .then(response => response.json())
    .then(datos => {
        console.log(datos);
        cuerpomodal.innerHTML = ``;
            datos.forEach(element => {
                
                const datos =`
                <tr>
                    <td>${element.descripcion}</td>
                    <td>${element.total}</td>
                    <td><a class="eliminar btn btn-sm btn-primary">Eliminar</a></td>
                </tr>
                `;
            cuerpomodal.innerHTML += datos;
            });
            const btnEliminar = document.querySelectorAll('.eliminar');
            btnEliminar.forEach(boton => {
                //boton.addEventListener('click', eliminarFila);
        });
    })
}

function añadirServicio(){
    const servicioSelect = listaServicios.options[listaServicios.selectedIndex];
    if(servicioSelect.value !== ""){
        precio = parseFloat(servicioSelect.dataset.precio);

        const filasTabla = detalle.rows;
        let servicioRepetido = false;

        for(let i = 1; i<filasTabla.length; i++){
            const descripcion = filasTabla[i].cells[2].innerText;
            if(descripcion === servicioSelect.text){
                servicioRepetido = true;
                break;
            }
        }
        if(!servicioRepetido){
            let nuevaFila = `
                <tr>
                    
                    <td>${servicioSelect.text}</td>
                    <td>${precio}</td>
                    <td>
                        <a class ="eliminar btn btn-sm btn-primary">Eliminar</a>
                    </td>
                </tr>
            `;
            detalle.innerHTML += nuevaFila;
        }else{
            toast("El servicio ya ha sido agregado a la tabla.");
        }
    }else{
        console.log("hay problemas");
    }
}

agregarServicio.addEventListener("click",()=>{
    if(listaServicios.value>0){
        añadirServicio();
    }
});
detalle.addEventListener("click", (e)=> {
    if(e.target.closest(".eliminar")){
        const row = e.target.closest("tr");
        row.remove();
    }
})
listarCardsAtencion();

</script>