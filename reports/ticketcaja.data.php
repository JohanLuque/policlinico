<h1 class="text-center text-md"><?=$titulo?></h1>
<?php foreach ($datosObtenidos as $registro):   ?>
    <h1 class="text-center text-md"><?=$registro['numeroAtencion']?></h1>
    <h1 class="text-center text-md"><?=$registro['fechaHoraPago']?></h1>
    <h1 class="text-center text-md"><?=$registro['Paciente']?></h1>
    <h1 class="text-center text-md"><?=$registro['numeroDocumento']?></h1>
    <h1 class="text-center text-md"><?=$registro['telefono']?></h1>
    <h1 class="text-center text-md"><?=$registro['Edad']?></h1>
    <h1 class="text-center text-md"><?=$registro['Servicio']?></h1>
    <h1 class="text-center text-md"><?=$registro['MontoTotal']?></h1>
<?php endforeach ?>
<?php foreach ($datos as $registro2):   ?>
    <h1 class="text-center text-md"><?=$registro2['idAtencion']?></h1>
    <h1 class="text-center text-md"><?=$registro2['idMedioPago']?></h1>
    <h1 class="text-center text-md"><?=$registro2['nombrePago']?></h1>
    <h1 class="text-center text-md"><?=$registro2['monto']?></h1>
<?php endforeach ?>

