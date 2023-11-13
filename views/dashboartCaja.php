<div class="container-fluid">
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
</div>
<script>
    const efectivo = document.querySelector("#mEfectivo");
    const trasferencia = document.querySelector("#mTranferencia");
    const pos = document.querySelector("#mPOS");
    const yape = document.querySelector("#mYape");
    const plin = document.querySelector("#mPlin");

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
    montoMedioPago(1);
    montoMedioPago(2);
    montoMedioPago(3);
    montoMedioPago(4);
    montoMedioPago(5);

</script>
