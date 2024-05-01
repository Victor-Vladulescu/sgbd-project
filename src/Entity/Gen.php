<?php

namespace App\Entity;

use App\Repository\GenRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: GenRepository::class)]
class Gen
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nume = null;

    #[ORM\Column(length: 255)]
    private ?string $descriere = null;

    /**
     * @var Collection<int, Carte>
     */
    #[ORM\OneToMany(targetEntity: Carte::class, mappedBy: 'gen')]
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

    public function getDescriere(): ?string
    {
        return $this->descriere;
    }

    public function setDescriere(string $descriere): static
    {
        $this->descriere = $descriere;

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
            $carti->setGen($this);
        }

        return $this;
    }

    public function removeCarti(Carte $carti): static
    {
        if ($this->carti->removeElement($carti)) {
            // set the owning side to null (unless already changed)
            if ($carti->getGen() === $this) {
                $carti->setGen(null);
            }
        }

        return $this;
    }
}
