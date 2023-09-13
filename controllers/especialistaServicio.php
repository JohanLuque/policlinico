<?php

require_once '../models/EspecialistaSericio.php';

if(isset($_POST['operacion'])){

  $especialistaServicio = new EspecialistaServicio ();

  switch($_POST['operacion']){
    case 'getData':
      $parametros = ["idservicio" => $_POST['idservicio']];
      echo json_encode($especialistaServicio->getData($parametros));
      break;
  }
}