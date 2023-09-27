<?php

require_once '../models/MediosPago.php';

if(isset($_POST['operacion'])){

  $mediosP = new MediosPago ();

  switch($_POST['operacion']){
    case 'listar':
      echo json_encode($mediosP->listarMediosPago());
      break;
  }
}