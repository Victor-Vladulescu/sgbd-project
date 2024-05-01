<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class MainController extends AbstractController
{
    #[Route('/')]
    public function homepage(): Response
    {
        $numbers = [1,2,3,4,5];

        return $this->render("main/overview.html.twig", [
            'numbers' => $numbers,
        ]);
    }
}