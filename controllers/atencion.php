<?php

require_once '../models/Atencion.php';

if(isset($_POST['operacion'])){

  $atencion = new Atencion ();

  switch($_POST['operacion']){
    case 'add':
      $parametros = [
        "idusuario"      => $_POST['idusuario'],
        "idpersona"     => $_POST['idpersona'],
        "idfamiliar"    => $_POST['idfamiliar'],
        "parentesco"    => $_POST['parentesco'],
        "idorden"       => $_POST['idorden'],
        "servicio"      => $_POST['servicio'],
        "precio"        => $_POST['precio']
    ];
      echo json_encode($atencion->create($parametros));
      break;
  }
}