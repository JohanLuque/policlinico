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
    case 'listarSinHistoria':
      echo json_encode($historiaClininca->listarTriajeNoHayHistoria());
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
      break;
    case 'agregarEnfermedad':
      $parametros = [
        "idEnfermedad"  => $_POST['idEnfermedad'],
        "idDetalleAtencion"  => $_POST['idDetalleAtencion']
    ];
      $respuesta = $historiaClininca->agregarEnfermedad($parametros);
      echo json_encode($respuesta);
      break;
    case 'obtenerEnfermedad':
      $parametros = 
      [
        "codigoCie_10" =>  $_POST['codigoCie_10']
    ];
      $respuesta = $historiaClininca->obtenerEnfermedad($parametros);
      echo json_encode($respuesta);
      break;
    case 'detalleTratamiento':
        $parametros = [
          "idDetalleAtencion"   => $_POST['idDetalleAtencion'],
          "medicamento"         => $_POST['medicamento'],
          "presentacion"        => $_POST['presentacion'],
          "cantidad"            => $_POST['cantidad'],
          "dosis"               => $_POST['dosis'],
          "dias"                => $_POST['dias']
      ];
        $respuesta = $historiaClininca->detalleTratamiento($parametros);
        echo json_encode($respuesta);
        break;
    case 'registrarEnfermedades':
      $parametros = [
        "codigoCie_10" => $_POST["codigoCie_10"],
        "descripcion" => $_POST["descripcion"]
        ];
        echo json_encode($historiaClininca->registrarEnfermedades($parametros));
      break;
  }
}