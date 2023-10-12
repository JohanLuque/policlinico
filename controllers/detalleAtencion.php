<?php

require_once '../models/DetalleAtencion.php';

$detalleAtencion = new DetalleAtencion ();

if(isset($_POST['operacion'])){

  switch($_POST['operacion']){
    case 'listarHistoriasClinicas':
      echo json_encode($detalleAtencion->listarHistoriasClinicas($_POST['nroDocumento']));
      break;
    case 'listarDetallehistorias':
      echo json_encode($detalleAtencion->getData($_POST['nroDocumento']));
      break ;
      case 'registrarDetalle':
        $parametros = [
          "idatencion"             => $_POST['idatencion'],
          "idhistoria"             => $_POST['idhistoria'],
          "peso"                   => $_POST['peso'],
          "talla"                  => $_POST['talla'],
          "frecuenciaCardiaca"     => $_POST['frecuenciaCardiaca'],
          "frecuenciaRespiratoria" => $_POST['frecuenciaRespiratoria'],
          "presionArterial"        => $_POST['presionArterial'],
          "temperatura"            => $_POST['temperatura'],
          "saturacionOxigeno"      => $_POST['saturacionOxigeno'],
          "idusuario"              => $_POST['idusuario']
        ];
        $respuesta = $detalleAtencion->create($parametros);
        echo json_encode($respuesta);
        break;
  }
}
