<?php

require_once '../models/Enfermedad.php';

if(isset($_POST['operacion'])){

  $enfermedad = new Enfermedad();

  switch($_POST['operacion']){
    case 'registrarEnfermedad':
      $parametros = [
        "codigoCie_10"   => $_POST['codigoCie_10'],
        "descripcion"    => $_POST['descripcion']
    ];
      $respuesta = $enfermedad->registrarEnfermedad ($parametros);
      echo json_encode($respuesta);
      break;
  }
}