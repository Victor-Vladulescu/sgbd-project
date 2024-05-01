<?php

namespace App\Entity;

use App\Repository\CarteRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CarteRepository::class)]
class Carte
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $titlu = null;

    #[ORM\ManyToOne(inversedBy: 'carti')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Gen $gen = null;

    #[ORM\ManyToOne(inversedBy: 'carti')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Autor $autor = null;

    #[ORM\Column]
    private ?int $pagini = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $data_publicarii = null;

    /**
     * @var Collection<int, Client>
     */
    #[ORM\ManyToMany(targetEntity: Client::class, mappedBy: 'carti')]
    private Collection $clienti;

    public function __construct()
    {
        $this->clienti = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(string $id): static
    {
        $this->id = $id;

        return $this;
    }

    public function getTitlu(): ?string
    {
        return $this->titlu;
    }

    public function setTitlu(string $titlu): static
    {
        $this->titlu = $titlu;

        return $this;
    }

    public function getGen(): ?Gen
    {
        return $this->gen;
    }

    public function setGen(?Gen $gen): static
    {
        $this->gen = $gen;

        return $this;
    }

    public function getAutor(): ?Autor
    {
        return $this->autor;
    }

    public function setAutor(?Autor $autor): static
    {
        $this->autor = $autor;

        return $this;
    }

    public function getPagini(): ?int
    {
        return $this->pagini;
    }

    public function setPagini(int $pagini): static
    {
        $this->pagini = $pagini;

        return $this;
    }

    public function getDataPublicarii(): ?\DateTimeInterface
    {
        return $this->data_publicarii;
    }

    public function setDataPublicarii(\DateTimeInterface $data_publicarii): static
    {
        $this->data_publicarii = $data_publicarii;

        return $this;
    }

    /**
     * @return Collection<int, Client>
     */
    public function getClienti(): Collection
    {
        return $this->clienti;
    }

    public function addClienti(Client $clienti): static
    {
        if (!$this->clienti->contains($clienti)) {
            $this->clienti->add($clienti);
            $clienti->addCarti($this);
        }

        return $this;
    }

    public function removeClienti(Client $clienti): static
    {
        if ($this->clienti->removeElement($clienti)) {
            $clienti->removeCarti($this);
        }

        return $this;
    }
}
