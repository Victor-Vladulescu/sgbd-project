<?php

namespace App\Controller;

use App\Repository\AutorRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class AutorController extends AbstractController
{
    public function __construct(private readonly AutorRepository $autorRepository)
    {
    }

    #[Route(path: '/autori', name: 'autori', methods: ['GET'])]
    public function autori(): Response
    {
        $autori = $this->autorRepository->findAll();

        return $this->render("autori/totiAutorii.html.twig", [
            'autori' => $autori,
        ]);
    }

    #[Route(path: '/autor/{id}', name: 'autor', methods: ['GET'])]
    public function autor(int $id): Response
    {
        $autor = $this->autorRepository->find($id);
        $carti = $autor->getCarti();

        if ($carti->isEmpty()) {
            $carti = null;
        }

        return $this->render("autori/autor.html.twig", [
            'autor' => $autor,
            'carti' => $carti,
        ]);
    }
}