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
      }else{
        $resultado["mensaje"] = "La contraseña es incorrecta";
      }
    }else{
      $resultado["mensaje"] = "El usuario NO existe";
    }

    $_SESSION["login"] = $resultado;
    
    echo json_encode($resultado);
  }
}

if (isset($_GET['operacion']) == 'destroy'){
  session_destroy();
  session_unset();
  header("location:../");
}

?>