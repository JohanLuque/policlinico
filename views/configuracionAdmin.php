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
            <div class="mb-2 row g-2">
                    <h1   h1   h1 class="form-label fs-13 text-center text-danger">Listado de usuarios</h1>
                    <table class="table table-hover" id="tabla-usuario">
                      <thead class="table-danger">
                        <tr>
                          <th>#</th>
                          <th>Apellidos y nombres</th>
                          <th>Usuario</th>
                          <th>Nivel</th>
                          <th>Fecha de inicio</th>
                          <th>Operaciones</th>
                        </tr>
                      </thead>
                      <tbody id="cuerpoUsuario">
                      </tbody>
                    </table>
            </div>
        </div>
    </div>
</div>
<!-- Modal para la contraseña-->
<div class="modal fade" id="modalUsuarios" tabindex="-1" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-l" role="document">
        <div class="modal-content">
            <div class="modal-header ">
                <h1 class="modal-title fs-5 fw-bold" id="exampleModalLabel">Ingrese su contraseña:</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
            <div class="modal-body">
                <form action="" id="form-modal" autocomplete="off">
                    <div class="mb-3 row g-2">
                        <div class="form-floating ">
                            <input type="password" class="form-control border"  placeholder="." id="contraseña" required>
                            <label for="">
                                <i class="ti ti-password me-2 fs-4"></i>
                                Contraseña
                            </label> 
                        </div>
                    </div>
                </form>
            </div>  
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary "   id="md-confirmacion">Confirmar</button>
            </div>
        </div>        
    </div>
</div>
<script>
    // registrar usuarios
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

    // listar usuarios
    const tablaUsuarios = document.querySelector("#tabla-usuario");
    const cuerpoUsuarios = tablaUsuarios.querySelector("#cuerpoUsuario");
    let idUsuario;

    // eliminar usuarios
    const modal = new bootstrap.Modal(document.querySelector("#modalUsuarios"));
    const contrasenia = document.querySelector("#contraseña");
    const formularioContrasenia = document.querySelector("#form-modal");
    const btConfirmar = document.querySelector("#md-confirmacion");

    


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

    function listarUsuarios(){
        const parametros = new URLSearchParams()
        parametros.append("operacion", "listarUsuario");
        parametros.append("estado", 1);
        fetch("../controllers/usuario.php",{
            method: "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpoUsuarios.innerHTML = "";
            let numero = 1;
            datos.forEach(element => {
            let filaNueva = `
            <tr>
                <td>${numero}</td>
                <td>${element.persona}</td>
                <td>${element.nombreUsuario}</td>
                <td>${element.nivelAcceso}</td>
                <td>${element.fechaInicio}</td>
                <td>
                <a class ="usuario btn btn-sm btn-danger" data-idusuario='${element.idusuario}''>
                    Eliminar
                </a>
                </td>
            </tr>
            `;
            cuerpoUsuarios.innerHTML += filaNueva;
            numero++;
            })
        })
    }

    function eliminar(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "eliminarUsuario");
        parametros.append("clave", contrasenia.value);
        parametros.append("idusuario", idUsuario);

        fetch("../controllers/usuario.php",{
            method:'POST',
            body:parametros
        })
        .then(response => response.json())
        .then(datos =>{
            console.log(datos.mensaje)
        })
    }

    listarUsuarios();

    btGuardarUsuario.addEventListener("click", validar);

    dni.addEventListener("keypress", (evt) => {
        if (evt.charCode == 13) consultarPersonas();
    });

    cuerpoUsuarios.addEventListener("click", (event) => {
        idUsuario = parseInt(event.target.dataset.idusuario)
        if(event.target.classList[0] == 'usuario'){
            formularioContrasenia.reset();
            contrasenia.focus();
            modal.toggle();
        }
    });

    btConfirmar.addEventListener("click", eliminar);
</script>