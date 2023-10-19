<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use App\Entity\Category;

class CategoryFixture extends Fixture
{
    public function load(ObjectManager $manager)
    {
        $categories = ["Books", "Flowers", "Food"];

        foreach ($categories as $name) {
            $category = new Category();
            $category->setName($name);
            $manager->persist($category);
            $this->addReference($name, $category); // Add a reference for later use
        }

        $manager->flush();
    }
}
