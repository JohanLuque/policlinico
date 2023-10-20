<!doctype html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Policlinico</title>
  <!-- <link rel="shortcut icon" type="image/png" href="images/logos/" /> -->
  <link rel="stylesheet" href="css/styles.min.css" />
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->
  <script src="https://kit.fontawesome.com/f4286f5039.js" crossorigin="anonymous"></script>
  <!-- Boostrap-->
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->
  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script> -->
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
          <a href="" class="text-nowrap logo-img mt-3">
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
                        <!-- <span class="hide-menu">Opciones</span> -->
                      </li>
                      
                      <li class='sidebar-item'>
                        <a class='sidebar-link' href='index.php?view=atenciones.php' id="atenciones" aria-expanded='false'>        
                          <i class="ti ti-clipboard-text nav-small-cap-icon"></i>
                          <span class='hide-menu'>Admisión</span>
                        </a>
                      </li>
                      
                      <li class='sidebar-item'>
                        <a class='sidebar-link' href='index.php?view=atencionesListado.php' id="atenciones" aria-expanded='false'>        
                          <i class="ti ti-clipboard-plus nav-small-cap-icon"></i>
                          <span class='hide-menu'>Lista de atenciones</span>
                        </a>
                      </li>
          
                      <li class='sidebar-item'>
                        <a class='sidebar-link' href='index.php?view=pagos.php' id="pagos" aria-expanded='false'>        
                          <i class="ti ti-shopping-cart-plus nav-small-cap-icon"></i>
                          <span class='hide-menu'>Caja</span>
                        </a>
                      </li>
          
                      <li class='sidebar-item'>
                        <a class='sidebar-link' href='index.php?view=gastos.php' id="gastos" aria-expanded='false'>        
                          <i class="ti ti-coin nav-small-cap-icon"></i>
                          <span class='hide-menu'>Gastos</span>
                        </a>
                      </li>
          
                      <li class='sidebar-item '>
                        <a class='sidebar-link has-arrow' href='#' id="pagos" aria-expanded='false'>        
                          <span class='d-flex'>
                            <i class="ti ti-heart-plus nav-small-cap-icon"></i>                
                          </span>
                          <span class="hide-menu">Atención Médica</span>
                        </a>
                        <ul aria-expanded="false" class="collapse first-level">
                          <li class="sidebar-item">
                            <a href="index.php?view=historiaClinica.php" class="sidebar-link">
                              <div class="round-16 d-flex align-items-center justify-content-center">
                                <i class="ti ti-clipboard-heart nav-small-cap-icon"></i>
                              </div>
                              <span class='hide-menu'>Historia Clinica</span>
                            </a>
                          </li>
                          <li class="sidebar-item">                  
                            <a href="index.php?view=triaje.php" class="sidebar-link">
                              <div class="round-16 d-flex align-items-center justify-content-center">
                                <i class="ti ti-heartbeat nav-small-cap-icon"></i>
                              </div>
                              <span class='hide-menu'>Triaje</span>
                            </a>
                          </li>
                        </ul>
                      </li>
                      <li class='sidebar-item '>
                        <a class='sidebar-link' href='index.php?view=configuracionAtencion.php' id="pagos" aria-expanded='false'>        
                          <i class="ti ti-settings nav-small-cap-icon"></i>
                          <span class='hide-menu'>Configuración Atención</span>
                        </a>
                      </li>
          
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
      <header class="app-header bg-danger">
        <nav class="navbar navbar-expand-lg navbar-light">
          <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
              <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                <i class="ti ti-menu-2"></i>
              </a>
            </li>
            
          </ul>
          <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
              <label class="text-white">Hola!</label>
              <li class="nav-item dropdown">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                  aria-expanded="false">
                  <img src="images/profile/user-3.jpg" alt="" width="35" height="35" class="rounded-circle">
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                  <div class="message-body">
                    <a href="../index.html" class="btn btn-primary mx-3 mt-2 d-block">Cerrar Sesión</a>
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

  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <!-- Boostrap-->
  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> -->
  <!-- SweetAlert -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script>
    document.addEventListener("DOMContentLoaded", () => {     
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