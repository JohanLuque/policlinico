
<div class="card">
    <div class="card-body">
        <h5 class="card-title fw-semibold mb-4" style="color:#ff7619 ;">Historia Clínica</h5>
          <div class="col-md-1">
              <label for="">Buscar:</label>
          </div>
          <div class="col-md-3 mb-4">
              <input type="text" class="form-control form-control-sm" id="buscarPaciente" maxlength="8">
          </div>
          
          <div class="container-fluid">
            <div class="mb-2 row g-2" id="historia">
                 <!-- aqui iran las historias-->
            </div>
        </div>

    </div>
</div>



<script>
  const cardHistoria = document.querySelector("#historia");
  const buscar = document.querySelector("#buscarPaciente");

  function comprobar(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listarHistoriasClinicas");
    parametros.append("nroDocumento", buscar.value);
    fetch("../controllers/detalleAtencion.php",{
      method:"POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos =>{
      //console.log(datos)
      if(datos.length>0){
        console.log("si")
        listarHistoriaClinica();
      }
      else{
        console.log("no")
      }
    })
  }
  
  function listarHistoriaClinica(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "getData");
    parametros.append("nroDocumento", buscar.value);
    fetch("../controllers/detalleAtencion.php",{
      method:"POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos=>{
      cardHistoria.innerHTML="";
      datos.forEach(element => {
        const nuevoCard = `
        <div class="col-md-3" >
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <h5>${element.fecha} </h5>
                        </div>
                    </div>
                </div>
            </div> 
        `;
        cardHistoria.innerHTML +=nuevoCard;
      });
    })
  }


  buscar.addEventListener("keypress", (evt) => {
    if(evt.charCode == 13){
      comprobar();
    } 
  });


  
</script>