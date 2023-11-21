<?php require_once 'permisos.php'; ?>
<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <h1 class="text-center">Configuración</h1>
        </div>
        <div class="card-body">
            <div class="mb-2 row g-2">
                <!--Registrar servicios-->
                <div class="col-md-6">
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
                                        <div class="col-md-2">
                                            <label for="">Nombre:</label>          
                                        </div>
                                        <div class="col-md-8">
                                            <input class="form-control" id="nombreServicio" type="text" required>
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
            <div class="mb-2 row g-2">
                <!--Registrar personas-->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-header bg-info text-white">AGREGAR PERSONAS:</div>
                            <div class="card-body">
                                <form action="" id="form-persona" autocomplete="off">
                                    <div class="mb-3 row g-2">
                                      <div class="col-md-4 fw-bolder">
                                        <label for="">Tipo Documento:</label>          
                                      </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                      <div class="col-md-12">
                                        <div class="form-check form-check-inline">
                                          <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rbDni" value="N">
                                          <label class="form-check-label">DNI</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                          <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rbCarnet"  value="E">
                                          <label class="form-check-label">Carnet Extranjeria</label>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                      <div class="col-md-6">                    
                                        <div class="form-floating">
                                          <input type="text" class="form-control border " id="DNIp" type="tel" placeholder="88888888" required>
                                          <label for="">
                                              <i class="ti ti-id-badge me-2 fs-4"></i>
                                              N° Documento
                                          </label>
                                          <div class="invalid-feedback">
                                              Complete este campo para continuar
                                          </div>  
                                        </div>
                                      </div>
                                    </div>
                                    
                                    <div class="mb-3 row g-2">
                                      <div class="form-floating">
                                        <input type="text" class="form-control border"  placeholder="Nombre Completo" id="nombrePersona" type="text">
                                        <label for="">
                                            <i class="ti ti-user me-2 fs-4"></i>
                                            Nombres
                                        </label> 
                                      </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                      <div class="form-floating ">
                                        <input type="text" class="form-control border"  placeholder="Apellido Paterno" id="apellidosPaternoPersona" type="text" required>
                                        <label for="">
                                            <i class="ti ti-user me-2 fs-4"></i>
                                            Apellido Paterno
                                        </label> 
                                      </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                      <div class="form-floating ">
                                        <input type="text" class="form-control border"  placeholder="Apellido Paterno" id="apellidosMaternoPersona" type="text" required>
                                        <label for="">
                                            <i class="ti ti-user me-2 fs-4"></i>
                                            Apellido Materno
                                        </label> 
                                      </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                      <div class="col-md-4 fw-bolder">
                                        <label for="">Fecha Nacimiento:</label>          
                                      </div>
                                    </div>
                                    <div class="mb-3 row g-2 ">
                                      <div class="col-md-12">                                  
                                        <input class="form-control" id="fechaNacimiento" type="date" required>
                                      </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                      <div class="col-md-4 fw-bolder">
                                        <label for="">Género:</label>          
                                      </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                      <div class="col-md-12">       
                                        <div class="form-check form-check-inline ">                           
                                          <input class="form-check-input danger check-light-danger" type="radio" name="options" id="rbMujer" value="F">
                                          <label class="form-check-label">Femenino</label>
                                        </div>
                                        <div class="form-check form-check-inline ">
                                          <input class="form-check-input danger check-light-danger" type="radio" name="options" id="rbHombre" value="M">
                                          <label class="form-check-label">Masculino</label>
                                        </div>
                                      </div> 
                                    </div>                 
                                    <div class="mb-3 row g-2">
                                      <div class="col-md-12">  
                                        <div class="form-floating ">
                                          <input  class="form-control border"  placeholder="999999999" id="telefono" type="number">
                                          <label for="">
                                              <i class="ti ti-phone me-2 fs-4"></i>
                                              Teléfono
                                          </label> 
                                        </div>                                
                                      </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-12">  
                                          <div class="form-floating ">
                                            <input  class="form-control border" id="distrito"placeholder="a" type="text" maxlength="100">
                                            <label for="">
                                                <i class="ti ti-phone me-2 fs-4"></i>
                                                Distrito
                                            </label> 
                                          </div>                                
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="colmd-6"></div>
                                        <div class="col-md-3">
                                            <button type="button" class="btn btn-primary" id="guardarPersona">Guardar</button>
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
                <!-- REGISTRO DE ALERGIAS-->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-header bg-info text-white">AGREGAR ALERGIAS:</div>
                            <div class="card-body">
                                <form id="form-alergias" autocomplete="off">
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-2">
                                            <label for="">Alergia:</label>          
                                        </div>
                                        <div class="col-md-8">
                                            <input class="form-control" id="nombreAlergia" type="text" required>
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="colmd-6"></div>
                                        <div class="col-md-3">
                                            <button type="button" class="btn btn-primary" id="guardarAlergia">Guardar</button>
                                        </div>
                                        <div class="col-md-3">
                                            <button type="reset" class="btn btn-danger" id="cancelarAlergia">Cancelar</button>
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
    const formularioEspecialistas = document.querySelector("#form-especialistas");
    let idPersona;
    
    // para el registro de los especialistas a los servicios
    const especialistasSelect = document.querySelector("#especialistaSelect");
    const serviciosEspecialistas = document.querySelector("#servicioSelect");
    const btGuardarEspSer = document.querySelector("#guardarServicioEspecialista");
    const btCancelarEspSer = document.querySelector("#cancelarServicioEspecialista");
    
    // para el registro de pesonas 
    const dnip = document.querySelector("#DNIp");
    const apellidoPaterno = document.querySelector("#apellidosPaternoPersona");
    const apellidoMaterno = document.querySelector("#apellidosMaternoPersona");
    const nombres = document.querySelector("#nombrePersona");
    const fechanacimiento = document.querySelector("#fechaNacimiento");
    const telefono = document.querySelector("#telefono");
    const distrito = document.querySelector("#distrito");
    const formularioPersona = document.querySelector("#form-persona");
    const btGuardarPersona = document.querySelector("#guardarPersona");
    const rbHombre = document.querySelector("#rbHombre");
    const rbMujer = document.querySelector("#rbMujer");
    const rbDni = document.querySelector("#rbDni");
    const rbCarnet = document.querySelector("#rbCarnet");
    // Alergias
    const alergia = document.querySelector("#nombreAlergia");
    const formAlergias = document.querySelector("#form-alergias");
    const guardarAlergia = document.querySelector("#guardarAlergia");
    const cancelarAlergia = document.querySelector("#cancelarAlergia");
    let genero;
    let tipoDocumento;

    function listarServicios(select){
        const choiselistaServicios = new Choices(select, {
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

    function validarPersona(){
        if(!formularioPersona.checkValidity()){
            event.preventDefault();
            event.stopPropagation();
            formularioPersona.classList.add('was-validated');
        }else{
            if (rbDni.checked) {
            tipoDocumento = rbDni.value;
            }else if(rbCarnet.checked){
                tipoDocumento = rbCarnet.value;
            }
            else{
                notificar("Seleccione","Por favor, selecciona un tipo de documento.", 2);
                return; 
            }
            if (rbMujer.checked) {
                genero = rbMujer.value;
            }else if(rbHombre.checked){
                genero = rbHombre.value;
            }else{
                notificar("Seleccione", "el genero para continuar",2);
                return;
            }

            mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
                if(result.isConfirmed){
                    registrarPersona();   
                }
            }) 
        }
    }
    
    function consultarDNI() {
        const documento =dnip.value;
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
                toast(resultado.message);
            }
            })
            .catch( e => {
            console.error(e);
            });
    }

    function registrarPersona(){

        
        const parametros = new URLSearchParams();
        parametros.append("operacion", "registrarPersona");
        parametros.append("nombres", nombres.value);
        parametros.append("apellidoPaterno",apellidoPaterno.value);
        parametros.append("apellidoMaterno",apellidoMaterno.value);
        parametros.append("tipoDocumento", tipoDocumento);
        parametros.append("numeroDocumento", dnip.value);
        parametros.append("fechaNacimiento", fechanacimiento.value);
        parametros.append("genero", genero);
        parametros.append("telefono", telefono.value);
        parametros.append("distrito", distrito.value);
        fetch("../controllers/persona.php", {
            method : "POST",
            body : parametros
        })
        .then(response => response.json())
        .then(datos => {
            if(datos.status){
            toastCheck("Guardado Correctamente");
            formularioPersona.reset();   
            }else{
                consultarDNI();
            }
        })
        .catch(error => {
            alert("Error al guardar")
        })
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
    btGuardarPersona.addEventListener("click",validarPersona);
    cancelarAlergia.addEventListener("click", () =>{
        formAlergias.reset();
    });

    dni.addEventListener("keypress", (evt) => {
        if (evt.charCode == 13) consultarPersonas();
    });
    dnip.addEventListener("keypress", (evt) => {
        if (evt.charCode == 13) consultarPaciente();
    });
    guardarAlergia.addEventListener("click", () => {
        mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
                if(result.isConfirmed){
                    registrarAlergias();
                }
            })
    });
</script>