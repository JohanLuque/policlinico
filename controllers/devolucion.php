<?php

require_once '../models/Devolucion.php';

if(isset($_POST['operacion'])){

  $devolucion = new Devolucion ();

  switch($_POST['operacion']){
    case 'registrarDevolucion':
      $parametros = [
        "motivoDevolucion"   => $_POST['motivoDevolucion'],
        "montoDevolucion"    => $_POST['montoDevolucion'],
        "idAtencion"         => $_POST['idAtencion'],
        "idMedioPago"        => $_POST['idMedioPago']
    ];
      $respuesta = $devolucion->registrarDevolucion($parametros);
      echo json_encode($respuesta);
      break;
    case "traerDatosDevolucion":
      echo json_encode($devolucion->traerDatosDevolucion($_POST["idAtencion"]));
      break;
  }
}