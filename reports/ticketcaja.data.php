<h1 class="text-center text-md"><?=$titulo?></h1>
<?php foreach ($datosObtenidos as $registro):   ?>
    <h4 class="text-md">AV. SAN IDELFONSO #199 CEL: 956784052</h4>
    <h4 class="text-md">RUC: 20609198801</h4>
    <h1 class="text-md">N°: <?=$registro['numeroAtencion']?></h1>
    <h1 class="text-md">FECHA: <?=$registro['fechaHoraPago']?></h1>
    <h1 class="text-md">NOMBRE: <?=$registro['Paciente']?></h1>
    <h1 class="text-md">DNI: <?=$registro['numeroDocumento']?></h1>
    <h1 class="text-md">EDAD: <?=$registro['Edad']?></h1>
    <h1 class="text-md">TELÉFONO: <?=$registro['telefono']?></h1>
    <h1 class="text-md">ESPECIALIDAD: <?=$registro['Servicio']?></h1>
    <!-- <h1 class="text-center text-md"><?=$registro['MontoTotal']?></h1> -->
<?php endforeach ?>
<table class="table table-border td">
    <colgroup>
        <col style='width: 80%'>
        <col style='width: 20%'>
    </colgroup>
    <thead>
        <tr>
            <th class="text-md text-center">Descripción</th>
            <th class="text-md text-center">Total</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        <?php foreach ($pago as $registro3):?>
            <td class="text-md"><?=$registro3['descripcion']?></td>
            <td class="text-md"><?=$registro3['total']?></td>
        <?php endforeach ?>
            
        </tr>
    </tbody>
</table>

<?php foreach ($datos as $registro2):   ?>
    <h1 class="text-end text-md">SUB TOTAL:</h1>
    <h1 class="text-end text-md">I.G.V.</h1>
    <h1 class="text-end text-md">TOTAL: <?=$registro2['monto']?></h1>
    <h1 class="text-start text-md">MÉTODO DE PAGO: <?=$registro2['nombrePago']?></h1>
    <h1 class="text-start text-md">IMPORTE TOTAL: <?=$registro2['monto']?></h1>
<?php endforeach ?>


