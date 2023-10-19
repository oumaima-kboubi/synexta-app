<?php

namespace App\Controller;

use App\Entity\UserList;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class UserListController extends AbstractController
{
    #[Route('/user', name: 'app_user')]
    public function index(): Response
    {
        return $this->render('user_list/index.html.twig', [
            'controller_name' => 'UserListController',
        ]);
    }

    #[Route('/user/list', name: 'app_user_list')]
    public function showUserList(): Response
    {
         // Get the currently logged-in user
         $user = $this->getUser();

         // Access the user's personal list (assuming it's a property in the User entity)
         $personalList = $user->getUserList();
           if (!$personalList) {
            $personalList = new UserList();
            $user->setUserList($personalList);
        }
         // Pass the personal list to the template
         return $this->render('app/products/user_list.html.twig', [
             'personalList' => $personalList,
         ]);
    
    }

    #[Route('/remove_from_personal_list/{productId}', name: 'remove_from_personal_list')]
    public function removeFromPersonalList(int $productId, EntityManagerInterface $entityManager): RedirectResponse    {
        // Get the currently logged-in user
        $user = $this->getUser();

        // Access the user's personal list (assuming it's a property in the User entity)
        $personalList = $user->getUserList();

        // Remove the selected product from the personal list
        foreach ($personalList->getProducts() as $product) {
            if ($product->getId() === $productId) {
                $personalList->removeProduct($product);
                break;
            }
        }

        // Persist and flush the changes (if using Doctrine ORM)
        $entityManager->flush();

        // Redirect back to the personal list page
        return $this->redirectToRoute('app_user_list');
    }
}
