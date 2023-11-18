<?php

require_once '../models/Persona.php';

if(isset($_POST['operacion'])){

  $persona = new Persona ();

  switch($_POST['operacion']){
    case 'getData':
      $parametros = ["numeroDocumento" => $_POST['numeroDocumento']];
      echo json_encode($persona->getData($parametros));
      break;
    
      case 'registrarPersona':
        $datos = 
        [
          "nombres"             => $_POST['nombres'],
          "apellidoPaterno"     => $_POST['apellidoPaterno'],
          "apellidoMaterno"     => $_POST['apellidoMaterno'],
          "tipoDocumento"       => $_POST['tipoDocumento'],
          "numeroDocumento"     => $_POST['numeroDocumento'],
          "fechaNacimiento"     => $_POST['fechaNacimiento'],
          "genero"              => $_POST['genero'],
          "telefono"            => $_POST['telefono'],
          "distrito"            => $_POST['distrito']
        ];
        echo json_encode($persona->registrarPersona($datos));
        break;

  }

}