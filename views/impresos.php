<div class="row">
    <div class="col-lg-12 d-flex align-items-strech">
        <div class="card w-100">
            <div class="card-body">
                <div>
                    <div class="mb-3 row g-2">
                      <h1 class="form-label fs-13 text-center text-danger">Triaje Listo</h1>
                    </div>
                    <table class="table table-hover" id="tabla-triaje">
                      <thead class="table-danger">
                        <tr>
                          <th>id</th>
                          <th>Paciente</th>
                          <th>Especialidad</th>
                          <th>Operaciones</th>
                        </tr>
                      </thead>
                      <tbody id="cuerpoTriaje">
                      </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
  const tablaTriaje = document.querySelector("#tabla-triaje");
  const cuerpoTriaje = tablaTriaje.querySelector("#cuerpoTriaje");
  let idhistoria = 0;
  let iddetalleHistoria = 0;

  function listarTriajes(){
    const parametros = new URLSearchParams()
      parametros.append("operacion", "listarTriajeHecho");
      fetch("../controllers/detalleAtencion.php",{
        method: "POST",
        body: parametros
      })
      .then(response => response.json())
      .then(datos => {
        cuerpoTriaje.innerHTML = "";
        let numero = 1;
        datos.forEach(element => {
          console.log(element)
          let filaNueva = `
          <tr>
            <td>${numero}</td>
            <td>${element.paciente}</td>
            <td>${element.nombreServicio}</td>
            <td>
              <a class ="triaje btn btn-sm btn-danger" data-idhistoria='${element.idHistoriaClinica}' data-iddetalle='${element.idDetalleAtenciones}'>
                Imprimir
              </a>
            </td>
          </tr>
          `;
          cuerpoTriaje.innerHTML += filaNueva;
          numero++;
        })
      })
  }
  cuerpoTriaje.addEventListener("click", (event) => {
    idhistoria =  parseInt(event.target.dataset.idhistoria)
    iddetalleHistoria =  parseInt(event.target.dataset.iddetalle)

    if(event.target.classList[0] == 'triaje'){
      if(idhistoria>0){
        const parametros = new URLSearchParams();
        parametros.append("idHistoria",idhistoria);
        parametros.append("idDetalleHistoria",iddetalleHistoria);
        
        window.open(`../reports/triajeImpreso.report.php`, '_blank');
      }
    }
  })
  listarTriajes();
</script>