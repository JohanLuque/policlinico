<?php

require_once '../models/EspecialistaServicio.php';

if(isset($_POST['operacion'])){

  $especialistaServicio = new EspecialistaServicio ();

  switch($_POST['operacion']){
    case 'getData':
      $parametros = ["idservicio" => $_POST['idservicio']];
      echo json_encode($especialistaServicio->getData($parametros));
      break;
    case 'registrar':
      $parametros = [
        "idEspecialista" => $_POST['idEspecialista'],
        "idServicio" => $_POST['idServicio']
      ];
      echo json_encode($especialistaServicio->registrarEspecialista($parametros));
      break;
  }
}