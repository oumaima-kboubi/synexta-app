<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\EditUserFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

class UserController extends AbstractController
{

    
    #[Route('/user', name: 'app_user')]
    public function index(): Response
    {
        return $this->render('user/index.html.twig', [
            'controller_name' => 'UserController',
        ]);
    }

    /**
     * 
     * 
     */
     
    #[Route('/editUser', name: 'app_edit_user')]
    public function editUser(Request $request,EntityManagerInterface $entityManager){
        $user = new User();
        $form = $this->createForm(EditUserFormType::class, $user);
        $form->handleRequest($request);


        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password
            $user= $this->getUser();
            $email =  $request->getSession()->get(Security::LAST_USERNAME);
            $lastname = $form->get('lastname')->getData();
            $firstname =  $form->get('firstname')->getData();
            $user = $entityManager->getRepository(User::class)->findOneBy(['email'=>$email]);
           //dd($user);
            $user->setFirstname($firstname);
            $user->setLastname($lastname);
            $entityManager->persist($user);
            $entityManager->flush();

            return $this->redirectToRoute('app_homepage');

        }

        return $this->render('edit_user/edit_user.html.twig', [
            'edit_user_form' => $form->createView(),
        ]);
    }
}
