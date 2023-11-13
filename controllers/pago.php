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
    case 'devolucion':
      $parametros = [
        "idatencion"          => $_POST['idatencion']
      ];
      $respuesta = $pago->cambiarEstadoDevolucion($parametros);
      echo json_encode($respuesta);
      break;
    case 'ingresos':
      echo json_encode($pago->ingresos());
      break;
    case 'montoMedioPago':
      echo json_encode($pago->montoMedioPago($_POST['idmedio']));
      break;
  }
}