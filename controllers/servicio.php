<?php

require_once '../models/Servicio.php';

if(isset($_POST['operacion'])){

  $servicio = new Servicio ();

  switch($_POST['operacion']){
    case 'getData':
      echo json_encode($servicio->getData());
      break;
    case 'filtroServicios':
      $parametros = [
        "idServicio" => $_POST["idServicio"]
      ];
      echo json_encode($servicio->filtroServicios($parametros));
      break;
    case 'listarEspecialidades':
      echo json_encode($servicio->listarEspecialidades());
      break;
    case 'filtroDoctores':
      $parametros = [
        "idServicio" => $_POST["idServicio"]
        ];
        echo json_encode($servicio->filtroDoctores($parametros));
      break;
  }
}
