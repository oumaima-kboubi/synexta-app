<?php
namespace App\Tests\Controller;

use Symfony\Component\Panther\PantherTestCase;

class ProductControllerTest extends PantherTestCase
{
    public function testAddToPersonalList()
    {
        $client = self::createPantherClient();
        $crawler = $client->request('GET', '/add_to_personal_list/34'); // Replace 1 with a valid product ID

        // Check for successful redirection
        $this->assertResponseIsSuccessful();
        $this->assertStringContainsString('/product/all', $client->getResponse()->getTargetUrl());

        // Simulate authentication (you can customize this part to fit your authentication method)
        $client->loginUserByUsername('ouma@ouma.com', 'oumaima123456789'); 

        // Execute the action after authenticating
        $crawler = $client->request('GET', '/add_to_personal_list/33'); 

        // Check for successful redirection after adding to the personal list
        $this->assertResponseIsSuccessful();
        $this->assertStringContainsString('/product/all', $client->getResponse()->getTargetUrl());
    }
}
