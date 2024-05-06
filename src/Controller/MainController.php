<?php

namespace App\Controller;

use App\Repository\CarteRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class MainController extends AbstractController
{
    #[Route(path: '/', name: 'homepage', methods: ['GET'])]
    public function homepage(CarteRepository $carteRepository): Response
    {
        $carti = $carteRepository->findAll();

        return $this->render("carti/toateCartile.html.twig", [
            'carti' => $carti,
        ]);
    }
}