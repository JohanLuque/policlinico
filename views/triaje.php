
<div class="container-fluid">
  <div class="card">
    <div class="card-header">
      <h1 class="text-center">Historia Clínica</h1>      
    </div>
    <div class="card-body">
      <div class="mb-2 row g-2">
        <div class="col-md-1">
          <label for="">Buscar:</label>
        </div>
        <div class="col-md-3 mb-4">
          <input type="text" class="form-control form-control-sm" id="buscarPaciente" maxlength="8">
        </div>
      </div>
      <div class="mb-2 row g-2" id="historia">  

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

  function listarHistoriaClinicaTodos(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "list");
    fetch("../controllers/historiaClinica.php",{
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
                  <div class="card-header bg-secondary" ></div>
                    <div class="card-body bg-light-secondary" style="text-align: center;">
                        <h4>${element.numeroDocumento}</h4>
                        <h5>${element.apellidoPaterno} ${element.apellidoMaterno},<br>${element.nombres}</h5>
                        
                        <button class='btn bg-secondary m-1' type='button'>
                          <a class='ver' type='button' style='text-decoration: none;color: white;' data-idatencion='${element.idHistoriaClinica}'>Ver Detalles</a>
                        </button>
                    </div>        
                  </div>
                </div>
              </div>
            </div> 
           
            `;
        cardHistoria.innerHTML +=nuevoCard;
      });
    })
  }

  listarHistoriaClinicaTodos();
  
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