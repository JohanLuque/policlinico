<?php
session_start();
if (isset($_SESSION['login']) && $_SESSION['login']['acceso']){
  header('Location:./views/');
}
?>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Modernize Free</title>
  <link rel="shortcut icon" type="image/png" href="" />
  <link rel="stylesheet" href="./views/css/styles.min.css" />
</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div
      class="position-relative overflow-hidden bg-light-danger radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3">
            <div class="card mb-0">
              <div class="card-body">
                <a href="" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <img src="./views/images/logos/LOGO POLICLINICO.png" width="180" alt="" >
                </a>
                <p class="text-center">POLICLINICO SOLIDARIO CHINCHA</p>
                <form>
                  <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Usuario</label>
                    <input type="text" class="form-control" id="usuario"  required>
                  </div>
                  <div class="mb-4">
                    <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" required id="clave" >
                  </div>
                  <button type="button" id="iniciarSesion" class="btn btn-danger w-100 py-8 fs-4 mb-4 rounded-2" >Iniciar Sesión</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="./views/libs/jquery/dist/jquery.min.js"></script>
  <script src="./views/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="./views/js/notificaciones.js"></script>

  <script>
    document.addEventListener("DOMContentLoaded", () => {
        const btlogin = document.querySelector("#iniciarSesion");
        const usuario = document.querySelector("#usuario");
        const clave = document.querySelector("#clave");
  
        function logIn(){
          const parametros = new URLSearchParams();
          parametros.append("operacion", "inicioSesion");
          parametros.append("nombreUsuario", usuario.value);
          parametros.append("clave", clave.value);
  
          fetch("./controllers/usuario.php", {
            method:  'POST',
            body: parametros
          })
            .then(respuesta => respuesta.json())
            .then(datos => {
              if(datos.acceso){
                notificar("BIENVENIDO POLICLINICO SOLIDARIO DE CHINCHA", datos.mensaje, 50000)
                window.location.href = './views/index.php';
              }else{
                toast(datos.mensaje);                  
              }
              
            })
            .catch(error => {
              console.log(error);
            })
        }
  
        clave.addEventListener("keypress", (evt) => {
          if (evt.charCode == 13) logIn();
        });
        btlogin.addEventListener("click", logIn);
      })
  </script>
</body>
</html>
