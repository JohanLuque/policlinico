<?php

require_once '../models/HistoriaClinica.php';

if(isset($_POST['operacion'])){

  $historiaClininca = new HistoriaClinica ();

  switch($_POST['operacion']){
    case 'add':
      $parametros = [
        "idpersona"             => $_POST['idpersona'],
        "idusuario"             => $_POST['idusuario'],
        "antecedentePersonal"   => $_POST['antecedentePersonal'],
        "antecedenteFamiliar"   => $_POST['antecedenteFamiliar'],
        "antecedenteQuirurgico" => $_POST['antecedenteQuirurgico'],
        "antecedenteOtro"       => $_POST['antecedenteOtro']
    ];
      $respuesta = $historiaClininca->create($parametros);
      echo json_encode($respuesta);
      break;
    case 'list':
      echo json_encode($historiaClininca->listar());
      break;
    case 'getData':
      echo json_encode($historiaClininca->buscarHistorias($_POST['nroDocumento']));
      break;
    case 'listarTriaje':
      echo json_encode($historiaClininca->listarTriajeHistorias());
      break;
  }
}