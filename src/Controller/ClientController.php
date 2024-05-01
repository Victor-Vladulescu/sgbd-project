<?php

namespace App\Controller;

use App\Repository\ClientRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class ClientController extends AbstractController
{
    public function __construct(private readonly ClientRepository $clientRepository)
    {
    }

    #[Route(path: '/clienti', name: 'clienti', methods: ['GET'])]
    public function clienti(): Response
    {
        $clienti = $this->clientRepository->findAll();

        return $this->render("clienti/totiClientii.html.twig", [
            'clienti' => $clienti,
        ]);
    }

    #[Route(path: '/client/{id}', name: 'client', methods: ['GET'])]
    public function client(int $id): Response
    {
        $client = $this->clientRepository->find($id);
        $carti = $client->getCarti();

        if ($carti->isEmpty()) {
            $carti = null;
        }

        return $this->render("clienti/client.html.twig", [
            'client' => $client,
            'carti' => $carti,
        ]);
    }
}