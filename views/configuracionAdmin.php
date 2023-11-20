<?php require_once 'permisos.php'; ?>
<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <h1 class="text-center">Configuración</h1>
        </div>
        <div class="card-body">
            <div class="mb-2 row g-2">
                <!--Registrar usuarios-->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-header bg-info text-white">AGREGAR USUARIOS:</div>
                            <div class="card-body">
                                <form id="form-usuarios" autocomplete="off">
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
                                            <label for="">Nombre de usuario:</label>          
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control border"  placeholder="Usuario" id="nombreUsuario" maxlength="200" required>
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-3">
                                            <label for="">Contraseña:</label>          
                                        </div>
                                        <div class="col-md-9">
                                            <input type="password" class="form-control border"  placeholder="***" id="clave" maxlength="200" required>
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-3">
                                            <label for="">Nivel:</label>          
                                        </div>
                                        <div class="col-md-8">       
                                            <div class="form-check form-check-inline">                           
                                            <input class="form-check-input" type="radio" name="options" id="rbAdmision" value="A">
                                                <label class="form-check-label">Admisión</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="options" id="rbCaja" value="C">
                                                <label class="form-check-label">Caja</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="options" id="rbTriaje" value="T">
                                                <label class="form-check-label">Triaje</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="options" id="rbEspecialista" value="E">
                                                <label class="form-check-label">Especialista</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="options" id="rbServicio" value="S">
                                                <label class="form-check-label">Servicio</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="colmd-6"></div>
                                        <div class="col-md-3">
                                            <button type="button" class="btn btn-primary" id="guardarUsuario">Guardar</button>
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
            </div> 
        </div>
    </div>
</div>
<script>
    const dni = document.querySelector("#dni");
    const nombre = document.querySelector("#nombre");
    const nombreUsuario = document.querySelector("#nombreUsuario");
    const clave = document.querySelector("#clave");

    const rbAdmision = document.querySelector("#rbAdmision");
    const rbCaja = document.querySelector("#rbCaja");
    const rbTriaje = document.querySelector("#rbTriaje");
    const rbEspecialista = document.querySelector("#rbEspecialista");
    const rbServicio = document.querySelector("#rbServicio");
    const btGuardarUsuario = document.querySelector("#guardarUsuario");
    const formularioUsuario = document.querySelector("#form-usuarios");
    let idPersona;
    let nivel;

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
                toast("persona no registrada");
            }
        })
        .catch(error => {
            console.error(error);
        })
    }

    function validar(){
        if(!formularioUsuario.checkValidity()){
            event.preventDefault();
            event.stopPropagation();
            formularioUsuario.classList.add('was-validated');
        }else{
            if(!nombre.value){
                notificar("Presione enter","en el DNI para llenar el campo de la persona",5);
                dni.focus();
                return;
            }
            if(rbAdmision.checked){
                nivel = rbAdmision.value;
            } else if(rbCaja.checked){
                nivel = rbCaja.value;
            } else if(rbTriaje.checked){
                nivel = rbTriaje.value;
            } else if (rbEspecialista.checked){
                nivel = rbEspecialista.value;
            } else if(rbServicio.checked){
                nivel = rbServicio.value;
            } else{
                notificar("Seleccione", "el nivel para continuar",5);
                return;
            }

            mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
                if(result.isConfirmed){
                    guardar();   
                }
            }) 
        }
    }

    function guardar(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "registrarUsuario");
        parametros.append("idPersona", idPersona);
        parametros.append("nombreUsuario", nombreUsuario.value);
        parametros.append("clave", clave.value);
        parametros.append("nivelAcceso", nivel);
        fetch("../controllers/usuario.php", {
            method:'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos =>{
            if(datos.status){
                toastCheck("Guardado correctamente");
                formularioUsuario.reset();
            }else{
                toast("El usuario ya existe");
            }
        })
        .catch(error => {
            console.error(error);
        })
    }

    btGuardarUsuario.addEventListener("click", validar);

    dni.addEventListener("keypress", (evt) => {
        if (evt.charCode == 13) consultarPersonas();
    });
</script>