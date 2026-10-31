<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class FacultyFactory extends Factory
{
    public function definition()
    {
        return [
            'code' => strtoupper($this->faker->unique()->lexify('F??')),
            'name' => 'Fakultas ' . $this->faker->word(),
        ];
    }
}
