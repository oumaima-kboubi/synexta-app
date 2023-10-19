<?php

namespace App\Controller;

use App\Entity\UserList;
use App\Repository\CategoryRepository;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    #[Route('/product', name: 'app_product')]
    public function index(): Response
    {
        return $this->render('product/index.html.twig', [
            'controller_name' => 'ProductController',
        ]);
    }
     /**
      * Undocumented function
      *
      * @param ProductRepository $productRepository
      * @param CategoryRepository $categoryRepository
      * @return Response
      */
     #[Route('/product/all', name: 'product_show_all')]
     public function showAll(Request $request,ProductRepository $productRepository, CategoryRepository $categoryRepository): Response
     {
        $categoryId = $request->request->get('category'); // Change to categoryFilter
        $appliedFilter = $categoryRepository->findBy(['id'=> $categoryId]);

        if(!$appliedFilter){
            $products = $productRepository->findAll();
        }
        else if ($appliedFilter[0]->getName() == 'Books' || $appliedFilter[0]->getName() == 'Flowers' || $appliedFilter[0]->getName() == 'Food'){
            $products = $productRepository->findByCategory($categoryId);
        }
        else {
            $products = $productRepository->findAll();
        }
      
         $categories = $categoryRepository->findAll();
         $productCategories = [];
    
             $productCategories[] = [
                 'category' => $categories,
                 'products' => $products,
             ];
    
    if($appliedFilter == [] || !$appliedFilter){
        $appliedFilter  = 'All Categories';
    }else{
        $appliedFilter = $appliedFilter[0]->getName();
    }
    //dd($appliedFilter);
         return $this->render('app/products/common_products_list.html.twig', [
            'categories' => $categories,
            'products' => $products,
            'actualFilter'=>$appliedFilter,
         ]);
     }


    #[Route('/add_to_personal_list/{productId}', name: 'add_to_personal_list')]
    public function addToPersonalList(Request $request, int $productId,ProductRepository $productRepository,EntityManagerInterface $entityManager): RedirectResponse
    {
       
        $user = $this->getUser();

        // Fetch the user's personal list 
        $personalList = $user->getUserList();
       
        if (!$personalList) {
            $personalList = new UserList();
            $user->setUserList($personalList);
        }
        
        // Add the selected product to the personal list
        $product = $productRepository->findBy(['id'=>$productId]);
       
        if ($product) {
          //dd($product[0]);
            
            $personalList->addProduct($product[0]);
          
            // Persist and flush the changes (if using Doctrine ORM)
            $entityManager->persist($personalList);
            $entityManager->flush();
        }
    
        // Redirect to the product list page
        return $this->redirectToRoute('product_show_all');
    }


#[Route('/add_category_products_to_personal_list/{categoryId}', name: 'add_category_products_to_personal_list')]
public function addCategoryProductsToPersonalList(Request $request, int $categoryId, ProductRepository $productRepository, EntityManagerInterface $entityManager): RedirectResponse
{
    // Get the user (you should have user authentication in place)
    $user = $this->getUser();

    // Fetch the user's personal list (this depends on your application's data structure)
    $personalList = $user->getUserList();
    if (!$personalList) {
        $personalList = new UserList();
        $user->setUserList($personalList);
    }
    // Fetch products based on the selected category
    $products = $productRepository->findBy(['category' => $categoryId]);

    if ($personalList && $products) {
        foreach ($products as $product) {
            $personalList->addProduct($product);
        }

        // Persist and flush the changes (if using Doctrine ORM)
        $entityManager->persist($personalList);
        $entityManager->flush();
    }

    // Redirect back to the product list page with the updated personal list
    return $this->redirectToRoute('app_user_list');
}

}
