<h1 class="text-center text-md">REPORTE QUINCENAL: <?=$titulo?></h1>

<table class="table table-border mt-3">
    <colgroup>
    <col style='width: 10%'>
    <col style='width: 30%'>
    <col style='width: 10%'>
    <col style='width: 10%'>
    <col style='width: 40%'>

    </colgroup>
    <thead>
        <tr>
            <th>FECHA</th>
            <th>NOMBRE COMPLETO</th>
            <th>N° DOC</th>
            <th>PRECIO</th>
            <th>DESCRIPCIÓN</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($datos as $registro):   ?>
        <tr>
            <td><?=$registro['fecha']?></td>
            <td><?=$registro['nombreCompleto']?></td>
            <td><?=$registro['numeroDocumento']?></td>
            <td><?=$registro['precio']?></td>
            <td><?=$registro['descripcion']?></td>
        </tr>
        <?php endforeach ?>
    </tbody>
</table>