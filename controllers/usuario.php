<?php
session_start();
$_SESSION["login"] = [];

require_once '../models/Usuario.php';


if(isset($_POST['operacion'])){
  $usuario = new Usuario();

  
  if($_POST['operacion'] == 'inicioSesion'){
    $resultado = [
      "acceso" => false,
      "idUsuario" => 0,
      "usuario" => "",
      "mensaje" => "",
      "nombres" => "",
      "nivelacceso" => ""
    ];

    $data = $usuario->login($_POST['nombreUsuario']);

    
    if($data){

      $claveIngresada = $_POST['clave'];
      if (password_verify($claveIngresada, $data['clave'])){
        $resultado["acceso"] =  true;
        $resultado["mensaje"] = "Bienvenido al POLICLINICO SOLIDARIO";
        $resultado["nombres"] = $data["ApellidosNombres"];
        $resultado["idUsuario"] = $data["idUsuario"];
        $resultado["nivelacceso"] = $data["nivelAcceso"];
        $resultado["usuario"] = $data["nombreUsuario"];

      }else{
        $resultado["mensaje"] = "La contraseña es incorrecta";
      }
    }else{
      $resultado["mensaje"] = "El usuario NO existe";
    }

    $_SESSION["login"] = $resultado;
    
    echo json_encode($resultado);
  }
  if($_POST['operacion'] == 'registrarUsuario'){

    $claveOriginal = $_POST['clave'];
    $claveEncriptada = password_hash($claveOriginal, PASSWORD_BCRYPT);

    $datos = 
        [
          "idPersona"         => $_POST['idPersona'],
          "nombreUsuario"      => $_POST['nombreUsuario'],
          "clave"             => $claveEncriptada,
          "nivelAcceso"       => $_POST['nivelAcceso']
        ];
        echo json_encode($usuario->registrarUsuario($datos));
  }
  if($_POST['operacion'] == 'listarUsuario'){
    echo json_encode($usuario->listar($_POST['estado']));
  }
  if($_POST['operacion'] == 'eliminarUsuario') {
    $data = $usuario->login($_POST['nombreUsuario']);

    if($data){

      $claveIngresada = $_POST['clave'];
      if (password_verify($claveIngresada, $data['clave'])){
        echo json_encode($usuario->eliminarUsuario($_POST['idusuario'])); 
      }else{
        echo json_encode(["mensaje" => "incorrecto"]); 
      }
    }else{
      echo json_encode(["mensaje" => "no existe"]); 
    }

  }
}

if (isset($_GET['operacion']) == 'destroy'){
  session_destroy();
  session_unset();
  header("location:../");
}


?>