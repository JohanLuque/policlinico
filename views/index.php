<!doctype html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Policlinico</title>
  <!-- <link rel="shortcut icon" type="image/png" href="images/logos/" /> -->
  <link rel="stylesheet" href="css/styles.min.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/choices.js/public/assets/styles/choices.min.css">
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
          <a href="index.php" class="text-nowrap logo-img mt-3">
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
                      <li class='sidebar-item'>
                        <a class='sidebar-link' href='index.php?view=vistaDoctores.php' id="gastos" aria-expanded='false'>        
                          <i class="ti ti-stethoscope nav-small-cap-icon"></i>
                          <span class='hide-menu'>Vista Doctor</span>
                        </a>
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
              <label class="">Hola!</label>
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
        <div class="row">
          <div class="col-md">
            <div class="item">
              <div class="card border-0 zoom-in bg-light-info shadow-none">
                <div class="card-body">
                  <div class="text-center">
                    <img src="./images/products/1.png" width="50" height="50" class="md-3">
                    <p class="fw-semibold fs-3 text-info mb-1 mt-1">PACIENTES</p>
                    <h5 class="fw-semibold mb-0 " id="cpacientes"></h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md">
            <div class="item">
              <div class="card border-0 zoom-in bg-light-danger shadow-none">
                <div class="card-body">
                  <div class="text-center">
                    <img src="./images/products/medico.png" width="50" height="50" class="md-3">
                    <p class="fw-semibold fs-3 text-danger mb-1 mt-1">MÉDICOS</p>
                    <h5 class="fw-semibold mb-0" id="cmedicos"></h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md">
            <div class="item">
              <div class="card border-0 zoom-in bg-light-warning shadow-none">
                <div class="card-body">
                  <div class="text-center">
                    <img src="./images/products/registros-medicos.png" width="50" height="50" class="md-3">
                    <p class="fw-semibold fs-3 text-warning mb-1 mt-1">ATENCIONES</p>
                    <h5 class="fw-semibold mb-0" id="catenciones">1500</h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md">
            <div class="item">
              <div class="card border-0 zoom-in bg-light-success shadow-none">
                <div class="card-body">
                  <div class="text-center">
                    <img src="./images/products/consulta.png" width="50" height="50" class="md-3">
                    <p class="fw-semibold fs-3 text-success mb-1 mt-1">ESPECIALIDADES</p>
                    <h5 class="fw-semibold mb-0" id="cespecialidades">15</h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md">
            <div class="item">
              <div class="card border-0 zoom-in bg-light-primary shadow-none">
                <div class="card-body">
                  <div class="text-center">
                    <img src="./images/products/examen-de-orina.png" width="50" height="50" class="md-3">
                    <p class="fw-semibold fs-3 text-primary mb-1 mt-1">SERVICIOS</p>
                    <h5 class="fw-semibold mb-0" id="cservicios">15</h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
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
      
      function contadores(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "contador");
        fetch("../controllers/atencion.php", {
          method: "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          const pacientes = document.querySelector("#cpacientes");
          const medicos = document.querySelector("#cmedicos");
          const atenciones = document.querySelector("#catenciones");
          const especialidades = document.querySelector("#cespecialidades");
          const servicios = document.querySelector("#cservicios");
          datos.forEach(element => {
            pacientes.innerHTML = element.pacientes;
            medicos.innerHTML = element.medicos;
            atenciones.innerHTML = element.atenciones;
            especialidades.innerHTML = element.especialidades;
            servicios.innerHTML = element.servicios;
            console.log(element.pacientes)
          });
          
        })
      }
      getURL();
      contadores();
    });

  </script>
</body>
</html>