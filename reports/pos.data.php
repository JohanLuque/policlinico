<h1 class="text-center text-md">REPORTE POS</h1>

<table class="table table-border mt-3">
    <colgroup>
    <col style='width: 10%'>
    <col style='width: 20%'>
    <col style='width: 20%'>
    <col style='width: 30%'>
    <col style='width: 20%'>

    </colgroup>
    <thead>
        <tr>
            <th>FECHA</th>
            <th>PAGO</th>
            <th>N° DOC</th>
            <th>NOMBRE COMPLETO</th>
            <th>PRECIO</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($datos as $registro):   ?>
        <tr>
            <td><?=$registro['fecha']?></td>
            <td><?=$registro['nombrePago']?></td>
            <td><?=$registro['numeroDocumento']?></td>
            <td><?=$registro['nombreCompleto']?></td>
            <td><?=$registro['monto']?></td>
        </tr>
        <?php endforeach ?>
    </tbody>
</table>