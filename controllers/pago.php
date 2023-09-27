<?php

require_once '../models/Pago.php';

if(isset($_POST['operacion'])){

  $pago = new Pago ();

  switch($_POST['operacion']){
    case 'RegistrarPago':
      $parametros = [
        "idatencion"          => $_POST['idatencion'],
        "idMedioPago"         => $_POST['idMedioPago'],
        "monto"               => $_POST['monto']
    ];
      $respuesta = $pago->RegistrarPago($parametros);
      echo json_encode($respuesta);
      break; 
    case 'cambiarEstado':
      $parametros = [
        "idatencion"          => $_POST['idatencion']
    ];
      $respuesta = $pago->cambiarEstado($parametros);
      echo json_encode($respuesta);
      break;    
  }
}