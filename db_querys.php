<?php
function conectarABaseDeDatos(){
    $conexion = new mysqli("localhost", "root", "", "pokedex");
    if($conexion->connect_error){
        die("Error en la conexion: " . $conexion->connect_error);

    }
    return $conexion;
}

function mostrarDatosPokemon($dex_entry){
    $conexion = conectarABaseDeDatos();
    $sql ="SELECT
    p.dex_entry,
    p.nombre,
    ei.categoria,
    t1.descripcion AS tipo1,
    t2.descripcion AS tipo2,
    p.hp,
    p.ataque,
    p.defensa,
    p.ataque_esp,
    p.defensa_esp,
    p.velocidad,
    ei.habilidad_nombre,
    ei.habilidad_descripcion,
    ei.dex_descripcion
FROM pokemon p
         LEFT JOIN pokemon_extra_info ei ON ei.id = p.dex_entry
         LEFT JOIN pokemon_tipos pt ON pt.pokemon_id = p.dex_entry
         LEFT JOIN tipos t1 ON t1.id = pt.tipo1_id
         LEFT JOIN tipos t2 ON t2.id = pt.tipo2_id
WHERE p.dex_entry = ?";
    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("i", $dex_entry);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_assoc();
    $stmt->close();
    $conexion->close();
    return $result;
}

function mostrarEvoluciones($dex_entry){
    $conexion = conectarABaseDeDatos();
    $sql = "SELECT
    p1.nombre AS etapa1,
    e1.metodo AS metodo1,
    p2.nombre AS etapa2,
    e2.metodo AS metodo2,
    p3.nombre AS etapa3
FROM (

    SELECT COALESCE(e_prev2.evoluciona_de, e_prev1.evoluciona_de, p.dex_entry) AS root_id
         FROM pokemon p
                  LEFT JOIN evoluciones e_prev1 ON e_prev1.evoluciona_a = p.dex_entry
                  LEFT JOIN evoluciones e_prev2 ON e_prev2.evoluciona_a = e_prev1.evoluciona_de
         WHERE p.dex_entry = ?
     ) r
         JOIN pokemon p1           ON p1.dex_entry       = r.root_id
         LEFT JOIN evoluciones e1  ON e1.evoluciona_de   = p1.dex_entry
         LEFT JOIN pokemon p2      ON p2.dex_entry       = e1.evoluciona_a
         LEFT JOIN evoluciones e2  ON e2.evoluciona_de   = p2.dex_entry
         LEFT JOIN pokemon p3      ON p3.dex_entry       = e2.evoluciona_a
ORDER BY p2.dex_entry;";
    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("i", $dex_entry);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    $stmt->close();
    $conexion->close();
    return $result;

}

function buscarDetallePorNombre($nombre) : ?int {
    $conexion = conectarABaseDeDatos();
    $sql = "SELECT dex_entry FROM pokemon WHERE nombre = ?";
    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("s", $nombre);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_assoc();
    $stmt->close();
    $conexion->close();
    return $result ? (int)$result['dex_entry'] : null;

}