<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <h1 class="text-center">DETALLES DE HISTORIAS CLINICAS</h1>
        </div>
        <div class="card-body">
            <div class="mb-2 row g-2">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <form id="form-usuarios" autocomplete="off">
                                    <div class="mb-3 row g-2">
                                        <div class="col-md-1">
                                            <label for="">DNI:</label>          
                                        </div>
                                        <div class="col-md-6">
                                            <input type="number" class="form-control border bg-light" id="dni" placeholder="N° Documento" maxlength="10" required min="0">
                                        </div>
                                        <div class="col-md-2">
                                            <button class="btn btn-sm" id="BuscarHirtoria" type="button"><i class="fa-solid fa-search fa-2xl" style="color: #e66814;"></i></button>
                                        </div>
                                        <div class="col-md-3">
                                            <button type="reset" class="btn btn-danger">Cancelar</button>
                                        </div>
                                    </div>
                                    <div class="mb-3 row g-2" style="display: none;">
                                        <div class="col-md-3">
                                            <label for="">Persona:</label>          
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control border bg-light"  placeholder="Nombre Completo" id="" readonly>
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
                            <div class="card-header bg-white">
                                <h5 class="text-center" id="nombre"></h5>
                            </div>
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
    let idDetalleAtencion;
    let idHistoria;

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
                            <a class ="usuario btn btn-sm btn-danger" data-detalle='${element.idDetalleAtenciones}' data-historia='${element.idHistoriaClinica}'>
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
    
    cuerpoTabla.addEventListener("click", (event) => {
        idDetalleAtencion =  parseInt(event.target.dataset.detalle)
        idHistoria =  parseInt(event.target.dataset.historia)

    if(event.target.classList[0] == 'usuario'){
      if(idDetalleAtencion>0){
        const parametros = new URLSearchParams();

        parametros.append("idDetalleAtencion",idDetalleAtencion);
        parametros.append("idHistoria",idHistoria);
        parametros.append("idDetalleHistoria",idDetalleAtencion);

        window.open(`../reports/verHistorias.report.php?${parametros}`, '_blank');
      }
    }
  })

    dni.addEventListener("keypress", (evt) => {
        if (evt.charCode == 13) consultarHistoria();
    });
</script>