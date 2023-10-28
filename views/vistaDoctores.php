<div class="container-fluid">
    <div class="card">
        <div class="mb-3 row g-2">
            <h1 class="form-label fs-13 text-center text-danger">Sala de espera</h1>  
        </div>
        <div class="card-body">
            <div class="mb-2 row g-2" id="cardListado">         
            </div>
        </div>
    </div>  
</div>
<script>
    const cardListado = document.querySelector("#cardListado");
    function listar(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarAtenciones");

        fetch("../controllers/atencion.php",{
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
                                <div class="card-header bg-danger" ></div>
                                <div class="card-body bg-light-danger" style="text-align: center;">
                                    <div class='mt-2 row g-2'>
                                        <div class='col-md-6'>
                                        </div>
                                        <div class='col-md-6'>
                                            <button class='btn m-1 btn-danger' type='button'>
                                                <a class='' type='button' style='text-decoration: none;color: white;' data-idatencion='' >ver</a>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> 
                `;
                cardListado.innerHTML += nuevoCard;
            })
        })
    }
    listar()
</script>