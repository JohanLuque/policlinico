<?php

require_once '../models/DetalleServicio.php';

if(isset($_POST['operacion'])){

  $detalleServicio = new DetalleServicio ();

  switch($_POST['operacion']){
    case 'add':
      $parametros = [
        "idServicioDetalle"   => $_POST['idServicioDetalle']
    ];
      echo json_encode($detalleServicio->create($parametros));
      break;
    case 'resumen':
      echo json_encode($detalleServicio->resumen($_POST['idatencion']));
      break;
    case 'detalle':
      echo json_encode($detalleServicio->detalle_servicio($_POST['idatencion']));
      break;
  }
}