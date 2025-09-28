<?php
class TypeEffectiveness {
    private array $chart = [
        'Normal' => [
            'Roca' => 0.5, 'Fantasma' => 0, 'Acero' => 0.5
        ],
        'Fuego' => [
            'Fuego' => 0.5, 'Agua' => 0.5, 'Planta' => 2, 'Hielo' => 2,
            'Bicho' => 2, 'Roca' => 0.5, 'Dragon' => 0.5, 'Acero' => 2
        ],
        'Agua' => [
            'Fuego' => 2, 'Agua' => 0.5, 'Planta' => 0.5, 'Tierra' => 2,
            'Roca' => 2, 'Dragon' => 0.5
        ],
        'Planta' => [
            'Fuego' => 0.5, 'Agua' => 2, 'Planta' => 0.5, 'Veneno' => 0.5,
            'Tierra' => 2, 'Volador' => 0.5, 'Bicho' => 0.5, 'Roca' => 2,
            'Dragon' => 0.5, 'Acero' => 0.5
        ],
        'Electrico' => [
            'Agua' => 2, 'Planta' => 0.5, 'Electrico' => 0.5, 'Tierra' => 0,
            'Volador' => 2, 'Dragon' => 0.5
        ],
        'Hielo' => [
            'Agua' => 0.5, 'Planta' => 2, 'Fuego' => 0.5, 'Tierra' => 2,
            'Volador' => 2, 'Dragon' => 2, 'Acero' => 0.5
        ],
        'Lucha' => [
            'Normal' => 2, 'Hielo' => 2, 'Roca' => 2, 'Siniestro' => 2,
            'Acero' => 2, 'Veneno' => 0.5, 'Volador' => 0.5, 'Psiquico' => 0.5,
            'Bicho' => 0.5, 'Fantasma' => 0, 'Hada' => 0.5
        ],
        'Veneno' => [
            'Planta' => 2, 'Hada' => 2, 'Veneno' => 0.5, 'Tierra' => 0.5,
            'Roca' => 0.5, 'Fantasma' => 0.5, 'Acero' => 0
        ],
        'Tierra' => [
            'Fuego' => 2, 'Electrico' => 2, 'Planta' => 0.5, 'Veneno' => 2,
            'Volador' => 0, 'Roca' => 2, 'Acero' => 2, 'Bicho' => 0.5
        ],
        'Volador' => [
            'Planta' => 2, 'Lucha' => 2, 'Bicho' => 2, 'Electrico' => 0.5,
            'Roca' => 0.5, 'Acero' => 0.5
        ],
        'Psiquico' => [
            'Lucha' => 2, 'Veneno' => 2, 'Psiquico' => 0.5, 'Acero' => 0.5,
            'Siniestro' => 0
        ],
        'Bicho' => [
            'Planta' => 2, 'Psiquico' => 2, 'Siniestro' => 2, 'Fuego' => 0.5,
            'Lucha' => 0.5, 'Volador' => 0.5, 'Fantasma' => 0.5, 'Acero' => 0.5,
            'Hada' => 0.5
        ],
        'Roca' => [
            'Fuego' => 2, 'Hielo' => 2, 'Volador' => 2, 'Bicho' => 2,
            'Lucha' => 0.5, 'Tierra' => 0.5, 'Acero' => 0.5
        ],
        'Fantasma' => [
            'Psiquico' => 2, 'Fantasma' => 2, 'Siniestro' => 0.5, 'Normal' => 0
        ],
        'Dragon' => [
            'Dragon' => 2, 'Acero' => 0.5, 'Hada' => 0
        ],
        'Siniestro' => [
            'Psiquico' => 2, 'Fantasma' => 2, 'Lucha' => 0.5, 'Siniestro' => 0.5,
            'Hada' => 0.5
        ],
        'Acero' => [
            'Hielo' => 2, 'Roca' => 2, 'Hada' => 2, 'Agua' => 0.5, 'Fuego' => 0.5,
            'Electrico' => 0.5, 'Acero' => 0.5
        ],
        'Hada' => [
            'Lucha' => 2, 'Dragon' => 2, 'Siniestro' => 2, 'Fuego' => 0.5,
            'Veneno' => 0.5, 'Acero' => 0.5
        ]
    ];



    public function debilidadesYVentajas(array $tiposDefensor): array {
        $debilidades = [];
        $ventajas = [];

        foreach ($this->chart as $tipoAtacante => $efectos) {
            $mult = 1.0;

            // multiplicamos el modificador de cada tipo defensor
            foreach ($tiposDefensor as $tipoDefensor) {
                $mult *= $efectos[$tipoDefensor] ?? 1.0;
            }

            if ($mult > 1) {
                $debilidades[] = $tipoAtacante;
            } elseif ($mult < 1) {
                $ventajas[] = $tipoAtacante;
            }
        }

        return [
            'debilidades' => $debilidades,
            'ventajas'    => $ventajas
        ];
    }


}