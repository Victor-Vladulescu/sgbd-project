<?php

namespace App\Controller;

use App\Repository\CarteRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class CarteController extends AbstractController
{
    public function __construct(private readonly CarteRepository $carteRepository)
    {
    }

    #[Route(path: '/carti', name: 'carti', methods: ['GET'])]
    public function carti(): Response
    {
        $carti = $this->carteRepository->findAll();

        return $this->render("carti/toateCartile.html.twig", [
            'carti' => $carti,
        ]);
    }

    #[Route(path: '/carte/{id}', name: 'carte', methods: ['GET'])]
    public function carte(int $id): Response
    {
        $carte = $this->carteRepository->find($id);
        $clienti = $carte->getClienti();

        return $this->render("carti/carte.html.twig", [
            'carte' => $carte,
            'clienti' => $clienti,
        ]);
    }
}