<?php

namespace App\Controller;

use App\Repository\AutorRepository;
use App\Repository\CarteRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class MainController extends AbstractController
{
    #[Route('/')]
    public function homepage(CarteRepository $carteRepository): Response
    {
        $carti = $carteRepository->findAll();

        return $this->render("main/carti.html.twig", [
            'carti' => $carti,
        ]);
    }
}