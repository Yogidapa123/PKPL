<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Building;

class RoomFactory extends Factory
{
    public function definition()
    {
        return [
            'code' => strtoupper($this->faker->bothify('R###')),
            'name' => 'Ruangan ' . $this->faker->randomDigit(),
            'floor' => 1,
            'capacity' => 10,
            'building_id' => Building::factory(),
            'type' => 'Kelas',
            'description' => 'Ruangan untuk perkuliahan.',
            'img' => null,
        ];
    }
}
