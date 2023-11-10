<page format="80x279" style="font: arial;">
    <div class="">
        <img src="../views/images/logos/ticket.png" alt="" style="width: 200px; margin-top: 3mm; margin-left: 15mm">
    </div>
    <div class="text-xs mb-2">
        <?php foreach ($datosObtenidos as $registro):   ?>
            <div class="text-center">
                <label>AV. SAN IDELFONSO #199</label><br>
                <label class="text-bold">CEL:</label>
                <label>956784052</label><br>
                <label class="text-bold">RUC:</label>
                <label> 20609198801</label><br>
                <label class="text-bold">N°:</label>
                <label><?=$registro['numeroAtencion']?></label><br>
                <label class="text-bold">FECHA: </label>
                <label><?=$registro['fechaHoraPago']?></label><br>
            </div>
            <div class="mt-2">
                <label class="text-bold">NOMBRE:</label>
                <label><?=$registro['Paciente']?></label><br>
                <label class="text-bold">DNI:</label>
                <label><?=$registro['numeroDocumento']?></label><br>
                <label class="text-bold">EDAD: </label>
                <label><?=$registro['Edad']?></label><br>
                <label class="text-bold">TELÉFONO: </label>
                <label><?=$registro['telefono']?></label><br>
                <label class="text-bold">ESPECIALIDAD: </label>
                <label><?=$registro['Servicio']?></label><br>
            </div>     
            
        <?php endforeach ?>
    </div>
    <table class="table table-border mt-3">
        <colgroup>
            <col style='width: 80%'>
            <col style='width: 20%'>
        </colgroup>
        <thead>
            <tr>
                <th class="text-sm text-center">Descripción</th>
                <th class="text-sm text-center">Total</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($datos2 as $registro3):?>
                <tr>
                    <td class="text-xs"><?=$registro3['descripcion']?></td>
                    <td class="text-xs text-center"><?=$registro3['total']?></td>
                </tr>
            <?php endforeach ?>
        </tbody>
    </table>
    <div class="text-end mt-2">
        <?php foreach ($datosObtenidos as $registro):   ?>
            <label class="text-end text-sm text-bold">SUB TOTAL:</label>
            <label class="text-end text-sm"><?=$registro['subtotal']?></label><br>
            <label class="text-end text-sm text-bold">I.G.V.:</label>
            <label class="text-end text-sm"><?=$registro['IGV']?></label><br>
            <label class="text-end text-sm text-bold">TOTAL:</label>
            <label class="text-end text-sm"><?=$registro['MontoTotal']?></label> <br>
        <?php endforeach ?>
    </div>
    <div class="">
        <?php foreach ($datos1 as $registro2):   ?>
            <h1 class="text-start text-xs">MÉTODO DE PAGO: <?=$registro2['nombrePago']?></h1>
        <?php endforeach ?>
        <?php foreach ($datosObtenidos as $registro):   ?>
            <label class="text-end text-xs">IMPORTE TOTAL:<?=$registro['MontoTotal']?></label> <br>
        <?php endforeach ?>
    </div >

</page>


