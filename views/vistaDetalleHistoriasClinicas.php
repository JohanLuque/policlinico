<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <h1 class="text-center">DETALLES DE HISTORIAS CLINICAS</h1>
        </div>
        <div class="card-body">
            <div class="mb-2 row g-2">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-header bg-info text-white">BUSCAR HISTORIA CLINICA:</div>
                            <div class="card-body">
                                <form id="form-usuarios" autocomplete="off">
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-3">
                                            <label for="">DNI:</label>          
                                        </div>
                                        <div class="col-md-9">
                                            <input type="number" class="form-control border bg-light" id="dni" placeholder="N° Documento" maxlength="10" required>
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-3">
                                            <label for="">Persona:</label>          
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control border bg-light"  placeholder="Nombre Completo" id="nombre" readonly>
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2">
                                        <div class="colmd-6"></div>
                                        <div class="col-md-3">
                                            <button type="button" class="btn btn-primary" id="BuscarHirtoria">Buscar</button>
                                        </div>
                                        <div class="col-md-3">
                                            <button type="reset" class="btn btn-danger">Cancelar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mb-2 row g-2">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <form id="form-paciente" autocomplete="off">
                                    <table class="table table-hover" id="tabla-paciente">
                                        <thead class="table-danger">
                                            <tr>
                                            <th>#</th>
                                            <th>Nombre del servicio</th>
                                            <th>fecha</th>
                                            <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="cuerpoPaciente">
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
    </div>
</div>
<script>
    const dni = document.querySelector("#dni");
    const nombre = document.querySelector("#nombre");
    const tabla = document.querySelector("#tabla-paciente");
    const cuerpoTabla = tabla.querySelector("#cuerpoPaciente");

    function consultarHistoria(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarDetallehistoriaClinica");
        parametros.append("nroDocumento", dni.value);
        fetch("../controllers/detalleAtencion.php", {
                method : "POST",
                body : parametros
            })
            .then(response => response.json())
            .then(datos => {
                if(datos.length > 0){
                    cuerpoTabla.innerHTML = "";
                    let nroFila = 1;
                    datos.forEach(element =>{
                        nombre.value = element.paciente;
                        let filaNueva=`
                        <tr>
                            <td>${nroFila}</td>
                            <td>${element.nombreServicio}</td>
                            <td>${element.fechaCreacion}</td>
                            <td>
                            <a class ="usuario btn btn-sm btn-danger" data-historia='${element.idDetalleAtenciones}'>
                                Ver
                            </a>
                            </td>
                        </tr>
                        `;
                        cuerpoTabla.innerHTML += filaNueva;
                        nroFila++;
                    })
                }else{
                    toast("No hay datos ")
                }
            })
    }

    dni.addEventListener("keypress", (evt) => {
        if (evt.charCode == 13) consultarHistoria();
    });
</script>