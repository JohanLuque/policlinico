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
        cardServicios.innerHTML ="";
        //console.log("todoo ok",datos)
        datos.forEach(element =>{
            idatencion = element.idAtencion;
            //console.log(idatencion);
            let color;
            let estilo;
            if(element.estado == 1){
                color = "bg-danger text-center text-white";
                nombreBoton = "Atender";
                colorBoton = "btn-danger";
                colorFondo = "bg-light-danger";
                estilo = "";
            }else{
                color = "bg-info text-center text-white";
                colorBoton = "btn-info";
                nombreBoton = "Atendido";
                colorFondo = "bg-light-info";
                estilo = "display: none;"
            }
            const nuevoCard = `
                <div class="col-md-3" >
                    <div class="card">
                        <div class="card-content">
                            <div class="card-header ${color}" >${element.numeroAtencion}</div>
                            <div class="card-body ${colorFondo}" style="text-align: center;">
                                <h5>${element.ApellidosNombres}</h5>
                                <div class='mt-2 row g-2'>
                                    <div class='col-md-6'>
                                    </div>
                                    <div class='col-md-6'>
                                        <button class='btn m-1 ${colorBoton}' type='button' style='${estilo}'>
                                            <a class='atender'  data-idatencion='${element.idAtencion}' style='text-decoration: none;color: white;'>${nombreBoton}</a>
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
let idatencion;
cardServicios.addEventListener("click", (e) => {
    idatencion = parseInt(e.target.dataset.idatencion);
    if(e.target.classList[0] === ("atender")){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "cambiarEstado");
        parametros.append("idatencion", idatencion);
        console.log(idatencion);
        fetch("../controllers/detalleAtencion.php",{
            method : "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            toastCheck("Atendido"); 
            listarServicios();  
        })
    }
})

listarServicios();
</script>