<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240501140707 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE autor (id INT AUTO_INCREMENT NOT NULL, nume VARCHAR(255) NOT NULL, prenume VARCHAR(255) NOT NULL, origine VARCHAR(255) NOT NULL, data_nasterii DATE NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE carte (id INT AUTO_INCREMENT NOT NULL, gen_id INT NOT NULL, autor_id INT NOT NULL, titlu VARCHAR(255) NOT NULL, pagini INT NOT NULL, data_publicarii DATE NOT NULL, INDEX IDX_BAD4FFFDB718FA6E (gen_id), INDEX IDX_BAD4FFFD14D45BBE (autor_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE client (id INT AUTO_INCREMENT NOT NULL, nume VARCHAR(255) NOT NULL, prenume VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE client_carte (client_id INT NOT NULL, carte_id INT NOT NULL, INDEX IDX_19B9634A19EB6921 (client_id), INDEX IDX_19B9634AC9C7CEB6 (carte_id), PRIMARY KEY(client_id, carte_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gen (id INT AUTO_INCREMENT NOT NULL, nume VARCHAR(255) NOT NULL, descriere VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', available_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', delivered_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE carte ADD CONSTRAINT FK_BAD4FFFDB718FA6E FOREIGN KEY (gen_id) REFERENCES gen (id)');
        $this->addSql('ALTER TABLE carte ADD CONSTRAINT FK_BAD4FFFD14D45BBE FOREIGN KEY (autor_id) REFERENCES autor (id)');
        $this->addSql('ALTER TABLE client_carte ADD CONSTRAINT FK_19B9634A19EB6921 FOREIGN KEY (client_id) REFERENCES client (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE client_carte ADD CONSTRAINT FK_19B9634AC9C7CEB6 FOREIGN KEY (carte_id) REFERENCES carte (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE carte DROP FOREIGN KEY FK_BAD4FFFDB718FA6E');
        $this->addSql('ALTER TABLE carte DROP FOREIGN KEY FK_BAD4FFFD14D45BBE');
        $this->addSql('ALTER TABLE client_carte DROP FOREIGN KEY FK_19B9634A19EB6921');
        $this->addSql('ALTER TABLE client_carte DROP FOREIGN KEY FK_19B9634AC9C7CEB6');
        $this->addSql('DROP TABLE autor');
        $this->addSql('DROP TABLE carte');
        $this->addSql('DROP TABLE client');
        $this->addSql('DROP TABLE client_carte');
        $this->addSql('DROP TABLE gen');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
