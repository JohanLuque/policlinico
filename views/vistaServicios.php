<?php require_once 'permisos.php'; ?>
<div class="container-fluid">
    <div class="card">
        <div class="mb-3 row g-2">
            <h1 class="form-label fs-13 text-center text-danger">Lista de Atenciones</h1>  
        </div>
        <div class="card-body">
            <div class="mb-2 row g-2" id="cardServicios">         
            </div>
        </div>
    </div>  
</div>
<script>
const cardServicios = document.querySelector("#cardServicios");

function listarServicios(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listaServicios");

    fetch("../controllers/detalleAtencion.php",{
        method: "POST",
        body:parametros
    })
    .then(response => response.json())
    .then(datos=>{
        console.log("todoo ok",datos)
        datos.forEach(element =>{
            const nuevoCard = `
                <div class="col-md-3" >
                    <div class="card">
                        <div class="card-content">
                            <div class="card-header bg-danger text-center text-white" >${element.numeroAtencion}</div>
                            <div class="card-body bg-light-danger" style="text-align: center;">
                                <h5>${element.ApellidosNombres}</h5>
                                <div class='mt-2 row g-2'>
                                    <div class='col-md-6'>
                                    </div>
                                    <div class='col-md-6'>
                                        <button class='btn m-1 btn-danger' type='button'>
                                            <a class='historia' data-idservicio='${element.idServicio}' data-idatencion='${element.idDetalleAtenciones}' style='text-decoration: none;color: white;' >ver</a>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
            `;
            cardServicios.innerHTML += nuevoCard;
        })
    })
}
listarServicios();
</script>