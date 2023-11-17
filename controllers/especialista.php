<?php

require_once '../models/Especialista.php';

if(isset($_POST['operacion'])){

  $especialista = new Especialista ();

  switch($_POST['operacion']){
    case 'getData':
      $parametros = ["estado" => $_POST['estado']];
      echo json_encode($especialista->getData($parametros));
      break;

    case 'registrarEspecialista':
        $datos = 
        [
          "idPersona"   => $_POST['idPersona'],
          "codigo"      => $_POST['codigo']
        ];
        echo json_encode($especialista->registrarEspecialista($datos));
        break;
  }
}