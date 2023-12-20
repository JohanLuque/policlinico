<?php
session_start();
if (!isset($_SESSION['login']) || !$_SESSION['login']['acceso']){
    header("Location:../");
}else{
  $idUsuario = $_SESSION['login']['idUsuario'];
  $nombreUsuario = $_SESSION['login']['usuario'];
  $nivelAcceso = $_SESSION['login']['nivelacceso'];
  $clave = $_SESSION['login']['clave'];
  $edad = $_SESSION['login']['edad'];
  $telefono = $_SESSION['login']['telefono'];
  $distrito = $_SESSION['login']['distrito'];
}

//$idUsuario = $_SESSION['login']['idUsuario'];
//$nombreUsuario = $_SESSION['login']['usuario'];
?>
<!doctype html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Policlinico</title>
  <link rel="stylesheet" href="css/styles.min.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/choices.js/public/assets/styles/choices.min.css">
  <script src="https://kit.fontawesome.com/f4286f5039.js" crossorigin="anonymous"></script>
  <!-- DataTables CSS -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.3.2/css/buttons.dataTables.css">
  <!-- jQuery -->
  <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- DataTables JS -->
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script>
  <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
  <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/pdfmake.min.js"></script>
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.html5.min.js"></script>
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.print.min.js"></script>

</head>
<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <aside class="left-sidebar bg-gradient" >
      <!-- Sidebar scroll-->
      <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
          <a href="index.php?view=dashboart.php" class="text-nowrap logo-img mt-3">
            <img src="./images/logos/LOGO POLICLINICO.png" style="padding:15px ;" width="210" alt="" />
          </a>
          <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
            <i class="ti ti-x fs-8"></i>
          </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="init">
          <div class="simplebar-wrapper selected" style="margin: 0px -24px;" >
            <div class="simplebar-height-auto-observer-wrapper">
              <div class="simplebar-height-auto-observer"></div>
            </div>
            <div class="simplebar-mask selected">
              <div class="simplebar-offset selected" style="right: 0px; bottom: 0px;">
                <div class="simplebar-content-wrapper selected" tabindex="0" role="region" aria-label="scrollable content" style="height: 100%; overflow: hidden scroll;">
                  <div  class="simplebar-content selected" style="padding: 0px 24px;">
                    <ul id="sidebarnav" class="in">            
                      <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Opciones</span>
                      </li>
                      <?php require_once './opciones.php'; ?>             
                    </ul>
                  </div>

                </div>
              </div>
            </div>
          </div>        
        </nav>
        <!-- End Sidebar navigation -->
      </div>
      <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
      <!--  Header Start -->
      <header class="app-header ">
        <nav class="navbar shadow-sm navbar-expand-lg navbar-light">
          <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
              <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                <i class="ti ti-menu-2"></i>
              </a>
            </li>
            
          </ul>
          <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
              <label id="usuario" data-distrito="<?= $distrito?>" data-telefono="<?= $telefono?>" data-edad="<?= $edad?>" data-clave="<?= $clave?>" data-nivel="<?= $nivelAcceso?>" data-nomusuario="<?= $nombreUsuario?>" data-id="<?= $idUsuario?>" class="">BIENVENIDO! <?= $_SESSION['login']['nombres']?></label>
              <li class="nav-item dropdown">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                  aria-expanded="false">
                  <img src="images/profile/user-3.jpg" alt="" width="35" height="35" class="rounded-circle">
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                  <div class="message-body">
                    <a href="../controllers/usuario.php?operacion=destroy" class="btn btn-primary mx-3 mt-2 d-block">Cerrar Sesión</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!--  Header End -->
      <div class="container-fluid" id="contenedor-vistas">
        
        
        <!--  Row 1 -->
        
      </div>
    </div>
  </div>
  <script src="libs/jquery/dist/jquery.min.js"></script>
  <script src="libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="js/sidebarmenu.js"></script>
  <script src="js/app.min.js"></script>
  <script src="js/notificaciones.js"></script>
  <script src="libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="libs/simplebar/dist/simplebar.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  
  <script src="https://cdn.jsdelivr.net/npm/choices.js/public/assets/scripts/choices.min.js"></script>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

  <!--DATATABLE-->


  <!-- SweetAlert -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script>
    document.addEventListener("DOMContentLoaded", () => {     
      const usuario = document.querySelector("#usuario");
      let idUsuario = usuario.dataset.id;
      let nombreUsuario = usuario.dataset.nomusuario;
      let nivelAcceso = usuario.dataset.nivel;
      let clave = usuario.dataset.clave;
      let edadUsu = usuario.dataset.edad;
      let telefonoUsu = usuario.dataset.telefono;
      let distritoUsu = usuario.dataset.distrito;
      let nombreNivelA;

      function nivelAccesoNom(){
        if(nivelAcceso == "C"){
          nombreNivelA = "Cajero";
        }else if(nivelAcceso == "G"){
          nombreNivelA = "Gerente";
        }else if(nivelAcceso == "T"){
          nombreNivelA = "Triaje - Enfermero(a)";
        }else if(nivelAcceso == "A"){
          nombreNivelA = "Admisión";
        }else if(nivelAcceso == "E"){
          nombreNivelA = "Doctor";
        }else if(nivelAcceso == "S"){
          nombreNivelA = "Tecnólogo";
        }
      }
      nivelAccesoNom();

      function getURL(){
        const url = new URL(window.location.href);
        const vista = url.searchParams.get("view");
        const contenedor = document.querySelector("#contenedor-vistas");
        if (vista != null){
          fetch(vista)
          .then(respuesta => respuesta.text())
          .then(datos => {
            contenedor.innerHTML = datos;
            const scriptsTag = contenedor.getElementsByTagName("script");
            for (i = 0; i < scriptsTag.length; i++){
              eval(scriptsTag[i].innerText);
            }
          });
        }
      }  
      
      
      getURL();
      
    });

  </script>
</body>
</html>