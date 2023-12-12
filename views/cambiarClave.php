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
                            <p class="mb-0 fs-4" id="nivel"></p>
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
                                    <label class="text-dark" for="" id="telefono"></label>
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
                                    <label class="text-dark" for="" id="distrito"></label>
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
                            <!--contraseña de usuarios usuarios-->
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form id="form-usuarios" autocomplete="off">
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
        </div>
    </div>
</div>
<script>
    const actual = document.querySelector("#actual");
    const nueva = document.querySelector("#nuevo");
    const confirmar = document.querySelector("#confirmar");
    const nivel = document.querySelector("#nivel");
    const nivel2 = document.querySelector("#nivel2");
    const btActualizar = document.querySelector("#actualizar");
    const formulario= document.querySelector("#form-usuarios");

    const edad = document.querySelector("#edad");
    const distrito = document.querySelector("#distrito");
    const telefono = document.querySelector("#telefono");

    function informacionUsuario(){
        nivel.innerHTML = nombreNivelA;
        nivel2.innerHTML = nombreNivelA;
        edad.innerHTML = edadUsu;
        distrito.innerHTML = distritoUsu;
        telefono.innerHTML = telefonoUsu;
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
            console.log(datos)
            if(datos.status){
                toastCheck("Actualizado correctamente");
                formulario.reset();
            }else{
                toast("Contraseña incorrecta");
                actual.focus();
            }
        })
    }

    btActualizar.addEventListener("click", validar);
</script>