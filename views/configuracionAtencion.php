<?php require_once 'permisos.php'; ?>
<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <h1 class="text-center">Configuración</h1>
        </div>
        <div class="card-body">
            <div class="mb-2 row g-2">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-header bg-info text-white">SERVICIO:</div>
                            <div class="card-body">
                                <form id="form-servicio" >
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
                                        <div class="col-md-2">
                                            <label for="">Nombre:</label>          
                                        </div>
                                        <div class="col-md-8">
                                            <input class="form-control form-control-sm" id="nombreServicio" type="text" required>
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="colmd-6"></div>
                                        <div class="col-md-3">
                                            <button type="button" class="btn btn-primary" id="guardarServicio">Guardar</button>
                                        </div>
                                        <div class="col-md-3">
                                            <button type="reset" class="btn btn-danger" id="cancelarServicio">Cancelar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-header bg-info text-white">DETALLE DE SERVICIO:</div>
                            <div class="card-body">
                                <form id="form-detalles">
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-3">
                                            <label for="">Servicio:</label>          
                                        </div>
                                        <div class="col-md-8">                                  
                                            <select name="" id="listaServicios" class="" required>
                                            <option value="">Seleccione</option>
                                            </select> 
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-3">
                                            <label for="">Descripción:</label>          
                                        </div>
                                        <div class="col-md-8">
                                            <input class="form-control form-control-sm" id="descripcionServicio" type="tex" required>
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-3">
                                            <label for="">Precio:</label>          
                                        </div>
                                        <div class="col-md-8">
                                            <input class="form-control form-control-sm" id="precioServicio" type="number" required>
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
            <div class="mb-2 row g-2">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-header bg-info text-white">AGREGAR ESPECIALISTAS:</div>
                            <div class="card-body">
                                <form id="form-servicio" >
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-3">
                                            <label for="">dni:</label>          
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
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-header bg-info text-white">AGREGAR ESPECIALISTAS A SERVICIOS:</div>
                            <div class="card-body">
                                <form id="form-servicio" >
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-3">
                                            <label for="">ESPECIALISTAS:</label>          
                                        </div>
                                        <div class="col-md-9">                                  
                                            <select name="" id="" class="" required>
                                            <option value="">Seleccione</option>
                                            </select> 
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-3">
                                            <label for="">SERVICIOS:</label>          
                                        </div>
                                        <div class="col-md-9">                                  
                                            <select name="" id="" class="" required>
                                            <option value="">Seleccione</option>
                                            </select> 
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="colmd-6"></div>
                                        <div class="col-md-3">
                                            <button type="button" class="btn btn-primary" id="guardarServicio">Guardar</button>
                                        </div>
                                        <div class="col-md-3">
                                            <button type="reset" class="btn btn-danger" id="cancelarServicio">Cancelar</button>
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
    let idPersona;

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
                notificar("Seleccione", "el tipo de servicio",1)
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

    function listarServicios(){
        const choiselistaServicios = new Choices(listaServicios, {
            searchEnabled: true,
            itemSelectText: '',
            allowHTML: true
        }); 

        const parametros = new URLSearchParams();
        parametros.append("operacion", "getData");
        fetch("../controllers/servicio.php",{
            method : "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            servicios.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                const optionTag = document.createElement("option");
                optionTag.value = element.idServicio;
                optionTag.text = element.nombreServicio;
                servicios.appendChild(optionTag);
            });
            choiselistaServicios.setChoices([], 'value', 'label', true); 
            choiselistaServicios.setChoices(datos, 'idServicio', 'nombreServicio', true);
        })
    }

    function validarDetalle(){
        if(!formularioDetalles.checkValidity()){
            event.preventDefault();
            event.stopPropagation();
            formularioDetalles.classList.add('was-validated');
        }else{
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
                formularioDetalles.reset();
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
            });
            }else{
                toast("No existes la persona registrada");
            }
        })
    }

    function GuardarEspecialista(){
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
            }else{
                toast("Algo anda mal");
            }
        })
        .catch(error =>{
            console.log("Error al guardar")
        })
    }

    listarServicios();

    btGuardarServicio.addEventListener("click", validarServicio);
    btGuardarDetalle.addEventListener("click",validarDetalle);
    btCancelarDetalle.addEventListener("click",limpiarDetalles);
    btGuardarEspecialista.addEventListener("click",GuardarEspecialista);

    dni.addEventListener("keypress", (evt) => {
        if (evt.charCode == 13) consultarPersonas();
    });
    
</script>