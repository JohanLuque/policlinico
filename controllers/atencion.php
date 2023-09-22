<?php

require_once '../models/Atencion.php';

if(isset($_POST['operacion'])){

  $atencion = new Atencion ();

  switch($_POST['operacion']){
    case 'add':
      $parametros = [
        "turno"         => $_POST['turno'],
        "idusuario"     => $_POST['idusuario'],
        "idpersona"     => $_POST['idpersona'],
        "idfamiliar"    => $_POST['idfamiliar'],
        "parentesco"    => $_POST['parentesco'],
        "orden"         => $_POST['orden']
    ];
      $respuesta = $atencion->create($parametros);
      echo json_encode($respuesta);
      break;
  }
}