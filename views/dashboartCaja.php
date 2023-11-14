<div class="container-fluid">
    <div class="row">
        <div class="col-md-5">
            <div class="card   bg-light-danger ">
                <div class="card-body p-4">
                    <div class="d-flex align-items-center">
                        <div class="round rounded  d-flex align-items-center justify-content-center">
                            <button class="btn ">
                                <img src="./images/products/ingresos.png" alt="" width="40px">
                            </button>
                        </div>
                        <h6 class="mb-0 ms-3 text-danger" id="">Total Ingresos:</h6>
                        <h4 class="mb-0 ms-3 text-danger" id="ingresos"></h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md">
            <div class="card  ">
                <div class="card-body p-4">
                    <div class="d-flex align-items-center ">
                        <div class="round rounded  d-flex align-items-center justify-content-center">
                            <button class="btn ">
                                <img src="./images/products/efectivo.png" alt="" width="40px">
                            </button>
                        </div>
                        <h6 class="mb-0 ms-3" id="mEfectivo"></h6>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md">
            <div class="card ">
                <div class="card-body p-4">
                    <div class="d-flex align-items-center">
                        <div class="round rounded  d-flex align-items-center justify-content-center">
                            <button class="btn ">
                                <img src="./images/products/tarjeta.png" alt="" width="40px">
                            </button>
                        </div>
                        <h6 class="mb-0 ms-3" id="mTranferencia">S/700 </h6>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md">
            <div class="card ">
                <div class="card-body p-4">
                    <div class="d-flex align-items-center">
                        <div class="round rounded  d-flex align-items-center justify-content-center">
                            <button class="btn ">
                                <img src="./images/products/pos.png" alt="" width="40px">
                            </button>
                        </div>
                        <h6 class="mb-0 ms-3" id="mPOS">S/500 </h6>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md">
            <div class="card ">
                <div class="card-body p-4">
                    <div class="d-flex align-items-center">
                        <div class="round rounded  d-flex align-items-center justify-content-center">
                            <button class="btn ">
                                <img src="./images/products/yape.png" alt="" width="40px">
                            </button>
                        </div>
                        <h6 class="mb-0 ms-3" id="mYape">S/500 </h6>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md">
            <div class="card">
                <div class="card-body p-4">
                    <div class="d-flex align-items-center">
                        <div class="round rounded  d-flex align-items-center justify-content-center">
                            <button class="btn ">
                                <img src="./images/products/plin.png" alt="" width="40px">
                            </button>
                        </div>
                        <h6 class="mb-0 ms-3" id="mPlin">S/500 </h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-lg-4 d-flex align-items-stretch">
            <div class="card w-100">
                <div class="card-body">
                    <h5 class="card-title fw-semibold">Reporte de Servicios</h5>
                    <div class="row mt-3">
                        <div class="col-md-5">
                            <div class="me-4">
                                <span class="round-8 text-bg-primary rounded-circle me-2 d-inline-block"></span>
                                <span>Servicio:</span>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <select name="" class="form-select" id=""></select>                            
                        </div>
                    </div>
                    <!-- <div class="d-flex align-items-center">
                        <div class="me-4">
                            <span class="round-8 text-bg-primary rounded-circle me-2 d-inline-block"></span>
                        </div>
                        <div>
                            <span class="round-8 text-bg-secondary rounded-circle me-2 d-inline-block"></span>
                            <span class=fs-2"">sbvijs</span>
                        </div>
                    </div> -->
                    <div class="row mt-4">
                        <div class="col-md-9">
                            <label for="">Por semana</label>
                        </div>
                        <div class="col-md-3">
                            <button type="button" class="d-inline-flex align-items-center justify-content-center btn btn-secondary btn-circle btn-lg">
                                <i class="fs-5 ti ti-file-description"></i>
                            </button>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-9">
                            <label for="">Por quincena</label>
                        </div>
                        <div class="col-md-3">
                            <button type="button" class="d-inline-flex align-items-center justify-content-center btn btn-primary btn-circle btn-lg">
                                <i class="fs-5 ti ti-file-description"></i>
                            </button>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-9">
                            <label for="">Por Mes</label>
                        </div>
                        <div class="col-md-3">
                            <button type="button" class="d-inline-flex align-items-center justify-content-center btn btn-danger btn-circle btn-lg">
                                <i class="fs-5 ti ti-file-description"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    const efectivo = document.querySelector("#mEfectivo");
    const trasferencia = document.querySelector("#mTranferencia");
    const pos = document.querySelector("#mPOS");
    const yape = document.querySelector("#mYape");
    const plin = document.querySelector("#mPlin");
    let totalingresos;
    const tIngresos = document.querySelector("#ingresos");
    function montoMedioPago(idmedio){
        const parametros = new URLSearchParams();
        parametros.append("operacion" , "montoMedioPago");
        parametros.append("idmedio" , idmedio);

        fetch("../controllers/pago.php",{
            method : "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            datos.forEach(element => {
                if(idmedio == 1){
                    yape.innerHTML = `S/ ${element.total}` ;
                }else if(idmedio == 2){
                    trasferencia.innerHTML = `S/ ${element.total}`;
                }else if(idmedio == 3){
                    efectivo.innerHTML =  `S/ ${element.total}`;
                }else if(idmedio == 4){
                    plin.innerHTML = `S/ ${element.total}`;
                }else if(idmedio == 5){
                    pos.innerHTML =  `S/ ${element.total}`;
                }
            });
        })
    }
    function ingresos(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "ingresos");
        fetch("../controllers/pago.php", {
            method : "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos =>{
            if(datos.length){
                datos.forEach(element => {
                    tIngresos.innerHTML = `S/ ${element.MontoTotal}`;
                    console.log(totalingresos);
                
                })
            }
        })
    }
    ingresos();
    montoMedioPago(1);
    montoMedioPago(2);
    montoMedioPago(3);
    montoMedioPago(4);
    montoMedioPago(5);

</script>
