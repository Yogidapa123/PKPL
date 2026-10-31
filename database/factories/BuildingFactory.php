<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class BuildingFactory extends Factory
{
    public function definition()
    {
        return [
            'code' => strtoupper($this->faker->bothify('G##')), // contoh: G12, G88
            'name' => 'Gedung ' . strtoupper($this->faker->randomLetter()), // contoh: Gedung A
            'faculty_id' => 1, // sementara fix agar test tidak error
        ];
    }
}
