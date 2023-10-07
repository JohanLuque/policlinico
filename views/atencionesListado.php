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
                        <div class="card-header" style="background-color: aqua;"></div>
                        <div class="card-body ${colorFondo}" style="text-align: center;">
                            <h5>${element.apellidoPaterno} ${element.apellidoMaterno},<br>${element.nombres}</h5>
                            <h6>${element.nombreServicio}</h6>
                            <div class='mt-2 row g-2'>
                                <div class='col-md-6'>
                                    <h6>S/${element.Total}</h6>
                                </div>
                                <div class='col-md-6'>
                                    <button class='btn btn-sm m-1' type='button'>
                                        <a class='PAGAR' type='button' style='text-decoration: none;color: white; >Ver</a>
                                    </button>
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
</script>