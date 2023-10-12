<div class="row mt-2 mb-3">                
    <div class="col-md-6">
        <div class="card">
            <form id="form-gastos" class="needs-validation">
                <div class="card-header">
                    <h1 class="text-center">Gastos</h1>
                </div>
                <div class="card-body">
                    <div class="row g-2 mb-3">
                        <div class="col-md-3">
                            <label for="">Método de pago:</label>
                        </div>
                        <div class="col-md-4">
                            <select name="" class="form-select form-select-sm" id="metodosPago" required></select>
                            <div class="invalid-feedback">
                            Complete este campo para continuar
                            </div>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control form-control-sm bg-light" placeholder="monto" id="monto" required>
                            <div class="invalid-feedback">
                            Complete este campo para continuar
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-3">
                            <label for="">Descripcion:</label>
                        </div>
                        <div class="col-md-8">
                            <textarea type="text" id="descripcion" class="form-control form-control-sm" cols="10" rows="5" required></textarea>
                            <div class="invalid-feedback">
                            Complete este campo para continuar
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <button type="button" class="btn btn-danger mb-3" id="cancelar">Cancelar</button>
                        <button type="button" class="btn btn-primary" id="guardar">Guardar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="col-md-6">
        <h2>Lista de gastos por dia</h2>
        <div class="row mt-5">
            <div class="col-md-12 mb-2">
                <table class="table table-sm " id="tabla-lista-gastos">
                <colgroup>
                    <col width="10%"> <!-- # -->
                    <col width="10%"> <!-- monto-->
                    <col width="60%"> <!-- descripcion-->
                    <col width="20%"> <!-- fechaHora-->
                </colgroup>
                <thead class="thead-danger">
                    <tr>
                    <th>#</th>
                    <th>Monto</th>
                    <th>Descripción</th>
                    <th>Fecha/Hora</th>
                    </tr>
                </thead>
                <tbody>
                    <!--Inyecta datos-->
                </tbody>
                </table>
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
    // tabla
    const tabla = document.querySelector("#tabla-lista-gastos");
    const cuerpoTabla = document.querySelector("tbody");
    const form = document.querySelector("#form-gastos");


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
    
    function registrarGasto() {
        const parametros = new URLSearchParams();
        parametros.append("operacion", "registrarGasto");
        parametros.append("idMedioPago", metodosPago.value);
        parametros.append("descripcion", descripcion.value);
        parametros.append("monto", monto.value);

        fetch("../controllers/pago.php", {
            method: "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            if (datos) {
                reset();
                toastCheck("Guardado Correctamente");
                // Después de guardar con éxito, actualiza la tabla
                listarGastosTabla();
            } else {
                console.log("Algo salió mal");
            }
        })
        .catch(error => {
            console.log("Error al guardar");
        })
    }

    function listarGastosTabla() {
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarGastos");

        fetch("../controllers/pago.php", {
            method: "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            let nro = 1;
            cuerpoTabla.innerHTML = ``;
            datos.forEach(element => {
                const fila =
                    `
                    <tr>
                        <td>${nro}</td>
                        <td>${element.monto}</td>
                        <td>${element.descripcionGasto}</td>
                        <td>${element.fechaHora}</td>
                    </tr>
                    `;
                cuerpoTabla.innerHTML += fila;
                nro +=1;
            })
        })
    }
    
    function validar(){
        if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
            form.classList.add('was-validated');
        }else{
            mostrarPregunta("REGISTRAR", "¿Está seguro de Guardar?").then((result) => {
                if(result.isConfirmed){
                registrarGasto(); 
                }
            })
        }
    }

    function reset(){
       monto.value = null;
       descripcion.value = null;
       metodosPago.selectedIndex = 0;
    }

    listarMetodosPago();
    listarGastosTabla();
    btGuardar.addEventListener("click", validar);
    btCancelar.addEventListener("click", reset);

</script>