<?php

require_once '../models/Gasto.php';

if(isset($_POST['operacion'])){

  $gasto = new Gasto ();

  switch($_POST['operacion']){
    case 'registrarGasto':
      $parametros = [
        "montoGasto"        => $_POST['montoGasto'],
        "descripcionGasto"  => $_POST['descripcionGasto'],
        "idPersona"         => $_POST['idPersona'],
        "idMedioPago"       => $_POST['idMedioPago'],
        "idUsuario"       => $_POST['idUsuario']
    ];
      $respuesta = $gasto->registrarGasto($parametros);
      echo json_encode($respuesta);
      break;
    case "listarGastos":
      echo json_encode($gasto->listarGastos());
      break;
  }
}