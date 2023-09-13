<?php

require_once '../models/Persona.php';

if(isset($_POST['operacion'])){

  $persona = new Persona ();

  switch($_POST['operacion']){
    case 'getData':
      $parametros = ["numeroDocumento" => $_POST['numeroDocumento']];
      echo json_encode($persona->getData($parametros));
      break;
  }
}