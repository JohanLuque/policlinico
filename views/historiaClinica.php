<div class="row">
  <div class="col-lg-6 d-flex align-items-strech">
    <div class="card w-100">
      <div class="card-body">
        <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
          <div class="mb-3 mb-sm-0">
            <h5 class="card-title fw-semibold">Historias clinicas:</h5>
          </div>
        <div>
      </div>
    </div>
    <div>
      <form id="form-historiaClinica" >
        <div class="mb-3 row g-2">
          <div class="col-md-2">
            <label for="">N° Doc:</label>          
          </div>                  
          <div class="col-md-3">                                  
            <input class="form-control form-control-sm" id="dni" type="text" placeholder="88888888" required>
          </div>
        </div>                
        <div class="mb-3 row g-2">
          <div class="col-md-3">
            <label for="">Nombre Completo:</label>          
          </div>
          <div class="col-md-8">                                  
            <input class="form-control form-control-sm" id="nombrePaciente" type="text" >
          </div>
        </div>
        <div class="mb-3 row g-2">
          <div class="col-md-3">
            <label for="">Antecedente Personal:</label>          
          </div>
          <div class="col-md-8">                                  
            <input class="form-control form-control-sm" id="antecedentePersonal" type="text" >
          </div>
        </div>
        <div class="mb-3 row g-2">
          <div class="col-md-3">
            <label for="">Antecedente Familiar:</label>          
          </div>
          <div class="col-md-8">                                  
            <input class="form-control form-control-sm" id="antecedenteFamiliar" type="text" >
          </div>
        </div>
        <div class="mb-3 row g-2">
          <div class="col-md-3">
            <label for="">Antecedente Quirurgico:</label>          
          </div>
          <div class="col-md-8">                                  
            <input class="form-control form-control-sm" id="antecedenteQuirurgico" type="text"  >
          </div>
        </div>
        <div class="mb-3 row g-2">
          <div class="col-md-3">
            <label for="">Antecedente Otros:</label>          
          </div>
          <div class="col-md-8">                                  
            <input class="form-control form-control-sm" id="antecedenteOtros" type="text" >
          </div>
        </div>                
        <div class="mb-3 row g-2">
          <div class="col-md-2">
            <label for="">Alergias:</label>           
          </div>
          <div class="col-md-5">                                  
            <select name="" id="alergias" class="form-select form-select-sm">
                <option value=""></option>
            </select>
          </div>
          <div class="col-md-2">
            <button class="btn btn-sm" id="agregarAlergia" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #f96f12;"></i></button>
          </div>
        </div>
        <div class="row g-2 mb-3">
          <table id="resumenAlergias" class="bg-light">
            <thead>
              <tr>
                <th>ID</th>
                <th>Alergia</th>
                <th></th>
              </tr>
            </thead>
            <tbody id="cuerpoAlergias">
              <!-- traer datos  -->
            </tbody>
          </table>
        </div>  
        <div class="mb-3 row g-2">
          <div class="d-grid">
            <button id="registrar-historia" class="btn btn-danger btn-sm mt-1" type="button">Guardar</button>
          </div> 
        </div>
      </form>
    </div>
  </div>
</div>
<script>
  const registrarHistoria = document.querySelector("#registrar-historia");
  const dni = document.querySelector("#dni");
  const nombreCompleto = document.querySelector("#nombrePaciente");
  const antecedentePersonal = document.querySelector("#antecedentePersonal");
  const antecedenteQuirurgico = document.querySelector("#antecedenteQuirurgico");
  const antecedenteOtros = document.querySelector("#antecedenteOtros");
  const antecedenteFamiliar = document.querySelector("#antecedenteFamiliar");
  const alergia = document.querySelector("#alergias");

  function buscarHistoria(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "getData");
    parametros.append("nroDocumento", dni.value);
    fetch("../controllers/historiaClinica.php",{
      method:"POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos =>{
      //console.log(datos)
      if(datos.length>0){
        toast("El paciente ya tiene historia");        
      }
      else{
        buscarPaciente();        
      }
    })
  }
  function buscarPaciente(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "getData");
    parametros.append("numeroDocumento", dni.value);
    fetch("../controllers/persona.php", {
      method : "POST",
      body: parametros
    })
    .then(response => response.json())
    .then(datos => {
      console.log(datos);
      if(datos.length>0){
        datos.forEach(element => {
          idPersona = element.idPersona;
          dni.value = dni.value;
          nombreCompleto.value = element.ApellidosNombres;
          
        });
      }else{
        toast("No se encontro registro de Paciente");
      }
    })
  }

  dni.addEventListener("keypress", (evt) => {
    if(evt.charCode == 13){
      buscarHistoria();
    } 
  });
</script>