<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Model;
use Faker\Generator as Faker;

$factory->define(Model::class, function (Faker $faker) {
    return [
        'name' => $this->faker->name(),
        'parent_id' => $this->faker->id(),
        'slug' => $this->faker->slug(),

    ];
});
