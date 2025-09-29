<?php
require_once "./clases/PokemonQueries.php";
require_once "./clases/TypeEffectiveness.php";

$queries = new PokemonQueries();
$tablaDeTipos = new TypeEffectiveness();

$dex_entry = $_GET['dex_entry'];
$pokemon = $queries->mostrarDetallePokemon($dex_entry); ;
$evoluciones = $queries->mostrarEvoluciones($dex_entry);
$nro_dex = str_pad($pokemon['dex_entry'], 4, "0", STR_PAD_LEFT);
$imagen = glob("./images/pokemon_artwork/{$nro_dex} *.png");
$ruta_imagen = $imagen ? $imagen[0] : "./images/default.png";

$ventajasYDebilidades = $tablaDeTipos->debilidadesYVentajas([$pokemon['tipo1'], $pokemon['tipo2']]);


function getStatGradient($valor)
{
    $porcentaje = ($valor / 255) * 100;

    if ($porcentaje < 20) {
        return "linear-gradient(to right, #8b0000, #ff0000)"; // rojo
    } elseif ($porcentaje < 35) {
        return "linear-gradient(to right, #ffcc00, #ffff00)"; // amarillo
    } elseif ($porcentaje < 65) {
        return "linear-gradient(to right, #66bb6a, #43a047)"; // verde medio
    } else {
        return "linear-gradient(to right, #00c853, #64dd17)"; // verde brillante
    }
}

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?= $pokemon['nombre'] ?> | Pokedex</title>
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
        <form action="" method="post" class="align-self-center">
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

    <div class="container mt-3">
        <div class="row">
            <img src="<?= $ruta_imagen ?>" class="col-md-5 align-self-center col" alt="<?= $pokemon['nombre'] ?>">
            <div class="card col" style="background-color: #f1f1eb">
                <div class="card-body">
                    <h1 class="card-title"><?= $pokemon['nombre'] ?> <span
                                class='text-secondary opacity-75'>N.° <?= $nro_dex ?></span></h1>
                    <h3 class="card-subtitle mb-1 text-muted">Pokémon <?= $pokemon['categoria'] ?> </h3>
                    <p class="card-text"><?= $pokemon['dex_descripcion'] ?></p>
                    <h3 class="card-subtitle mb-1 text-muted"><span
                                class="strong">Habilidad: </span><?= $pokemon['habilidad_nombre'] ?></h3>
                    <p class="card-text"><?= $pokemon['habilidad_descripcion'] ?></p>
                    <h3 class="card-subtitle mb-1 text-muted">Tipo</h3>
                    <div class="d-flex justify-content-start gap-2 mb-2">
                        <img src="./images/type_icons/<?= $pokemon['tipo1'] ?>.png" alt="<?= $pokemon['tipo1'] ?>"
                             style="width: 128px; height: auto;">
                        <?php
                        if (isset($pokemon['tipo2'])) {
                            echo "<img style='width: 128px; height: auto;' src='./images/type_icons/" . $pokemon['tipo2'] . ".png' alt='" . $pokemon['tipo2'] . "'>";
                        }
                        ?>
                    </div>

                    <div style="width: 75%">
                        <div class="mb-2">
                            <label class="form-label text-dark">PS</label>
                            <div class="progress" style="height: 20px">
                                <div class="progress-bar"
                                     style="width: <?= round(($pokemon['hp'] / 255) * 100) ?>%;
                                             background: <?= getStatGradient($pokemon['hp']) ?>;"

                                     role="progressbar"
                                     aria-valuenow="<?= $pokemon['hp'] ?>"
                                     aria-valuemin="0"
                                     aria-valuemax="255">
                                    <?= $pokemon['hp'] ?>
                                </div>
                            </div>
                        </div>

                        <div class="mb-2">
                            <label class="form-label text-dark">Ataque</label>
                            <div class="progress" style="height: 20px">
                                <div class="progress-bar"
                                     style="width: <?= round(($pokemon['ataque'] / 255) * 100) ?>%;
                                             background: <?= getStatGradient($pokemon['ataque']) ?>;"
                                     role="progressbar"
                                     aria-valuenow="<?= $pokemon['ataque'] ?>"
                                     aria-valuemin="0"
                                     aria-valuemax="255">
                                    <?= $pokemon['ataque'] ?>
                                </div>
                            </div>
                        </div>

                        <div class="mb-2">
                            <label class="form-label text-dark">Defensa</label>
                            <div class="progress" style="height: 20px">
                                <div class="progress-bar"
                                     style="width: <?= round(($pokemon['defensa'] / 255) * 100) ?>%;
                                             background: <?= getStatGradient($pokemon['defensa']) ?>;"
                                     role="progressbar"
                                     aria-valuenow="<?= $pokemon['defensa'] ?>"
                                     aria-valuemin="0"
                                     aria-valuemax="255">
                                    <?= $pokemon['defensa'] ?>
                                </div>
                            </div>
                        </div>

                        <div class="mb-2">
                            <label class="form-label text-dark">Ataque Especial</label>
                            <div class="progress" style="height: 20px">
                                <div class="progress-bar"
                                     style="width: <?= round(($pokemon['ataque_esp'] / 255) * 100) ?>%;
                                             background: <?= getStatGradient($pokemon['ataque_esp']) ?>;"
                                     role="progressbar"
                                     aria-valuenow="<?= $pokemon['ataque_esp'] ?>"
                                     aria-valuemin="0"
                                     aria-valuemax="255">
                                    <?= $pokemon['ataque_esp'] ?>
                                </div>
                            </div>
                        </div>

                        <div class="mb-2">
                            <label class="form-label text-dark">Defensa Especial</label>
                            <div class="progress" style="height: 20px">
                                <div class="progress-bar"
                                     style="width: <?= round(($pokemon['defensa_esp'] / 255) * 100) ?>%;
                                             background: <?= getStatGradient($pokemon['defensa_esp']) ?>;"
                                     role="progressbar"
                                     aria-valuenow="<?= $pokemon['defensa_esp'] ?>"
                                     aria-valuemin="0"
                                     aria-valuemax="255">
                                    <?= $pokemon['defensa_esp'] ?>
                                </div>
                            </div>
                        </div>

                        <div class="mb-2">
                            <label class="form-label text-dark">Velocidad</label>
                            <div class="progress" style="height: 20px">
                                <div class="progress-bar"
                                     style="width: <?= round(($pokemon['velocidad'] / 255) * 100) ?>%;
                                             background: <?= getStatGradient($pokemon['velocidad']) ?>;"
                                     role="progressbar"
                                     aria-valuenow="<?= $pokemon['velocidad'] ?>"
                                     aria-valuemin="0"
                                     aria-valuemax="255">
                                    <?= $pokemon['velocidad'] ?>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="container mt-2">
        <div class="row gap-3">
            <div class="container col mt-2 mb-4 card">
                <div class="row card-body" style="background-color: #f1f1eb">
                    <h3 class="card-title mb-3">Resistencias y Debilidades</h3>
                    <h4 class="card-subtitle mb-2 text-muted">Resistencias</h4>
                    <div class="d-flex flex-wrap justify-content-start gap-2 mb-3">
                        <?php
                        foreach ($ventajasYDebilidades['ventajas'] as $tipo) {
                            echo "<img style='width: 128px; height: 25px;' src='./images/type_icons/" . $tipo . ".png' alt='" . $tipo . "'>";
                        }
                        ?>
                    </div>
                    <h4 class="card-subtitle mb-2 text-muted">Debilidades</h4>
                    <div class="d-flex flex-wrap justify-content-start gap-2 mb-2">
                        <?php
                        foreach ($ventajasYDebilidades['debilidades'] as $tipo) {
                            echo "<img style='width: 128px; height: 25px;' src='./images/type_icons/" . $tipo . ".png' alt='" . $tipo . "'>";
                        }
                        ?>
                    </div>
                </div>
            </div>
            <div class="container mt-2 mb-4 card col">
                <div class="row card-body" style="background-color: #f1f1eb">
                    <h3 class="card-title">Evolucion</h3>
                    <div class="col">
                        <?php
                        $cadena = $evoluciones[0];



                        if (!empty($cadena['etapa1']) && empty($cadena['etapa2']) && empty($cadena['etapa3'])) {
                            echo "<div class='evolucion'>";
                            echo "<div class='pokemon text-center'>";
                            echo "<a href='./pokemon_detalle.php?dex_entry=" . $queries->buscarDetallePorNombre($cadena['etapa1']) . "'>";
                            echo "<img src='./images/sprites_3d/" . $cadena['etapa1'] . ".gif' alt='" . $cadena['etapa1'] . "' class='sprite mb-3' style='cursor:pointer;'>";
                            echo "</a>";
                            echo "<p class='text-dark no-evoluciona mt-3'>" . $cadena['etapa1'] . " no evoluciona ni es la evolución de ningún Pokémon.</p>";
                            echo "</div>";

                            echo "</div>";
                        } elseif (count($evoluciones) > 1) {
                            foreach ($evoluciones as $rama) {
                                echo "<div class='evolucion text-center evolucion-item'>";
                                // Etapa 1
                                echo "<a href='./pokemon_detalle.php?dex_entry=" . $queries->buscarDetallePorNombre($rama['etapa1']) . "'>";
                                echo "<img src='./images/sprites_3d/" . $rama['etapa1'] . ".gif' alt='" . $rama['etapa1'] . "' class='sprite mb-3' style='cursor:pointer;'>";
                                echo "<p style='color: blue; font-size: 12px'>" . $rama['etapa1'] . "</p>";
                                echo "</a>";
                                // Conector + método
                                echo "<div class='conector'>";
                                echo "<span class='flecha text-center'>→</span>";
                                echo "<span class='metodo'>" . $rama['metodo1'] . "</span>";
                                echo "</div>";

                                // Etapa 2
                                echo "<a href='./pokemon_detalle.php?dex_entry=" . $queries->buscarDetallePorNombre($rama['etapa2']) . "'>";
                                echo "<img src='./images/sprites_3d/" . $rama['etapa2'] . ".gif' alt='" . $rama['etapa2'] . "' class='sprite mb-3' style='cursor:pointer;'>";
                                echo "<p style='color: blue; font-size: 12px'>" . $rama['etapa2'] . "</p>";
                                echo "</a>";
                                echo "</div>";
                            }
                        } else {
                            // Caso: cadena lineal (1 → 2 → 3)
                            echo "<div class='evolucion text-center'>";
                            // Etapa 1
                            echo "<a href='./pokemon_detalle.php?dex_entry=" . $queries->buscarDetallePorNombre($cadena['etapa1']) . "'>";
                            echo "<img src='./images/sprites_3d/" . $cadena['etapa1'] . ".gif' alt='" . $cadena['etapa1'] . "' class='sprite mb-3' style='cursor:pointer;'>";
                            echo "<p style='color: blue; font-size: 12px'>" . $cadena['etapa1'] . "</p>";
                            echo "</a>";

                            // Etapa 2
                            if (!empty($cadena['etapa2'])) {
                                echo "<div class='conector'>";
                                echo "<span class='flecha text-center'>→</span>";
                                echo "<span class='metodo'>" . $cadena['metodo1'] . "</span>";
                                echo "</div>";

                                echo "<a href='./pokemon_detalle.php?dex_entry=" . $queries->buscarDetallePorNombre($cadena['etapa2']) . "'>";
                                echo "<img src='./images/sprites_3d/" . $cadena['etapa2'] . ".gif' alt='" . $cadena['etapa2'] . "' class='sprite mb-3' style='cursor:pointer;'>";
                                echo "<p class='mt-3' style='color: blue; font-size: 12px'>" . $cadena['etapa2'] . "</p>";
                                echo "</a>";
                            }

                            // Etapa 3
                            if (!empty($cadena['etapa3'])) {
                                echo "<div class='conector'>";
                                echo "<span class='flecha text-center'>→</span>";
                                echo "<span class='metodo'>" . $cadena['metodo2'] . "</span>";
                                echo "</div>";

                                echo "<a href='./pokemon_detalle.php?dex_entry=" . $queries->buscarDetallePorNombre($cadena['etapa3']) . "'>";
                                echo "<img src='./images/sprites_3d/" . $cadena['etapa3'] . ".gif' alt='" . $cadena['etapa3'] . "' class='sprite mb-3' style='cursor:pointer;'>";
                                echo "<p class='mt-3' style='color: blue; font-size: 12px'>" . $cadena['etapa3'] . "</p>";
                                echo "</a>";
                            }

                            echo "</div>";
                        }


                        ?>


                    </div>
                </div>
            </div>
        </div>
    </div>




</main>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Selecciona todas las barras con la clase stat-bar
        document.querySelectorAll(".progress-bar").forEach(bar => {
            const value = parseInt(bar.getAttribute("aria-valuenow")); // valor real del stat
            const percent = Math.round((value / 255) * 100);           // porcentaje sobre 255

            // Arranca vacía
            bar.style.width = "0%";
            bar.textContent = value;

            // Pequeño delay para que se note la animación
            setTimeout(() => {
                bar.style.transition = "width 1s ease-out";
                bar.style.width = percent + "%";
            }, 100);
        });
    });
</script>

</body>
</html>