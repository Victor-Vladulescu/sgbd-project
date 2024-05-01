<?php

namespace App\Controller;

use App\Repository\GenRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class GenController extends AbstractController
{
    public function __construct(private readonly GenRepository $genRepository)
    {
    }

    #[Route(path: '/genuri', name: 'genuri', methods: ['GET'])]
    public function genuri(): Response
    {
        $genuri = $this->genRepository->findAll();

        return $this->render("genuri/toateGenurile.html.twig", [
            'genuri' => $genuri,
        ]);
    }

    #[Route(path: '/gen/{id}', name: 'gen', methods: ['GET'])]
    public function gen(int $id): Response
    {
        $gen = $this->genRepository->find($id);
        $carti = $gen->getCarti();

        if ($carti->isEmpty()) {
            $carti = null;
        }

        return $this->render("genuri/gen.html.twig", [
            'gen' => $gen,
            'carti' => $carti,
        ]);
    }
}