<?php

require_once '../models/DetalleAtencion.php';

$detalleAtencion = new DetalleAtencion ();

if(isset($_POST['operacion'])){

  switch($_POST['operacion']){
    case 'listarHistoriasClinicas':
      echo json_encode($detalleAtencion->listarHistoriasClinicas($_POST['nroDocumento']));
      break;
    case 'getData':
      echo json_encode($detalleAtencion->getData($_POST['nroDocumento']));
      break ;
  }
}
