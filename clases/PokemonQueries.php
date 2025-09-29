<?php
require_once "./clases/MyDataBase.php";

class PokemonQueries
{
    private $db;

    public function __construct()
    {
        $this->db = new MyDataBase();
    }

    public function obtenerListadoDePokemons()
    {
        $sql = "SELECT p.dex_entry, p.nombre, t1.descripcion as tipo1, t2.descripcion as tipo2, p.hp, p.ataque, p.defensa, p.ataque_esp, p.defensa_esp, p.velocidad
                    FROM pokemon p 
                    JOIN pokemon_tipos pt on p.dex_entry = pt.pokemon_id
                    JOIN tipos t1 ON pt.tipo1_id = t1.id
                    LEFT JOIN tipos t2 ON pt.tipo2_id = t2.id
                    ORDER BY p.dex_entry;";
        return $this->db->fetchAll($sql);
    }

    public function obtenerPokemonPorNumero($id)
    {

        $sql = "SELECT p.dex_entry, p.nombre, t1.descripcion as tipo1, t2.descripcion as tipo2, p.hp, p.ataque, p.defensa, p.ataque_esp, p.defensa_esp, p.velocidad
                    FROM pokemon p 
                    JOIN pokemon_tipos pt on p.dex_entry = pt.pokemon_id
                    JOIN tipos t1 ON pt.tipo1_id = t1.id
                    LEFT JOIN tipos t2 ON pt.tipo2_id = t2.id
                    WHERE p.dex_entry = ?
                    ORDER BY p.dex_entry;";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $resultado = $stmt->get_result();

        return mysqli_fetch_all($resultado, MYSQLI_ASSOC);
    }

    public function obtenerPokemonPorNombre($nombre)
    {
        $sql = "SELECT p.dex_entry, p.nombre,
                   t1.descripcion AS tipo1,
                   t2.descripcion AS tipo2,
                   p.hp, p.ataque, p.defensa,
                   p.ataque_esp, p.defensa_esp, p.velocidad
            FROM pokemon p
            JOIN pokemon_tipos pt ON p.dex_entry = pt.pokemon_id
            JOIN tipos t1 ON pt.tipo1_id = t1.id
            LEFT JOIN tipos t2 ON pt.tipo2_id = t2.id
            WHERE (
                LOWER(p.nombre) = LOWER(?)
                OR (
                    LOWER(p.nombre) LIKE LOWER(CONCAT(?, '%'))
                    AND NOT EXISTS (
                        SELECT 1 FROM pokemon WHERE LOWER(nombre) = LOWER(?)
                    )
                )
            )
            ORDER BY p.dex_entry";

        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("sss", $nombre, $nombre, $nombre);
        $stmt->execute();
        return $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    }

    public function obtenerPokemonPorTipo($tipo)
    {
        $like = "%" . $tipo . "%";
        $sql = "SELECT p.dex_entry, p.nombre, t1.descripcion as tipo1, t2.descripcion as tipo2, p.hp, p.ataque, p.defensa, p.ataque_esp, p.defensa_esp, p.velocidad
                    FROM pokemon p 
                    JOIN pokemon_tipos pt on p.dex_entry = pt.pokemon_id
                    JOIN tipos t1 ON pt.tipo1_id = t1.id
                    LEFT JOIN tipos t2 ON pt.tipo2_id = t2.id
                    WHERE LOWER(t1.descripcion) LIKE ? OR LOWER(t2.descripcion) LIKE ?
                    ORDER BY p.dex_entry;";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("ss", $like, $like);
        $stmt->execute();
        $resultado = $stmt->get_result();
        return mysqli_fetch_all($resultado, MYSQLI_ASSOC);

    }

    public function mostrarEvoluciones($dex_entry)
    {
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
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("i", $dex_entry);
        $stmt->execute();
        $resultado = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
        return $resultado;
    }

    public function mostrarDetallePokemon($dex_entry)
    {
        $sql = "SELECT
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
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("i", $dex_entry);
        $stmt->execute();
        $resultado = $stmt->get_result();
        $stmt->close();
        return $resultado->fetch_assoc();
    }

    public function buscarDetallePorNombre($nombre): ?int {
        $sql = "SELECT dex_entry FROM pokemon WHERE nombre = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("s", $nombre);
        $stmt->execute();
        $result = $stmt->get_result()->fetch_assoc();
        $stmt->close();
        return $result ? (int)$result['dex_entry'] : null;

    }

}