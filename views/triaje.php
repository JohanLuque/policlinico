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
                    <table class="table-responsive-sm table">
                      <thead class="bg-danger-subtle">
                        <tr>
                          <th>id</th>
                          <th>Paciente</th>
                          <th>Especialidad</th>
                        </tr>
                      </thead>
                      <tbody>

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
                          <label class="form-label fs-5">N° Doc:</label>          
                        </div>
                        <div class="col-md-4">
                          <input type="text" id="dni_paciente"class="form-control" readonly>
                        </div> 
                      </div>
                      <div class="mb-3 row g-2">                  
                        <div class="col-md-3">
                            <label class="form-label fs-5">Peso:</label>          
                        </div> 
                        <div class="col-md-3">
                          <input type="number" id="triaje-peso"class="form-control" required>         
                        </div> 
                        <div class="col-md-2">
                          <label class="form-label fs-5">Talla:</label>          
                        </div> 
                        <div class="col-md-3">
                          <input type="number" id="triaje-talla"class="form-control" required>         
                        </div> 
                      </div>
                      <div class="row mb-3 g-2">
                        <label class="fs-7" for="">FRECUENCIAS:</label>
                      </div>
                      <div class="mb-3 row g-2">
                        <div class="col-md-3">
                          <label class="form-label fs-5">Cardiaca:</label>          
                        </div> 
                        <div class="col-md-2">
                          <input type="number" id="f-cardiaca1"class="form-control" required>         
                        </div>
                        <div class="ms-3 col-md-1">
                          <label> X </label>          
                        </div>
                        <div class="col-md-2">
                          <input type="number" id="f-cardiaca2"class="form-control" required>         
                        </div> 
                      </div>
                      <div class="row g-2 mb-3">
                        <div class="col-md-3">
                          <label class="form-label fs-5">Respiratoria:</label>          
                        </div> 
                        <div class="col-md-2">
                          <input type="number" id="f-respiratoria1"class="form-control" required>         
                        </div> 
                        <div class="ms-3 col-md-1">
                          <label> X </label>          
                        </div> 
                        <div class="col-md-2">
                          <input type="number" id="f-respiratoria2"class="form-control" required>         
                        </div>
                      </div>
                      <div class="row mb-3 g-2">
                        <div class="col-md-3">
                          <label class="form-label fs-5">Presión Arterial:</label>          
                        </div> 
                        <div class="col-md-2">
                          <input type="number" id="presionArterial1"class="form-control" required>         
                        </div> 
                        <div class="ms-3 col-md-1">
                          <label> / </label>          
                        </div> 
                        <div class="col-md-2">
                          <input type="number" id="presionArterial2"class="form-control" required>         
                        </div>
                      </div>
                      <div class="row mb-3 g-2">
                        <div class="col-md-4">
                          <label class="form-label fs-5" for="">Temperatura(C°):</label>
                        </div>
                        <div class="col-md-2">
                          <input type="text" id="temperatura"class="form-control" readonly>
                        </div>
                      </div>
                      <div class="row mb-3 g-2">
                        <div class="col-md-3">
                          <label class="form-label fs-5" for="">Saturación Oxígeno:</label>
                        </div>
                        <div class="col-md-2">
                          <input type="text" id="SaturacionOxigeno"class="form-control " readonly>
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