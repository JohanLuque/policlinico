<?php

require_once '../models/Servicio.php';

if(isset($_POST['operacion'])){

  $servicio = new Servicio ();

  switch($_POST['operacion']){
    case 'getData':
      echo json_encode($servicio->getData());
      break;
  }
}
