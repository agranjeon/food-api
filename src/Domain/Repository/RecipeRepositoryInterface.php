<?php


declare(strict_types=1);

namespace App\Domain\Repository;

use App\Domain\Entity\Recipe;
use App\Domain\Exception\RecipeNotFoundException;
use Ramsey\Uuid\UuidInterface;

Interface RecipeRepositoryInterface
{
    public function createDraft(string $name, int $portion, int $duration, int $complexity): Recipe;

    public function getAllNoneDraft(): array;

    public function save(Recipe $recipe): void;

    /** @throws RecipeNotFoundException */
    public function getPublishedRecipeById(UuidInterface $id): Recipe;
}
