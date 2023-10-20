<?php

require_once '../models/Atencion.php';

if(isset($_POST['operacion'])){

  $atencion = new Atencion ();

  switch($_POST['operacion']){
    case 'add':
      $parametros = [
        "turno"                 => $_POST['turno'],
        "idusuario"             => $_POST['idusuario'],
        "idpersona"             => $_POST['idpersona'],
        "idfamiliar"            => $_POST['idfamiliar'],
        "parentesco"            => $_POST['parentesco'],
        "orden"                 => $_POST['orden'],
        "fechaAtencion"         => $_POST['fechaAtencion']
    ];
      $respuesta = $atencion->create($parametros);
      echo json_encode($respuesta);
      break;

    case 'listarAtenciones':
      echo json_encode($atencion->listarAtenciones());
      break;
    case 'pagar':
      echo json_encode($atencion->pagar($_POST['idatencion']));
      break;
    case 'listarParaTriaje':
      echo json_encode($atencion->listarParaTriaje($_POST['numeroDocumento']));
      break;
    case 'editarFechaAtencion':
      $datos = [
        "idatencion"      => $_POST['idatencion'],
        "fechaAtencion"   => $_POST['fechaAtencion']
      ];
      $respuesta = $atencion->editarFechaAtencion($datos);
      echo json_encode($respuesta);
      break;
    case 'listarEspera':
      echo json_encode($atencion->listarEspera());
      break;
  }
}