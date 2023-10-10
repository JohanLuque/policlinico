<?php

require_once '../models/Alergia.php';

if(isset($_POST['operacion'])){

  $alergia = new Alergia ();

  switch($_POST['operacion']){
    case 'add':
      $parametros = [
        "idHistoriaClinica"     => $_POST['idHistoriaClinica'],
        "idAlergia"             => $_POST['idAlergia']
    ];
      $respuesta = $alergia->create($parametros);
      echo json_encode($respuesta);
      break;
    case 'listar':
      echo json_encode($alergia->listarAlergias());
      break;

  }
}