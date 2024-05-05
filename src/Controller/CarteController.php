<?php

namespace App\Controller;

use App\Entity\Carte;
use App\Repository\AutorRepository;
use App\Repository\CarteRepository;
use App\Repository\GenRepository;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Exception;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class CarteController extends AbstractController
{
    public function __construct(
        private readonly CarteRepository $carteRepository,
        private readonly AutorRepository $autorRepository,
        private readonly GenRepository $genRepository
    )
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

        if ($clienti->isEmpty()) {
            $clienti = null;
        }

        return $this->render("carti/carte.html.twig", [
            'carte' => $carte,
            'clienti' => $clienti,
        ]);
    }

    #[Route(path: '/api/carte/{id}', name: 'editBook', methods: ['PUT'])]
    public function editBook(int $id, Request $request, EntityManagerInterface $em): Response
    {
        // extract body from request
        $params = json_decode($request->getContent(), true);

        $autor = null;
        $autorID = -1;
        $gen = null;
        $genID = -1;
        $titlu = '';
        $pagini = -1;
        $data_publicarii = new DateTime('now');

        // request body validation
        try {
            $autorID = (int) $params['autor'];
            $genID = (int) $params['gen'];
            $titlu = $params['titlu'];
            $pagini = (int) $params['pagini'];
            $data_publicarii = new DateTime($params['data_publicarii']);
        }
        catch (Exception $e) {
            return new Response("Request body validation failed\n".$e, status: 400);
        }

        // does this book even exist?
        $carte = $em->getRepository(Carte::class)->find($id);
        if (!$carte) {
            return new Response("Book [".$id."] not found", status: 404);
        }

        // is the author real?
        $autor = $this->autorRepository->find($autorID);
        if (!$autor) {
            return new Response("Author [".$autorID."] not found, can't edit book", status: 400);
        }

        // is the genre real?
        $gen = $this->genRepository->find($genID);
        if (!$gen) {
            return new Response("Genre [".$genID."] not found, can't edit book", status: 400);
        }

        // change book values and save
        $carte->setTitlu($titlu);
        $carte->setAutor($autor);
        $carte->setGen($gen);
        $carte->setPagini($pagini);
        $carte->setDataPublicarii($data_publicarii);
        $em->flush();

        return new Response(status: 200);
    }
}