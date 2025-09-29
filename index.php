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
        <h1 class="mb-4 text-center  h1 display-1 align-self-center"
            style="font-family: 'Eviolite B', sans-serif; color: #ffde00;  -webkit-text-stroke: 2px #3b4cca;">
            POKEDEX</h1>
        <form action="#" method="post" class="align-self-center">
            <div class="row">
                <div class="col">
                    <input type="text" class="form-control" placeholder="Usuario" name="email">
                </div>
                <div class="col">
                    <input type="password" class="form-control" placeholder="Password" name="pswd">
                </div>
                <div class="col">
                    <button type="submit" class="btn" style="background-color: #ffde00; font-weight: bold">Ingresar
                    </button>
                </div>
            </div>
        </form>
    </div>
</header>
<main>

    <form action="" method="GET" class="container pt-5">
        <div class="mb-2 d-flex justify-content-flex-start gap-3">
            Buscar por:
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="opcion-de-busqueda" id="inlineRadio1" value="id"
                       checked>
                <label class="form-check-label" for="inlineRadio1">Numero</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="opcion-de-busqueda" id="inlineRadio2" value="nombre">
                <label class="form-check-label" for="inlineRadio2">Nombre</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="opcion-de-busqueda" id="inlineRadio3" value="tipo">
                <label class="form-check-label" for="inlineRadio3">Tipo</label>
            </div>
        </div>

        <!-- Barra de búsqueda -->
        <div class="input-group mb-3">
            <input type="text" name="busqueda" class="form-control" placeholder="Ingrese los datos a buscar...">
            <button class="btn" type="submit" style="background-color: #ffde00; font-weight: bold">
                ¿Quién es ese Pokémon?
            </button>
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
                <?php
                require_once "./clases/MyDataBase.php";
                require_once "./clases/PokemonQueries.php";

                $queries = new PokemonQueries();
                $resultado = [];


                if ($_SERVER["REQUEST_METHOD"] == "GET") {
                    $busqueda = $_GET['busqueda'] ?? '';
                    $opcion = $_GET['opcion-de-busqueda'] ?? '';

                    if (trim($busqueda) === "") {
                        $resultado = $queries->obtenerListadoDePokemons();
                    } else {
                        switch ($opcion) {
                            case 'id':
                                $resultado = $queries->obtenerPokemonPorNumero($busqueda);
                                break;
                            case 'nombre':
                                $resultado = $queries->obtenerPokemonPorNombre($busqueda);
                                break;
                            case 'tipo':
                                $resultado = $queries->obtenerPokemonPorTipo($busqueda);
                                break;
                            default:
                                $resultado = [];
                                break;
                        }
                    }

                } else {
                    $resultado = $queries->obtenerListadoDePokemons();
                }

                foreach ($resultado as $dato) {
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



                ?>

                </tbody>
            </table>
        </div>
    </div>
</main>
</body>
</html>



