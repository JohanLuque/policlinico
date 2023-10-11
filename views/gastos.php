<div class="row mt-2 mb-3">                
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="row g-2 mb-3">
                    <div class="col-md-3">
                        <label for="">Método de pago:</label>
                    </div>
                    <div class="col-md-4">
                        <select name="" class="form-select form-select-sm" id="metodosPago"></select>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control form-control-sm bg-light" placeholder="monto" id="monto" >
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-3">
                        <label for="">Descripcion:</label>
                    </div>
                    <div class="col-md-8">
                        <textarea type="text" id="descripcion" class="form-control form-control-sm" cols="10" rows="5"></textarea>
                    </div>
                </div>
                <div class="row mt-3">
                    <button type="button" class="btn btn-danger" id="cancelar">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="guardar">Guardar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script> 
    const metodosPago = document.querySelector("#metodosPago");
    const monto = document.querySelector("#monto");
    const descripcion = document.querySelector("#descripcion");
    const btGuardar = document.querySelector("#guardar");
    const btCancelar = document.querySelector("#cancelar");

    function listarMetodosPago(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listar");
        fetch("../controllers/mediosPago.php",{
            method : "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            metodosPago.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
            const optionTag = document.createElement("option");
            optionTag.value = element.idMedioPago;
            optionTag.text = element.nombrePago;
            metodosPago.appendChild(optionTag);
        });
    })
    }
    
    function registrarGasto(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "registrarGasto");
        parametros.append("idMedioPago", metodosPago.value);
        parametros.append("descripcion", descripcion.value);
        parametros.append("monto", monto.value);

        fetch("../controllers/pago.php",{
            method:"POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos=>{
            if(datos){
                reset();
                toastCheck("Guardado Correctamente");   
            }
            else{
                console.log("algo mal");
            }
        })
        .catch(error =>{
            console.log("error al guardar");
        })
    }

    function reset(){
       monto.value = null;
       descripcion.value = null;
       metodosPago.selectedIndex = 0;
    }

    listarMetodosPago();
    btGuardar.addEventListener("click", registrarGasto);
    btCancelar.addEventListener("click", reset);

</script>