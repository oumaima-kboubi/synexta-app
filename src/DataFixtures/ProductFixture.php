<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use App\Entity\Product;
use Faker\Factory;
use Faker\Provider\en_US\Text;
use App\DataFixtures\SongProvider;


class ProductFixture extends Fixture
{
    protected static $bookTitles = [
        'To Kill a Mockingbird',
        '1984',
        'The Great Gatsby',
        'Pride and Prejudice',
        'The Catcher in the Rye',
        // Add more book titles here
    ];

    protected static $flowerNames = [
        'Rose',
        'Tulip',
        'Sunflower',
        'Daisy',
        'Lily',
        // Add more flower names here
    ];

    protected static $foodNames = [
        'Pizza',
        'Burger',
        'Sushi',
        'Spaghetti',
        'Ice Cream',
        // Add more food names here
    ];

    private function getRandomBookName()
    {
        $randomIndex = array_rand(self::$bookTitles);
        return self::$bookTitles[$randomIndex];
    }
    private function getRandomFoodName()
    {
        $randomIndex = array_rand(self::$foodNames);
        return self::$foodNames[$randomIndex];
    }
    private function getRandomFlowerName()
    {
        $randomIndex = array_rand(self::$flowerNames);
        return self::$flowerNames[$randomIndex];
    }
    public function load(ObjectManager $manager)
    {
        // Get the references to the categories created in CategoryFixture
        $booksCategory = $this->getReference("Books");
        $flowersCategory = $this->getReference("Flowers");
        $foodCategory = $this->getReference("Food");
        // $textfaker = Factory::create();
        // $textfaker->addProvider(new Text($textfaker));


        // Create and associate products with their respective categories
        for ($i = 1; $i <= 5; $i++) {
            $foodProduct = new Product();
            $foodProduct->setCategory($foodCategory);
            $foodProduct->setName($this->getRandomFoodName());
            $manager->persist($foodProduct); // Example: "Pizza"

            $booksProduct = new Product();
            $booksProduct->setCategory($booksCategory);
            $booksProduct->setName($this->getRandomBookName());
            $manager->persist($booksProduct); // Example: "Harry Potter and the goblet of fire"

            $flowersProduct = new Product();
            $flowersProduct->setCategory($flowersCategory);
            $flowersProduct->setName($this->getRandomFlowerName());
            $manager->persist($flowersProduct); // Example: "Tulip"          
        }
        $manager->flush();
    }
}
