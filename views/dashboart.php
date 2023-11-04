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
                        <h5 class="fw-semibold mb-0" id="catenciones"></h5>
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
                        <h5 class="fw-semibold mb-0" id="cespecialidades"></h5>
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
                        <h5 class="fw-semibold mb-0" id="cservicios"></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
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
    contadores();
    </script>