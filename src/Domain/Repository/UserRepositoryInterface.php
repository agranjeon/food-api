<?php

declare(strict_types=1);

namespace App\Domain\Repository;

use App\Domain\Entity\User;

interface UserRepositoryInterface
{
    public function createUser(string $email, string $password): User;

    public function save(User $user): void;

    public function getByEmail(string $email): User;
}
