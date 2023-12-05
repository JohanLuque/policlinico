<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <h1 class="text-center">Cambiar Contraseña</h1>
        </div>
        <div class="card-body">
        <div class="mb-2 row g-2">
                <!--contraseña de usuarios usuarios-->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-header bg-info text-white">Contraseña:</div>
                            <div class="card-body">
                                <form id="form-usuarios" autocomplete="off">
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-3">
                                            <label for="">Contraseña actual:</label>          
                                        </div>
                                        <div class="col-md-9">
                                            <input type="password" class="form-control border"  placeholder="***" id="actual" maxlength="200" required>
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-3">
                                            <label for="">Nueva contraseña:</label>          
                                        </div>
                                        <div class="col-md-9">
                                            <input type="password" class="form-control border"  placeholder="***" id="nuevo" maxlength="200" required>
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-3">
                                            <label for="">Confirmar contraseña:</label>          
                                        </div>
                                        <div class="col-md-9">
                                            <input type="password" class="form-control border"  placeholder="***" id="confirmar" maxlength="200" required>
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="colmd-6"></div>
                                        <div class="col-md-3">
                                            <button type="button" class="btn btn-primary" id="actualizar">Actualizar</button>
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
    const actual = document.querySelector("#actual");
    const nueva = document.querySelector("#nuevo");
    const confirmar = document.querySelector("#confirmar");
    const btActualizar = document.querySelector("#actualizar");
    const formulario= document.querySelector("#form-usuarios");

    
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