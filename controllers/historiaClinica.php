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
    case 'obtenerDatosTriaje':
      echo json_encode($historiaClininca->obtenerDatosTriaje($_POST['idatencion']));
      break;
    case 'detalleHC':
      $parametros = [
        "idDetalleatencion"   => $_POST['idDetalleatencion'],
        "inicio"              => $_POST['inicio'],
        "curso"               => $_POST['curso'],
        "relato"              => $_POST['relato'],
        "procedimiento"       => $_POST['procedimiento'],
        "observaciones"       => $_POST['observaciones'],
        "examenGeneral"       => $_POST['examenGeneral'],
        "frecuencia"          => $_POST['frecuencia']
    ];
      $respuesta = $historiaClininca->detalleHistoriaClinica($parametros);
      echo json_encode($respuesta);
  }
}