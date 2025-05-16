<?php
$servidor = "db";
$usuario = "root";
$contrasena = "rootpassword";
$base_datos = "sapestore";

$conn = new mysqli($servidor, $usuario, $contrasena, $base_datos);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>