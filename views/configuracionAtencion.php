<?php require_once 'permisos.php'; ?>
<div class="container-fluid">
    <div class="card">
        <div class="card-header bg-white">
            <h1 class="text-center">Configuración</h1>
        </div>
        <ul class="mt-2 nav nav-pills user-profile-tab justify-content-end mt-2 bg-light-info rounded-2" id="pills-tab" role="tablist" >
            <li class="nav-item" role="presentation">
                <button class="nav-link position-relative rounded-0 active d-flex align-items-center justify-content-center  bg-transparent fs-3 py-6" id="pills-servicios-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="true">
                    <i class="ti ti-stethoscope  me-2 fs-6"></i>
                    <span class="d-none d-md-block">Servicios</span>
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-doctores-tab" data-bs-toggle="pill" data-bs-target="#pills-friends" type="button" role="tab" aria-controls="pills-friends" aria-selected="false" tabindex="-1">
                    <i class="ti ti-first-aid-kit me-2 fs-6"></i>
                    <span class="d-none d-md-block">Doctores</span>
                </button>
            </li>
        </ul>
    </div>
    <div class="tab-content" id="pills-tabContent">
        <div class="tab-pane fade show active" id="pills-profile" role="tabpanel" aria-labelledby="pills-servicios-tab" tabindex="0">
            <div class="d-sm-flex align-items-center justify-content-between mt-3 mb-4">
                <h3 class="mb-3 mb-sm-0 fw-semibold d-flex align-items-center">Información Personal</h3>
            </div>  
            <div class="row">
                <div class="card">
                    <div class="mb-2 row g-2">
                        <!--Registrar servicios-->
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-header bg-info text-white">SERVICIO:</div>
                                    <div class="card-body">
                                        <form id="form-servicio" autocomplete="off">
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-2">
                                                    <label for="">Tipo:</label>          
                                                </div>
                                                <div class="col-md-9">       
                                                    <div class="form-check form-check-inline">                           
                                                    <input class="form-check-input" type="radio" name="options" id="rbServicio" value="S">
                                                        <label class="form-check-label">Servicio</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="options" id="rbEspecialidad" value="E">
                                                        <label class="form-check-label">Especialidad</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="form-floating">
                                                    <input type="text" class="form-control border"  placeholder="Nombre Completo" id="nombreServicio" type="text" required>
                                                    <label for="">
                                                        Nombre Servicio
                                                    </label> 
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-6">
                                                    <button type="button" class="btn btn-primary" id="guardarServicio">Guardar</button>
                                                </div>
                                                <div class="col-md-6">
                                                    <button type="reset" class="btn btn-danger" id="cancelarServicio">Cancelar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <!--Registrar detalle de servicios-->
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-header bg-info text-white">DETALLE DE SERVICIO:</div>
                                    <div class="card-body">
                                        <form id="form-detalles" autocomplete="off">
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label for="">Servicio:</label>          
                                                </div>
                                                <div class="col-md-8">                                  
                                                    <select name="" id="listaServicios" class="">
                                                    <option value="">Seleccione</option>
                                                    </select> 
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label for="">Descripción:</label>          
                                                </div>
                                                <div class="col-md-8">
                                                    <input class="form-control" id="descripcionServicio" type="tex" required>
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label for="">Precio:</label>          
                                                </div>
                                                <div class="col-md-8">
                                                    <input class="form-control" id="precioServicio" type="number" required>
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label for="">Género:</label>          
                                                </div>
                                                <div class="col-md-8">       
                                                    <div class="form-check form-check-inline">                           
                                                    <input class="form-check-input" type="radio" name="options" id="rbAmbos" value="" checked>
                                                        <label class="form-check-label">Ambos</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="options" id="rbFemenino" value="F">
                                                        <label class="form-check-label">Femenino</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="options" id="rbMasculino" value="M">
                                                        <label class="form-check-label">Masculino</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="colmd-6"></div>
                                                <div class="col-md-3">
                                                    <button type="button" class="btn btn-primary" id="guardarDetalle">Guardar</button>
                                                </div>
                                                <div class="col-md-3">
                                                    <button type="button" class="btn btn-danger" id="cancelarDetalle">Cancelar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>              
                    </div>
                </div>
            </div>         
        </div>
        <div class="tab-pane fade" id="pills-friends" role="tabpanel" aria-labelledby="pills-doctores-tab" tabindex="0">
            <div class="d-sm-flex align-items-center justify-content-between mt-3 mb-4">
                <h3 class="mb-3 mb-sm-0 fw-semibold d-flex align-items-center">Cambiar contraseña:</h3>
            </div> 
            <div class="row">
                <div class="card">
                    <div class="mb-2 row g-2">
                        <!--Registrar especialistas-->
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-header bg-info text-white">AGREGAR ESPECIALISTAS:</div>
                                    <div class="card-body">
                                        <form id="form-especialistas" autocomplete="off">
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label for="">DNI:</label>          
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="number" class="form-control border bg-light" id="dni" placeholder="N° Documento" maxlength="10" required>
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label for="">Persona:</label>          
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control border bg-light"  placeholder="Nombre Completo" id="nombre" readonly>
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label for="">Código medico:</label>          
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control border bg-light"  placeholder="Código medico" id="codigo">
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="colmd-6"></div>
                                                <div class="col-md-3">
                                                    <button type="button" class="btn btn-primary" id="guardarEspecialista">Guardar</button>
                                                </div>
                                                <div class="col-md-3">
                                                    <button type="reset" class="btn btn-danger">Cancelar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Registrar especialistas a servicios-->
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-header bg-info text-white">AGREGAR ESPECIALISTAS A SERVICIOS:</div>
                                    <div class="card-body">
                                        <form id="form-espSer" autocomplete="off">
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label for="">ESPECIALISTAS:</label>          
                                                </div>
                                                <div class="col-md-9">                                  
                                                    <select name="" id="especialistaSelect" class="" required>
                                                    <option value="">Seleccione</option>
                                                    </select> 
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label for="">SERVICIOS:</label>          
                                                </div>
                                                <div class="col-md-9">                                  
                                                    <select name="" id="servicioSelect" class="" required>
                                                    <option value="">Seleccione</option>
                                                    </select> 
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="colmd-6"></div>
                                                <div class="col-md-3">
                                                    <button type="button" class="btn btn-primary" id="guardarServicioEspecialista">Guardar</button>
                                                </div>
                                                <div class="col-md-3">
                                                    <button type="button" class="btn btn-danger" id="cancelarServicioEspecialista">Cancelar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>         
                    </div>
                </div>
            </div>          
        </div>
    </div>
</div>
<script>
    // para los servicios
    const rbServicio = document.querySelector("#rbServicio");
    const rbEspecialidad = document.querySelector("#rbEspecialidad");
    const nombreServicio = document.querySelector("#nombreServicio");
    const btGuardarServicio = document.querySelector("#guardarServicio");
    const formularioServicio = document.querySelector("#form-servicio");
    let tipo;

    // para los detalles de los servicios
    const servicios = document.querySelector("#listaServicios");
    const descripcionServicio = document.querySelector("#descripcionServicio");
    const precio = document.querySelector("#precioServicio");
    const rbAmbos = document.querySelector("#rbAmbos");
    const rbFemenino = document.querySelector("#rbFemenino");
    const rbMasculino = document.querySelector("#rbMasculino");
    const btGuardarDetalle = document.querySelector("#guardarDetalle");
    const btCancelarDetalle = document.querySelector("#cancelarDetalle");
    const formularioDetalles = document.querySelector("#form-detalles");
    
    // para el registro de los especialistas
    const dni = document.querySelector("#dni");
    const nombre = document.querySelector("#nombre");
    const codigo = document.querySelector("#codigo");
    const btGuardarEspecialista = document.querySelector("#guardarEspecialista");
    const formularioEspecialistas = document.querySelector("#form-especialistas");
    let idPersona;
    let edad;
    
    // para el registro de los especialistas a los servicios
    const especialistasSelect = document.querySelector("#especialistaSelect");
    const serviciosEspecialistas = document.querySelector("#servicioSelect");
    const btGuardarEspSer = document.querySelector("#guardarServicioEspecialista");
    const btCancelarEspSer = document.querySelector("#cancelarServicioEspecialista");

    function listarServicios(select){
        const choiselistaServicios = new Choices(select, {
            searchEnabled: true,
            itemSelectText: '',
            allowHTML: true
        }); 
        choiselistaServicios.setChoices([], 'value', 'label', true); 
        const parametros = new URLSearchParams();
        parametros.append("operacion", "getData");
        fetch("../controllers/servicio.php",{
            method : "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            select.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                const optionTag = document.createElement("option");
                optionTag.value = element.idServicio;
                optionTag.text = element.nombreServicio;
                select.appendChild(optionTag);
            });
            choiselistaServicios.setChoices([], 'value', 'label', true); 
            choiselistaServicios.setChoices(datos, 'idServicio', 'nombreServicio', true);
        })
    }

    function listarEspecialistas(){
        const choiselistaServicios = new Choices(especialistasSelect, {
            searchEnabled: true,
            itemSelectText: '',
            allowHTML: true
        }); 
        choiselistaServicios.setChoices([], 'value', 'label', true); 
        const parametros = new URLSearchParams();
        parametros.append("operacion", "getData");
        parametros.append("estado", 1);
        fetch("../controllers/especialista.php",{
            method : "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            especialistasSelect.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                const optionTag = document.createElement("option");
                optionTag.value = element.idEspecialista;
                optionTag.text = element.ApellidosNombres;
                especialistasSelect.appendChild(optionTag);
            });
            choiselistaServicios.setChoices([], 'value', 'label', true); 
            choiselistaServicios.setChoices(datos, 'idEspecialista', 'ApellidosNombres', true);
        })
    }

    function validarServicio(){
        if(!formularioServicio.checkValidity()){
            event.preventDefault();
            event.stopPropagation();
            formularioServicio.classList.add('was-validated');
        }else{
            if(rbEspecialidad.checked){
                tipo = rbEspecialidad.value;
            }else if(rbServicio.checked){
                tipo = rbServicio.value;
            }else{
                notificar("Seleccione", "el tipo de servicio",2)
                return
            }
            mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
                if(result.isConfirmed){
                    guardarServicio();   
                }
            })  
        }
    }

    function guardarServicio() {
        
        const parametros = new URLSearchParams();
        parametros.append("operacion", "agregarServicio");
        parametros.append("tipo", tipo);
        parametros.append("nombreServicio", nombreServicio.value);
        fetch("../controllers/servicio.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos =>{
            if(datos.status){
                toastCheck("Guardado correctamente");
                formularioServicio.reset();
            }else{
                notificar("Error", "El servicio o especialidad ya existe",2)
            }
        })
    }    

    function validarDetalle(){
        if(!formularioDetalles.checkValidity()){
            event.preventDefault();
            event.stopPropagation();
            formularioDetalles.classList.add('was-validated');
        }else{
            if(!servicios.value){
                notificar("No permitido", "Seleccione un servicio para continuar", 5);
                return;
            }
            if(precio.value <0){
                notificar("No permitido", "Valores negativos no se aceptan", 5);
                return;
            }
            mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
                if(result.isConfirmed){
                    guardarDetalle();  
                }
            })  
        }
    }

    function guardarDetalle(){
        let genero;
        if(rbFemenino.checked){
            genero = rbFemenino.value;
        } else if (rbMasculino.checked){
            genero = rbMasculino.value;
        } else{
            genero = rbAmbos.value;
        }
        const parametros = new URLSearchParams();
        parametros.append("operacion", "agregarServiciosDetalles");
        parametros.append("idservicio", servicios.value);
        parametros.append("descripcion", descripcionServicio.value);
        parametros.append("precio", precio.value);
        parametros.append("genero", genero);
        fetch("../controllers/serviciosDetalle.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos =>{
            if(datos.status){
                toastCheck("Guardado correctamente");
                //formularioDetalles.reset();
                descripcionServicio.value="";
                precio.value="";
                listarServicios();
            }else{
                notificar("Error", "No se pudo guardar correctamente",2)
            }
        })
    }
    
    function limpiarDetalles(){
        descripcionServicio.value = null;
        precio.value = null;
        rbAmbos.checked = true;
    }
    
    function registrarAlergias() {
        const parametros = new URLSearchParams();
        parametros.append("operacion", "registrarAlergias");
        parametros.append("alergia", alergia.value);
        fetch("../controllers/alergia.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos =>{
            if(datos.status){
                toastCheck("Guardado correctamente");
                formAlergias.reset();
            }else{
                notificar("Error", "La alergia ya existe",2)
            }
        })
    }   
    function consultarPersonas(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "getData");
        parametros.append("numeroDocumento", dni.value);
        fetch("../controllers/persona.php", {
            method : "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            if(datos.length>0){

            datos.forEach(element => {
                idPersona = element.idPersona;
                nombre.value = element.ApellidosNombres;
                edad = element.Edad;
            });
            }else{
                toast("No existes la persona registrada");
            }
        })
    }

    function validarEspecialistas(){
        if(!formularioEspecialistas.checkValidity()){
            event.preventDefault();
            event.stopPropagation();
            formularioEspecialistas.classList.add('was-validated');
        }else{
            if(edad<20){
                notificar("Dato invalido", "No se puede guardar un especilidad que sea menor a 20 años",5);
                return;
            }
            mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
                if(result.isConfirmed){
                    comprobarEspecialista();   
                }
            })  
        }
    }
    
    function comprobarEspecialista(){
        if(!nombre.value){
            toast("Pulse la tecla enter para completar que guarde el nombre de la persona");
            return;
        }else{
            guardarEspecialista();
        }
    }
    
    function guardarEspecialista(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "registrarEspecialista");
        parametros.append("idPersona", idPersona);
        parametros.append("codigo", codigo.value);

        fetch("../controllers/especialista.php", {
            method: "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos =>{
            if(datos.status){
                toastCheck("Guardado correctamente");
                formularioEspecialistas.reset();
            }else{
                toast("El especialista ya existe");
            }
        })
        .catch(error =>{
            console.log("Error al guardar")
        })
    }

    function guardarEspSer(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "registrar");
        parametros.append("idEspecialista", especialistasSelect.value);
        parametros.append("idServicio", serviciosEspecialistas.value);

        fetch("../controllers/especialistaServicio.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            if(datos.status){
                toastCheck("guardado correctamente");

            }else{
                toast("no se puede porque ya existe");
            }
        })
        .catch(error => {
            console.log("Error al guardar");
        })
    }

    function validarEspSer(){
        if(!especialistasSelect.value){
            notificar("Seleccione a un especialista", "", 1);
            return;
        }else if(!serviciosEspecialistas.value){
            notificar("Seleccione un servicio", "", 1);
            return;
        }else{
            mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
                if(result.isConfirmed){
                    guardarEspSer();   
                }
            }) 
        }
    }

    function limpiarEspSer() {
        serviciosEspecialistas.selectedIndex = 0;
        especialistasSelect.selectedIndex = 0;
    }
    
    listarServicios(servicios);
    listarServicios(serviciosEspecialistas);
    listarEspecialistas();

    function consultarPaciente(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "getData");
        parametros.append("numeroDocumento", dnip.value);
        fetch("../controllers/persona.php", {
            method : "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            if(datos.length>0){
                notificar("Ya existe","La persona ya ha sido registrada anteriormente",2);
            }else{
                consultarDNI();
            }
        })
        .catch(error => {
            console.log("Error al guardar");
        })
    }

    btGuardarServicio.addEventListener("click", validarServicio);
    btGuardarDetalle.addEventListener("click",validarDetalle);
    btCancelarDetalle.addEventListener("click",limpiarDetalles);
    btGuardarEspecialista.addEventListener("click",validarEspecialistas);
    btGuardarEspSer.addEventListener("click",validarEspSer);
    btCancelarEspSer.addEventListener("click",limpiarEspSer);

    dni.addEventListener("keypress", (evt) => {
        if (evt.charCode == 13) consultarPersonas();
    });
</script>