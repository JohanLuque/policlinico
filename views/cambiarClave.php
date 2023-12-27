<?php require_once 'permisos.php'; ?>
<div class="container-fluid">
    <div class="card overflow-hidden">
        <div class="card-body p-0">
            <img src="./images/profile/fondo.png" alt="" class="img-fluid">
            <div class="row align-items-center">
                <div class="col-lg-12 mt-n3 order-lg-2 order-1">
                    <div class="mt-n5">
                        <div class="d-flex align-items-center justify-content-center mb-2">
                            <div class="linear-gradient d-flex align-items-center justify-content-center rounded-circle" style="width: 110px; height: 110px;">
                                <div class="border border-4 border-white d-flex align-items-center justify-content-center rounded-circle overflow-hidden" style="width: 100px; height: 100px;">
                                    <img src="./images/profile/user-3.jpg" alt="" class="w-100 h-100">
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <h5 class="fs-5 mb-0 fw-semibold"><?= $_SESSION['login']['nombres']?></h5>
                            <p class="mb-0 fs-4" id="nivel1"></p>
                        </div>
                    </div>
                </div>
            </div>
            <ul class="mt-2 nav nav-pills user-profile-tab justify-content-end mt-2 bg-light-info rounded-2" id="pills-tab" role="tablist" >
                <li class="nav-item" role="presentation">
                    <button class="nav-link position-relative rounded-0 active d-flex align-items-center justify-content-center  bg-transparent fs-3 py-6" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="true">
                        <i class="ti ti-user-circle me-2 fs-6"></i>
                        <span class="d-none d-md-block">Información</span>
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-friends-tab" data-bs-toggle="pill" data-bs-target="#pills-friends" type="button" role="tab" aria-controls="pills-friends" aria-selected="false" tabindex="-1">
                        <i class="ti ti-user-circle me-2 fs-6"></i>
                        <span class="d-none d-md-block">Contraseña</span>
                    </button>
                </li>
                <li class="nav-item" id="nav-usuarios" role="presentation">
                    <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-user-tab" data-bs-toggle="pill" data-bs-target="#pills-user" type="button" role="tab" aria-controls="pills-user" aria-selected="false" tabindex="-1">
                        <i class="ti ti-user-circle me-2 fs-6"></i>
                        <span class="d-none d-md-block">Usuarios</span>
                    </button>
                </li>
            </ul>
        </div>
    </div>
    <div class="tab-content" id="pills-tabContent">
        <div class="tab-pane fade show active" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
            <div class="d-sm-flex align-items-center justify-content-between mt-3 mb-4">
                <h3 class="mb-3 mb-sm-0 fw-semibold d-flex align-items-center">Información Personal</h3>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">

                            <div class="row g-2 mb-3">
                                <div class="col-4">
                                    <span class="round-8 text-bg-info rounded-circle me-2 d-inline-block"></span>
                                    <label class="fw-bolder text-dark" for="">Nombre completo:</label>
                                </div>
                                <div class="col-8">
                                    <label class="text-dark" for=""><?= $_SESSION['login']['nombres']?></label>
                                </div>
                            </div>
                            <div class="row g-2 mb-3">
                                <div class="col-4">
                                    <span class="round-8 text-bg-info rounded-circle me-2 d-inline-block"></span>
                                    <label class="fw-bolder text-dark" for="">Puesto:</label>
                                </div>
                                <div class="col-8">
                                    <label class="text-dark" for="" id="nivel2"></label>
                                </div>
                            </div>
                            <div class="row g-2 mb-3">
                                <div class="col-4">
                                    <span class="round-8 text-bg-info rounded-circle me-2 d-inline-block"></span>
                                    <label class="fw-bolder text-dark" for="">Estado:</label>
                                </div>
                                <div class="col-8">
                                    <label class="text-dark" for="" id="estado">Activo</label>
                                </div>
                            </div>
                            <div class="row g-2 mb-3">
                                <div class="col-4">
                                    <span class="round-8 text-bg-info rounded-circle me-2 d-inline-block"></span>
                                    <label class="fw-bolder text-dark" for="">Teléfono:</label>
                                </div>
                                <div class="col-8">
                                    <label class="text-dark" for="" id="telefono-info"></label>
                                </div>
                            </div>
                            <div class="row g-2 mb-3">
                                <div class="col-4">
                                    <span class="round-8 text-bg-info rounded-circle me-2 d-inline-block"></span>
                                    <label class="fw-bolder text-dark" for="">Edad:</label>
                                </div>
                                <div class="col-8">
                                    <label class="text-dark" for="" id="edad"></label>
                                </div>
                            </div>
                            <div class="row g-2 mb-3">
                                <div class="col-4">
                                    <span class="round-8 text-bg-info rounded-circle me-2 d-inline-block"></span>
                                    <label class="fw-bolder text-dark" for="">Distrito:</label>
                                </div>
                                <div class="col-8">
                                    <label class="text-dark" for="" id="distrito-info"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
        <div class="tab-pane fade" id="pills-friends" role="tabpanel" aria-labelledby="pills-friends-tab" tabindex="0">
            <div class="d-sm-flex align-items-center justify-content-between mt-3 mb-4">
                <h3 class="mb-3 mb-sm-0 fw-semibold d-flex align-items-center">CAMBIAR CONTRASEÑA:</h3>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="mb-2 row g-2">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <form id="form-usuarios-cambio" autocomplete="off">
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label for="" class="fw-bolder text-dark">Ingrese contraseña Actual:</label> 
                                                </div>
                                                <div class="col-md-9">
                                                    <hr class="bold">   
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label class="text-dark" for="">Contraseña:</label>          
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="password" class="form-control border"  placeholder="******" id="actual" maxlength="200" required>
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label for="" class="fw-bolder text-dark">Ingrese contraseña nueva:</label> 
                                                </div>
                                                <div class="col-md-9">
                                                    <hr class="bold">   
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label for="" class="text-dark">Nueva contraseña:</label>          
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="password" class="form-control border"  placeholder="******" id="nuevo" maxlength="200" required>
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-3">
                                                    <label class="text-dark" for="">Confirmar contraseña:</label>          
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="password" class="form-control border"  placeholder="******" id="confirmar" maxlength="200" required>
                                                </div>
                                            </div>
                                            <div class="mb-3 row g-2">
                                                <div class="col-md-6"></div>
                                                <div class="col-md-3"></div>
                                                <div class="col-md-3">
                                                    <button type="button" class="btn btn-primary" id="actualizar">Actualizar</button>
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
        <div class="tab-pane fade" id="pills-user" role="tabpanel" aria-labelledby="pills-user-tab" tabindex="0">
            <div class="d-sm-flex align-items-center justify-content-between mt-3 mb-4">
                <h3 class="mb-3 mb-sm-0 fw-semibold d-flex align-items-center">USUARIO</h3>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-12">
                        <div class="card">
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
                                        <div class="col-md-6"></div>
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
<!-- Modal para la contraseña-->
<div class="modal fade" id="modalUsuarios" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-l" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5 fw-bold" id="exampleModalLabel">Ingrese su contraseña:</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="" id="form-modal" autocomplete="off">
                    <div class="mb-3 row g-2">
                        <div class="form-floating">
                            <input type="password" class="form-control border" placeholder="." id="contrasenia" required>
                            <label for="contrasenia">
                                <i class="ti ti-password me-2 fs-4"></i>
                                Contraseña
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" id="md-confirmacion">Confirmar</button>
            </div>
        </div>
    </div>
</div>
<!--Modal de registro de personas-->
<div class="modal fade" id="registrar-personas" tabindex="-1"  aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5 fw-bolder" id="exampleModalLabel">Registrar Paciente</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row mt-2 mb-3">
                    <div class="col-md-12">
                        <div class="row g-2 mb-3">  
                            <form action="" id="form-paciente">
                                <div class="mb-3 row g-2">
                                    <div class="col-md-4 fw-bolder">
                                        <label for="">Tipo Documento:</label>          
                                    </div>
                                </div>
                                <div class="mb-3 row g-2">
                                    <div class="col-md-12">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" checked name="inlineRadioOptions" id="rbDni" value="N" >
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
                                            <input type="text" class="form-control border " id="DNIModal" type="tel" placeholder="88888888" required>
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
                                        <input type="text" class="form-control border"  placeholder="Nombre Completo" id="nombrePersona" type="text" required>
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
                                    <div class="col-md-6 fw-bolder">
                                        <label for="">Fecha Nacimiento:</label>          
                                    </div>
                                    <div class="col-md-6 fw-bolder">
                                        <label for="">Género:</label>          
                                    </div>
                                </div>
                                <div class="mb-3 row g-2 ">
                                    <div class="col-md-6">                                  
                                        <input class="form-control" id="fechaNacimiento" type="date" required>
                                    </div>
                                    <div class="col-md-6">                                  
                                        <div class="form-check form-check-inline ">                           
                                            <input class="form-check-input danger check-light-danger" type="radio" name="options" id="rbFemenino" value="F">
                                            <label class="form-check-label">Femenino</label>
                                        </div>
                                        <div class="form-check form-check-inline ">
                                            <input class="form-check-input danger check-light-danger" type="radio" name="options" id="rbMasculino" value="M">
                                            <label class="form-check-label">Masculino</label>
                                        </div>
                                    </div>
                                </div>              
                                <div class="mb-3 row g-2">
                                    <div class="col-md-6">  
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
                                    <div class="col-md-6 fw-bolder">
                                        <label for="">Distrito:</label>          
                                    </div>
                                </div>
                                <div class="mb-3 row g-2">
                                    <div class="col-md-6">
                                            <select  class="form-select" id="distrito"> 
                                                <option value="">Seleccione</option>
                                                <option value="Chincha Alta">Chincha Alta</option>
                                                <option value="Chincha Baja">Chincha Baja</option>
                                                <option value="Grocio Prado">Grocio Prado</option>
                                                <option value="Sunampe">Sunampe</option>
                                                <option value="Pueblo Nuevo">Pueblo Nuevo</option>
                                                <option value="EL Carmen">EL Carmen</option>
                                                <option value="Alto Larán">Alto Larán</option>
                                                <option value="San Juan de Yanac">San Juan de Yanac</option>
                                                <option value="San Pedro de Huacarpana">San Pedro de Huacarpana</option>
                                                <option value="Tambo de Mora">Tambo de Mora</option>
                                                <option value="Chavín">Chavín</option>
                                                <option value="Foráneo">Foráneo</option>
                                            </select>                             
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
    const nav_usuarios = document.querySelector("#nav-usuarios");

    //Modal API
    const modalRegistrar = new bootstrap.Modal(document.querySelector("#registrar-personas"));
    const dniModal = document.querySelector("#DNIModal");
    const apellidoPaterno = document.querySelector("#apellidosPaternoPersona");
    const apellidoMaterno = document.querySelector("#apellidosMaternoPersona");
    const nombres = document.querySelector("#nombrePersona");
    const fechanacimiento = document.querySelector("#fechaNacimiento");
    const telefono = document.querySelector("#telefono");
    const distrito = document.querySelector("#distrito");
    const buscar = document.querySelector("#buscar");
    const guardarRegistro = document.querySelector("#md-guardar");
    const formPaciente = document.querySelector("#form-paciente");
    //CAMBIAR CONTRASEÑA
    const actual = document.querySelector("#actual");
    const nueva = document.querySelector("#nuevo");
    const confirmar = document.querySelector("#confirmar");
    const nivel1 = document.querySelector("#nivel1");
    const nivel2 = document.querySelector("#nivel2");
    const btActualizar = document.querySelector("#actualizar");
    const formulario= document.querySelector("#form-usuarios-cambio");
    //
    const edad = document.querySelector("#edad");
    const distrito_info = document.querySelector("#distrito-info");
    const telefono_info = document.querySelector("#telefono-info");

    // registrar usuarios
    const dni = document.querySelector("#dni");
    const nombre = document.querySelector("#nombre");
    const nomUsuario = document.querySelector("#nombreUsuario");
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

    if(nombreNivelA == "Gerente"){
        nav_usuarios.style.display = "";
    }else{
        nav_usuarios.style.display = "none";
    }

    function informacionUsuario(){
        nivel1.innerHTML = nombreNivelA;
        nivel2.innerHTML = nombreNivelA;
        edad.innerHTML = edadUsu;
        distrito_info.innerHTML = distritoUsu;
        telefono_info.innerHTML = telefonoUsu;
        
    }
    informacionUsuario();
    function validar(){
        if(!formulario.checkValidity()){
            event.preventDefault();
            event.stopPropagation();
            formulario.classList.add('was-validated');
        }else{
            if(nueva.value !== confirmar.value){
                notificar("No coinciden", "La contraseña nueva no coincide con la confirmación", 5);
                return;
            }
            mostrarPregunta("Actualizar", "¿Está seguro de actualizar la clave?").then((result) => {
                if(result.isConfirmed){
                    guardar();   
                }
            }) 
        }
    }
    function guardar(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","actualizarClave");
        parametros.append("idusuario", idUsuario);
        parametros.append("clave", actual.value);
        parametros.append("nueva", confirmar.value);
        parametros.append("nombreUsuario", nombreUsuario);

        fetch("../controllers/usuario.php",{
            method: 'POST',
            body:parametros
        })
        .then(response => response.json())
        .then(datos=>{
            if(datos.status){
                toastCheck("Actualizado correctamente");
                formulario.reset();
            }else{
                toast("Contraseña incorrecta");
                actual.focus();
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
                modalRegistrar.show();
                dniModal.value= dni.value;
            }
        })
        .catch(error => {
            console.error(error);
        })
    }

    function consultarDNI() {
        const documento =dniModal.value;
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

    function validarRegistroUsuario(){
        if(!formularioUsuario.checkValidity()){
            event.preventDefault();
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

            if(edad<17){
                notificar("Dato inválido", "No se puede añadir un usuario menor de edad",5);
                return;
            }
            
            if(rbEspecialista.checked && edad <20){
                notificar("Dato inválido", "No se puede guardar un especilidad que sea menor a 20 años",5);
                return;
            }

            mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
                if(result.isConfirmed){
                    guardarRegistroUsuario();   
                }
            }) 
        }
    }
    function guardarRegistroUsuario(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "registrarUsuario");
        parametros.append("idPersona", idPersona);
        parametros.append("nombreUsuario", nomUsuario.value);
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
            toast("Error al guardar")
        })
    }
    function validarPacientes(){
        if(!formPaciente.checkValidity()){
            event.preventDefault();
            event.stopPropagation();
            formPaciente.classList.add('was-validated');
        }else{
            registrarPaciente();
        }
    }
    function registrarPaciente(){
        const tipoDocumento = document.querySelector('input[name="inlineRadioOptions"]:checked');
        if (!tipoDocumento) {
            notificar("Seleccione un tipo de documento","Por favor, selecciona un tipo de documento.",2);
            return; 
        }
        const genero = document.querySelector('input[name="options"]:checked');
        if (!genero) {
            notificar("Por favor, seleccione un género","",2);
            return;
        }
        mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
            if(result.isConfirmed){  
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
            parametros.append("distrito", distrito.value);
            fetch("../controllers/persona.php", {
                method : "POST",
                body : parametros
            })
            .then(response => response.json())
            .then(datos => {
                if(datos.status){
                    toastCheck("Guardado Correctamente");   
                modalRegistrar.toggle();
                formPaciente.reset();
                }else{
                    toast("El paciente ya existe");
                }
            })
            .catch(error => {
                alert("Error al guardar")
            })
            }
        }) 
    }
    
    btGuardarUsuario.addEventListener("click", validarRegistroUsuario);

    dni.addEventListener("keypress", (evt) => {
        if (evt.charCode == 13) consultarPersonas();
    });

    dniModal.addEventListener("keypress", (evt) => {
        if(evt.charCode == 13) consultarDNI();
    });

    guardarRegistro.addEventListener("click", validarPacientes);

    btActualizar.addEventListener("click", validar);
</script>