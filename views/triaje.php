<div class="row">
    <div class="col-lg-6 d-flex align-items-strech">
        <div class="card w-100">
            <div class="card-body">
                <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                    <!-- <div class="mb-3 mb-sm-0">
                        <h5 class="card-title fw-semibold">Realizar Triaje:</h5>
                    </div> -->
                </div>
                <div>
                    <div class="mb-3 row g-2">
                      <h1 class="form-label fs-13 text-center text-danger">Realizar Triaje</h1>
                    </div>
                    <table class="table-responsive-sm table table-hover" id="tabla-triaje">
                      <thead class="table-danger">
                        <tr>
                          <th>id</th>
                          <th>Paciente</th>
                          <th>Especialidad</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody id="cuerpoTriaje">

                      </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6 d-flex align-items-strech">
        <div class="card w-100">
            <div class="card-body">
                <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                  <!-- <div class="mb-3 mb-sm-0">
                    <label class="fs-10 text-center">Registrar Triaje:</label>
                  </div> -->
                </div>
                <div>
                    
                    <form id="form-triaje" >
                      <div class="mb-3 row g-2">
                        <h1 class="form-label fs-13 text-center text-danger">Registrar Triaje</h1>
                      </div>
                      <div class="mb-3 row g-2">
                        <div class="col-md-3">
                          <label class="form-label">N° Doc:</label>          
                        </div>
                        <div class="col-md-4">
                          <input type="text" id="dni_paciente"class="form-control form-control-sm bg-light" readonly>
                        </div> 
                      </div>
                      <div class="mb-3 row g-2">
                        <div class="col-md-3">
                          <label class="form-label">Paciente:</label>          
                        </div>
                        <div class="col-md-8">
                          <input type="text" id="nombre_paciente" class="form-control form-control-sm bg-light" readonly>
                        </div> 
                      </div>
                      <div class="mb-3 row g-2">                  
                        <div class="col-md-3">
                            <label class="form-label">Peso:</label>          
                        </div> 
                        <div class="col-md-3">
                          <input type="number" id="triaje-peso"class="form-control form-control-sm" required>         
                        </div>
                      </div>
                      <div class="mb-3 row g-2">
                        <div class="col-md-3">
                          <label class="form-label">Talla:</label>          
                        </div> 
                        <div class="col-md-3">
                          <input type="number" id="triaje-talla"class="form-control form-control-sm" required>         
                        </div> 
                      </div>
                      <div class="row mb-3 g-2">
                        <label class="fs-7" for="">FRECUENCIAS:</label>
                      </div>
                      <div class="mb-3 row g-2">
                        <div class="col-md-3">
                          <label class="form-label">Cardiaca:</label>          
                        </div> 
                        <div class="col-md-2">
                          <input type="number" id="f-cardiaca1"class="form-control form-control-sm" required>         
                        </div>
                        <div class="ms-3 col-md-1">
                          <label> X </label>          
                        </div>
                        <div class="col-md-2">
                          <input type="number" id="f-cardiaca2"class="form-control form-control-sm" required>         
                        </div> 
                      </div>
                      <div class="row g-2 mb-3">
                        <div class="col-md-3">
                          <label class="form-label">Respiratoria:</label>          
                        </div> 
                        <div class="col-md-2">
                          <input type="number" id="f-respiratoria1"class="form-control form-control-sm" required>         
                        </div> 
                        <div class="ms-3 col-md-1">
                          <label> X </label>          
                        </div> 
                        <div class="col-md-2">
                          <input type="number" id="f-respiratoria2"class="form-control form-control-sm" required>         
                        </div>
                      </div>
                      <div class="row mb-3 g-2">
                        <div class="col-md-3">
                          <label class="form-label">Presión Arterial:</label>          
                        </div> 
                        <div class="col-md-2">
                          <input type="number" id="presionArterial1"class="form-control form-control-sm" required>         
                        </div> 
                        <div class="ms-3 col-md-1">
                          <label> / </label>          
                        </div> 
                        <div class="col-md-2">
                          <input type="number" id="presionArterial2"class="form-control form-control-sm" required>         
                        </div>
                      </div>
                      <div class="row mb-3 g-2">
                        <div class="col-md-4">
                          <label class="form-label" for="">Temperatura(C°):</label>
                        </div>
                        <div class="col-md-2">
                          <input type="text" id="temperatura"class="form-control form-control-sm" readonly>
                        </div>
                      </div>
                      <div class="row mb-3 g-2">
                        <div class="col-md-3">
                          <label class="form-label" for="">Saturación Oxígeno:</label>
                        </div>
                        <div class="col-md-2">
                          <input type="text" id="SaturacionOxigeno"class="form-control form-control-sm " readonly>
                        </div>
                      </div>
                      <div class="row mb-3 g-2">
                        <div class="d-grid">
                          <button id="registrar-triaje" class="btn btn-danger  mt-1" type="button">Guardar</button>
                        </div> 
                      </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
  const tablaTriaje = document.querySelector("#tabla-triaje");
  const cuerpoTriaje = tablaTriaje.querySelector("#cuerpoTriaje")

  function listarTriaje(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listarTriaje");

    fetch("../controllers/historiaClinica.php", {
      method: "POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos => {
      cuerpoTriaje.innerHTML = "";
      datos.forEach(element => {
        let filanueva = `
        <tr>
          <td>${element.idAtencion}</td>
          <td>${element.ApellidosNombres}</td>
          <td>${element.nombreServicio}</td>
          <td>
              <a class ="triaje btn btn-sm btn-info" data-idatencion='${element.idAtencion}'>triaje</a>
          </td>
        </tr>
        `;
        cuerpoTriaje.innerHTML += filanueva;

      });
    })
  }
  listarTriaje();
</script>