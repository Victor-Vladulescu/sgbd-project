<?php

namespace App\Entity;

use App\Repository\ClientRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ClientRepository::class)]
class Client
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nume = null;

    #[ORM\Column(length: 255)]
    private ?string $prenume = null;

    /**
     * @var Collection<int, Carte>
     */
    #[ORM\ManyToMany(targetEntity: Carte::class, inversedBy: 'clienti')]
    private Collection $carti;

    public function __construct()
    {
        $this->carti = new ArrayCollection();
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

    public function getNume(): ?string
    {
        return $this->nume;
    }

    public function setNume(string $nume): static
    {
        $this->nume = $nume;

        return $this;
    }

    public function getPrenume(): ?string
    {
        return $this->prenume;
    }

    public function setPrenume(string $prenume): static
    {
        $this->prenume = $prenume;

        return $this;
    }

    /**
     * @return Collection<int, Carte>
     */
    public function getCarti(): Collection
    {
        return $this->carti;
    }

    public function addCarti(Carte $carti): static
    {
        if (!$this->carti->contains($carti)) {
            $this->carti->add($carti);
        }

        return $this;
    }

    public function removeCarti(Carte $carti): static
    {
        $this->carti->removeElement($carti);

        return $this;
    }
}
