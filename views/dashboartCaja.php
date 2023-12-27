<?php require_once 'permisos.php'; ?>
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
    </div>
    <div class="row">
        
        
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
        <div class="col-md-6 col-lg-8 d-flex align-items-stretch">
            <div class="card w-100">
                <div class="card-body">
                    <h5 class="card-title fw-semibold">Reporte de Servicios</h5>
                    <div class="row mt-3">                        
                        <div class="col-md-8">
                            <select name="" class="form-select" id="servicios"></select>                            
                        </div>
                        <div class="col-md-4">
                            <select name="" class="form-select"  id="mes">
                                <option value="0">Seleccione</option>
                                <option value="1">Enero</option>
                                <option value="2">Febrero</option>
                                <option value="3">Marzo</option>
                                <option value="4">Abril</option>
                                <option value="5">Mayo</option>
                                <option value="6">Junio</option>
                                <option value="7">Julio</option>
                                <option value="8">Agosto</option>
                                <option value="9">Septiembre</option>
                                <option value="10">Octubre</option>
                                <option value="11">Noviembre</option>
                                <option value="12">Diciembre</option>
                            </select>                            
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-9">
                            <span class="round-8 text-bg-secondary rounded-circle me-2 d-inline-block"></span>
                            <label for="">Por semana</label>
                        </div>
                        <div class="col-md-3">
                            <button type="button" id="Rsemana" class="d-inline-flex align-items-center justify-content-center btn btn-secondary btn-circle btn-lg">
                                <i class="fs-5 ti ti-file-description"></i>
                            </button>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-9">
                            <span class="round-8 text-bg-primary rounded-circle me-2 d-inline-block"></span>
                            <label for="">Por quincena</label>
                        </div>
                        <div class="col-md-3">
                            <button type="button" id="RQuincena" class="d-inline-flex align-items-center justify-content-center btn btn-primary btn-circle btn-lg">
                                <i class="fs-5 ti ti-file-description"></i>
                            </button>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-9">
                            <span class="round-8 text-bg-danger rounded-circle me-2 d-inline-block"></span>
                            <label for="">Por Mes</label>
                        </div>
                        <div class="col-md-3">
                            <button type="button" id="RMensual" class="d-inline-flex align-items-center justify-content-center btn btn-danger btn-circle btn-lg">
                                <i class="fs-5 ti ti-file-description"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-4 d-flex align-items-stretch">
            <div class="card w-100">
                <div class="card-body">
                    <h5 class="card-title fw-semibold">Reporte de POS</h5>
                    <div class="row mt-3"> 
                        <div class="col-md-4">
                            <label class="text-dark"  for="">Fecha:</label>          
                        </div>                       
                        <div class="col-md-8">
                            <input type="date" class="form-control" id="FechaActual" >
                        </div>
                        
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-9">
                            <span class="round-8 text-bg-secondary rounded-circle me-2 d-inline-block"></span>
                            <label for="">Generar reporte</label>
                        </div>
                        <div class="col-md-3">
                            <button type="button" id="reportePOS" class="d-inline-flex align-items-center justify-content-center btn btn-secondary btn-circle btn-lg">
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
    const fecha = document.querySelector("#FechaActual");
    const rPOS = document.querySelector("#reportePOS");
    // cantidad de dinero disponible
    const efectivo = document.querySelector("#mEfectivo");
    const trasferencia = document.querySelector("#mTranferencia");
    const pos = document.querySelector("#mPOS");
    const yape = document.querySelector("#mYape");
    const plin = document.querySelector("#mPlin");
    let totalingresos;
    const tIngresos = document.querySelector("#ingresos");
    // reporte de servicios
    const servicios = document.querySelector("#servicios");
    const mes = document.querySelector("#mes");
    const reporteSemanal = document.querySelector("#Rsemana");
    const reporteQuincenal = document.querySelector("#RQuincena");
    const reporteMensual = document.querySelector("#RMensual");
    let fechaHoy;

    function obtenerFecha(){
        const fechaAhora = new Date();
        const año = fechaAhora.getFullYear();
        const mes = (fechaAhora.getMonth() + 1).toString().padStart(2,"0");
        const dia = fechaAhora.getDate().toString().padStart(2, "0");

        const fechaTotal = `${año}-${mes}-${dia}`;
        fecha.value = fechaTotal;
        fechaHoy = fechaTotal;
        console.log(fecha.value);
    }
    obtenerFecha();
    
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
                })
            }
        })
    }

    function listarServicios(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarServiciosReporte");
        fetch("../controllers/servicio.php", {
            method : "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos =>{
            if(datos.length){
                servicios.innerHTML = "<option value=''>Seleccione</option>";
                datos.forEach(element => {
                    const optionTag = document.createElement("option");
                    optionTag.value = element.idServicio;
                    optionTag.text = element.nombreServicio;
                    servicios.appendChild(optionTag);                
                })
            }
        })
    }
    
    rPOS.addEventListener("click",() => {
        const parametros = new URLSearchParams();
        parametros.append("fecha", fecha.value);
        window.open(`../reports/pos.report.php?${parametros}`, '_blank');
    });

    reporteMensual.addEventListener("click",() => {
        if(servicios.value > 0){
            if(mes.value > 0){
                const parametros = new URLSearchParams();
                parametros.append("idservicio", servicios.value);
                parametros.append("mes", mes.value);
                parametros.append("titulo", servicios.options[servicios.selectedIndex].text);

                window.open(`../reports/servicio.mensual.report.php?${parametros}`, '_blank');
            }else{
                toast("Seleccione un mes");
            }
        }else{
            toast("Seleccione un servicio");
        }
    });

    reporteQuincenal.addEventListener("click",() => {
        if(servicios.value > 0){
            const parametros = new URLSearchParams();
            parametros.append("idservicio", servicios.value);
            parametros.append("titulo", servicios.options[servicios.selectedIndex].text);
            window.open(`../reports/servicio.quincenal.report.php?${parametros}`, '_blank');
        }else{
            toast("Seleccione un servicio");
        }
    });

    reporteSemanal.addEventListener("click",() => {
        if(servicios.value > 0){
            const parametros = new URLSearchParams();
            parametros.append("idservicio", servicios.value);
            parametros.append("titulo", servicios.options[servicios.selectedIndex].text);
            window.open(`../reports/servicio.report.php?${parametros}`, '_blank');
        }else{
            toast("Seleccione un servicio");
        }
    });
    

    listarServicios();
    ingresos();
    montoMedioPago(1);
    montoMedioPago(2);
    montoMedioPago(3);
    montoMedioPago(4);
    montoMedioPago(5);

</script>
