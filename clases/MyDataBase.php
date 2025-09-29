<?php

class MyDataBase
{
    private $conexion;

    public function __construct() {
        //Carga configuracion desde config.ini
        $config = parse_ini_file(__DIR__ . "/../config/config.ini", true);
        $db = $config['database'];
        //Crear conexion
        $this->conexion = new mysqli(
            $db['host'],
            $db['user'],
            $db['password'],
            $db['dbname']
        );

        //Manejo de errores
        if($this->conexion->connect_error){
            die ("Error en la conexion" . $this->conexion->connect_error);
        }
    }

    //Ejecutar query genérica
    public function query($sql) {
        return $this->conexion->query($sql);
    }

    //Devolver resultados como array
    public function fetchAll($sql){
        $result = $this->query($sql);
        return $result ? $result->fetch_all(MYSQLI_ASSOC) : [];
    }

    public function prepare ($sql) {
        return $this->conexion->prepare($sql);
    }
    //Cerrar conexión
    public function close(){
        $this->conexion->close();
    }
}