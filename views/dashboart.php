<?php require_once 'permisos.php'; ?>
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
<div class="row">
    <div class="col-lg-7 d-flex align-items-strech">
        <div class="card w-100">
            <div class="card-body">
                <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                    <div class="mb-3 mb-sm-0">
                        <h5 class="card-title fw-semibold">Servicio top del dia:</h5>
                    </div>
                </div>
                <div>
                    <canvas id="grafico1"></canvas>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-5 d-flex align-items-strech">
        <div class="card w-100">
            <div class="card-body">
                <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                    <div class="mb-3 mb-sm-0">
                        <h5 class="card-title fw-semibold">Atenciones por Turno:</h5>
                    </div>
                </div>
                <div>
                    <canvas id="grafico2"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
const grafico1 = document.querySelector("#grafico1");
const grafico2 = document.querySelector("#grafico2");

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

// 
const graficoBarras = new Chart(grafico1, {
    type: 'bar',
    data: {
        labels:[],
        datasets: [
            {        
                label: '',
                data: [],
                backgroundColor: ['#629DFF', '#FAB692','#FFBD3C','#7BD1BD','#97A5FF','#DD5B88']
            }
        ]
    }
})

function datosBarras() {
    const parametros = new URLSearchParams();
    parametros.append("operacion", "graficoEspecialidades")
    fetch("../controllers/servicio.php", {
        method : "POST",
        body: parametros
    })
    .then(response => response.json())
    .then(datos => {
        graphic(datos);
    });
}
function graphic(coleccion = []){
    let etiquetas = []; 
    let datos = [];

    coleccion.forEach(element => {
        etiquetas.push(element.nombreServicio);
        datos.push(element.total);
    });
    graficoBarras.data.labels = etiquetas;
    graficoBarras.data.datasets[0].data = datos;
    graficoBarras.update();
}

//
const graficoBarras2 = new Chart(grafico2, {
    type: 'pie',
    data: {
        labels:[],
        datasets: [
            {        
                label: '',
                data: [],
                backgroundColor: ['#FAB692','#629DFF','#FFBD3C','#7BD1BD','#97A5FF','#6C5BDD','#DD5B88']
            }
        ]
    }
})

function datosBarras2() {
    const parametros = new URLSearchParams();
    parametros.append("operacion", "graficoTurno")
    fetch("../controllers/atencion.php", {
        method : "POST",
        body: parametros
    })
    .then(response => response.json())
    .then(datos => {
        graphic2(datos);
    });
}
function graphic2(coleccion = []){
    let etiquetas = []; 
    let datos = [];

    coleccion.forEach(element => {
        etiquetas.push(element.turno);
        datos.push(element.total);
    });
    graficoBarras2.data.labels = etiquetas;
    graficoBarras2.data.datasets[0].data = datos;
    graficoBarras2.update();
}

datosBarras();
datosBarras2();
contadores();


    </script>