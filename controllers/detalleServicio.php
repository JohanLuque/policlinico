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
  }
}