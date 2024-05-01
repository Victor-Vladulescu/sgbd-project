<?php

namespace App\Entity;

use App\Repository\AutorRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AutorRepository::class)]
class Autor
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nume = null;

    #[ORM\Column(length: 255)]
    private ?string $prenume = null;

    #[ORM\Column(length: 255)]
    private ?string $origine = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $data_nasterii = null;

    /**
     * @var Collection<int, Carte>
     */
    #[ORM\OneToMany(targetEntity: Carte::class, mappedBy: 'autor')]
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

    public function getOrigine(): ?string
    {
        return $this->origine;
    }

    public function setOrigine(string $origine): static
    {
        $this->origine = $origine;

        return $this;
    }

    public function getDataNasterii(): ?\DateTimeInterface
    {
        return $this->data_nasterii;
    }

    public function setDataNasterii(\DateTimeInterface $data_nasterii): static
    {
        $this->data_nasterii = $data_nasterii;

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
            $carti->setAutor($this);
        }

        return $this;
    }

    public function removeCarti(Carte $carti): static
    {
        if ($this->carti->removeElement($carti)) {
            // set the owning side to null (unless already changed)
            if ($carti->getAutor() === $this) {
                $carti->setAutor(null);
            }
        }

        return $this;
    }
}
