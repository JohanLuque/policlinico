<?php

require_once '../models/DetalleServicio.php';

if(isset($_POST['operacion'])){

  $detalleServicio = new DetalleServicio ();

  switch($_POST['operacion']){
    case 'add':
      $parametros = [
        "idservicios_detalle"   => $_POST['idserviciosdetalle']
    ];
      echo json_encode($detalleServicio->create($parametros));
      break;
  }
}