<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AppController extends AbstractController
{
    #[Route('/homepage', name: 'app_homepage')]
    public function index(): Response
    {
        if($this->getUser()->isVerified()){
            return $this->render('app/index.html.twig', [
                'user' => $this->getUser(),
            ]);
        }else{
            return $this->render('app/check_email_verified.html.twig');
        }
       
    }

   
}
