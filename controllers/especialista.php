<?php

require_once '../models/Especialista.php';

if(isset($_POST['operacion'])){

  $especialista = new Especialista ();

  switch($_POST['operacion']){
    case 'getData':
      $parametros = ["estado" => $_POST['estado']];
      echo json_encode($especialista->getData($parametros));
      break;
  }
}