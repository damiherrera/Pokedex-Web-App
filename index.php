<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pokedex</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.cdnfonts.com/css/pokemon-solid" rel="stylesheet">
    <link href="https://fonts.cdnfonts.com/css/eviolite-b" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="./style.css">

</head>
<body class="bg-dark text-white">

<header>
    <div class="container-fluid d-flex justify-content-between" style="background-color:#cc0000">
        <img src="./images/Poké_Ball_icon.svg" alt="Pokeball-logo" height="128px" width="128px">
        <h1 class="mb-4 text-center  h1 display-1 align-self-center" style="font-family: 'Eviolite B', sans-serif; color: #ffde00;  -webkit-text-stroke: 2px #3b4cca;">POKEDEX</h1>
        <form action="#" method="post" class="align-self-center">
            <div class="row">
                <div class="col">
                    <input type="text" class="form-control" placeholder="Usuario" name="email">
                </div>
                <div class="col">
                    <input type="password" class="form-control" placeholder="Password" name="pswd">
                </div>
                <div class="col">
                    <button type="submit" class="btn" style="background-color: #ffde00; font-weight: bold">Ingresar</button>
                </div>
            </div>
        </form>
    </div>
</header>
<main>

    <form action="" method="POST">
        <div class="input-group mb-3 container pt-5 ">
            <input type="text"  name="busqueda" class="form-control " placeholder="Ingrese el nombre, tipo o número de pokémon...">
            <button class="btn" type="submit" class="btn" style="background-color: #ffde00; font-weight: bold">Quien es ese pokémon?</button>
        </div>
    </form>


    <div class="container py-5">

        <div id="pokemon-list" class="table-responsive">
            <table class="table table-bordered table-hover table-striped table-dark table-striped">
                <thead class="table-dark">
                <tr>
                    <th class='text-center align-middle'>#</th>
                    <th class='text-center align-middle'>Imagen</th>
                    <th class='text-center align-middle'>Nombre</th>
                    <th class='text-center align-middle'>Tipo</th>
                    <th class='text-center align-middle'>Ataque</th>
                    <th class='text-center align-middle'>Defensa</th>
                    <th class='text-center align-middle'>Ataque Esp.</th>
                    <th class='text-center align-middle'>Defensa Esp.</th>
                    <th class='text-center align-middle'>Velocidad</th>
                </tr>
                </thead>
                <tbody>
                <img src="./images/sprites_3d/" alt="">
                <?php
                $conexion = mysqli_connect("localhost", "root", "", "pokedex");


                $busqueda = isset($_POST['busqueda']) ? $_POST['busqueda'] : '';

                if($busqueda == ""){
                    $sql = "SELECT p.dex_entry, p.nombre, t1.descripcion as tipo1, t2.descripcion as tipo2, p.hp, p.ataque, p.defensa, p.ataque_esp, p.defensa_esp, p.velocidad
                    FROM pokemon p 
                    JOIN pokemon_tipos pt on p.dex_entry = pt.pokemon_id
                    JOIN tipos t1 ON pt.tipo1_id = t1.id
                    LEFT JOIN tipos t2 ON pt.tipo2_id = t2.id
                    ORDER BY p.dex_entry;
                    ";
                    $resultado = mysqli_query($conexion, $sql);
                    $datos = mysqli_fetch_all($resultado, MYSQLI_ASSOC);

                } else if ($busqueda != "") {
                    if (is_numeric($busqueda)) {
                        $sql = "SELECT p.dex_entry, p.nombre, t1.descripcion as tipo1, t2.descripcion as tipo2, p.hp, p.ataque, p.defensa, p.ataque_esp, p.defensa_esp, p.velocidad
                                FROM pokemon p 
                                JOIN pokemon_tipos pt on p.dex_entry = pt.pokemon_id
                                JOIN tipos t1 ON pt.tipo1_id = t1.id
                                LEFT JOIN tipos t2 ON pt.tipo2_id = t2.id
                                WHERE p.dex_entry = ?
                                ORDER BY p.dex_entry";
                        $stmt = $conexion->prepare($sql);
                        $stmt->bind_param("i", $busqueda);
                        $stmt->execute();// "i" para integer
                        $resultado = $stmt->get_result();
                        $datos = mysqli_fetch_all($resultado, MYSQLI_ASSOC);
                    } else {
                        $sql = "SELECT p.dex_entry, p.nombre, t1.descripcion as tipo1, t2.descripcion as tipo2, p.hp, p.ataque, p.defensa, p.ataque_esp, p.defensa_esp, p.velocidad
                                FROM pokemon p 
                                JOIN pokemon_tipos pt on p.dex_entry = pt.pokemon_id
                                JOIN tipos t1 ON pt.tipo1_id = t1.id
                                LEFT JOIN tipos t2 ON pt.tipo2_id = t2.id
                                WHERE LOWER(nombre) = ?
                                ORDER BY p.dex_entry";
                        $stmt = $conexion->prepare($sql);
                        $stmt->bind_param("s", $busqueda);
                        $stmt->execute();
                        $resultado = $stmt->get_result();
                        $datos = mysqli_fetch_all($resultado, MYSQLI_ASSOC);


                        if (count($datos) === 0) {
                            $like = "%" . $busqueda . "%";
                            $sql = "SELECT p.dex_entry, p.nombre, t1.descripcion as tipo1, t2.descripcion as tipo2, p.hp, p.ataque, p.defensa, p.ataque_esp, p.defensa_esp, p.velocidad
                                FROM pokemon p 
                                JOIN pokemon_tipos pt on p.dex_entry = pt.pokemon_id
                                JOIN tipos t1 ON pt.tipo1_id = t1.id
                                LEFT JOIN tipos t2 ON pt.tipo2_id = t2.id 
                                WHERE LOWER(nombre) LIKE ? OR LOWER(t1.descripcion) LIKE ? OR LOWER(t2.descripcion) LIKE ?
                                ORDER BY p.dex_entry";
                            $stmt = $conexion->prepare($sql);
                            $stmt->bind_param("sss", $like, $like, $like);
                            $stmt->execute();
                            $resultado = $stmt->get_result();
                            $datos = mysqli_fetch_all($resultado, MYSQLI_ASSOC);

                        }


                    }




                }

                if (count($datos) === 0) {


                    echo "<tr><td colspan='10' class='text-center'>No se encontró ningún Pokémon con ese criterio.</td></tr>";
                    $sql = "SELECT p.dex_entry, p.nombre, t1.descripcion as tipo1, t2.descripcion as tipo2, p.hp, p.ataque, p.defensa, p.ataque_esp, p.defensa_esp, p.velocidad
                    FROM pokemon p 
                    JOIN pokemon_tipos pt on p.dex_entry = pt.pokemon_id
                    JOIN tipos t1 ON pt.tipo1_id = t1.id
                    LEFT JOIN tipos t2 ON pt.tipo2_id = t2.id
                    ORDER BY p.dex_entry";
                    $resultado = mysqli_query($conexion, $sql);
                    $datos = mysqli_fetch_all($resultado, MYSQLI_ASSOC);

                }

                foreach ($datos as $dato) {
                    echo "<tr onclick=\"window.location='./pokemon_detalle.php?dex_entry=" . $dato['dex_entry'] . "'\" style=\"cursor:pointer;\">";

                    echo "<td class='text-center align-middle'>" . $dato["dex_entry"] . "</td>";
                    echo "<td class='d-flex align-items-center justify-content-center'><img style='width:64px; height:64px;' class='img-fluid' src='./images/pokemon_icons/" . strtolower($dato["nombre"]) . ".png' alt='" . $dato["nombre"] . "' '></td>";
                    echo "<td class='text-center align-middle'>" . $dato["nombre"] . "</td>";

                    echo "<td><div class='flex-column justify-content-center gap-4'>";
                    echo "<img style='width: 100px; height: auto;'  class='mb-1 type-icon mx-auto d-block'  src='./images/type_icons/" . strtolower($dato["tipo1"]) . ".png' alt='" . $dato["tipo1"] . "'>";
                    echo "<img style='width: 100px; height: auto;' class='type-icon mx-auto d-block'  src='./images/type_icons/" . strtolower($dato["tipo2"]) . ".png' alt='" . $dato["tipo2"] . "'>";
                    echo "</div></td>";

                    echo "<td class='text-center align-middle'>" . $dato["ataque"] . "</td>";
                    echo "<td class='text-center align-middle'>" . $dato["defensa"] . "</td>";
                    echo "<td class='text-center align-middle'>" . $dato["ataque_esp"] . "</td>";
                    echo "<td class='text-center align-middle'>" . $dato["defensa_esp"] . "</td>";
                    echo "<td class='text-center align-middle'>" . $dato["velocidad"] . "</td>";
                    echo "</tr>";
                }


                mysqli_close($conexion);
                ?>

                </tbody>
            </table>
        </div>
    </div>
</main>
</body>
</html>



