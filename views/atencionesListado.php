<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <h1 class="text-center">Lista de Atenciones - Admisión</h1>
        </div>
        <div class="card-body">
            <div class="mb-2 row g-2" id="cardAtencion">         
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalAtenciones" tabindex="-1" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-l" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="row mt-2 mb-3">                
                <div class="col-md-12">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title fw-bolder text-danger text-center mb-4">Resumen de atención</h5>
                            <div class="row mt-2 mb-3">
                                <div class="col-md-12">                                    
                                    <div class="row g-2 mb-3">                             
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Nombre completo: </label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="nombreCompleto"></label>
                                        </div>
                                    </div>      
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">DNI:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="dni"></label>
                                        </div>
                                    </div>   
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Edad:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="edad"></label>
                                        </div>
                                    </div>  
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Teléfono:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="telefono"></label>
                                        </div>
                                    </div> 
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Especialidad:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="especialidad"></label>
                                        </div>
                                    </div> 
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Fecha Atención:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="" id="fechaAtencion"></label>
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <table id="detallemodal" class="bg-light">
                                            <thead>
                                                <tr>
                                                    <th>Servicio</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody id="cuerpomodal">
                                                <!-- traer datos  -->
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-md-4">
                                            <label class="fw-bolder" for="">Total:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control form-control-sm bg-light" id="total" >
                                        </div>
                                    </div>  
                                    <div class="row g-2 mb-3">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label for="">Método de pago:</label>
                                            </div>
                                            <div class="col-md-4">
                                                <select name="" class="form-select form-select-sm" id="metodosPago"></select>
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" class="form-control form-control-sm bg-light" placeholder="a pagar" id="totalMedioPago" >
                                            </div>
                                            <div class="col-md-2">
                                                <button class="btn btn-sm" id="agregarPago" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #f96f12;"></i></button>
                                            </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-4">
                                            <label for="">Restante:</label>
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control form-control-sm bg-light" readonly  id="totalRestante" >
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <table id="detallepagos" class="table-danger">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>método</th>
                                                    <th>Cantidad</th>
                                                    <th></th>
                                                  </tr>
                                            </thead>
                                            <tbody id="cuerpoPagos">
                                                <!-- traer datos  -->
                                            </tbody>
                                        </table>
                                    </div> 
                                
                                </div>                      
                            </div>
                            </div>

                        </div>
                    </div>
                </div>
                
                
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary "   id="md-guardar">Guardar</button>
        </div>
      </div>
    </div>
</div>

<script>
  
  const cardAtencion = document.querySelector("#cardAtencion");
  function listarCardsAtencion(){
    const parametros = new URLSearchParams();
    parametros.append("operacion","listarAtenciones");

    fetch("../controllers/atencion.php", {
      method: "POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos => {
      cardAtencion.innerHTML= "";

      datos.forEach(element => {
        const nuevoCard = `
        <div class="col-md-3" >
                <div class="card">
                    <div class="card-content">
                        <div class="card-header bg-info"></div>
                        <div class="card-body" style="text-align: center;">
                            <h5>${element.apellidoPaterno} ${element.apellidoMaterno},<br>${element.nombres}</h5>
                            <h6>${element.nombreServicio}</h6>
                            <div class='mt-2 row g-2'>
                                <div class='col-md-9'>
                                    <h6>S/${element.Total}</h6>
                                </div>
                                <div class='col-md-3'>
                                    <button class='btn btn-sm m-1' type='button'><i class="fa-solid fa-pen-to-square fa-2xl" style="color: #539bff;"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        `;
        cardAtencion.innerHTML +=nuevoCard;
      });
    })
  }
  listarCardsAtencion();
</script>