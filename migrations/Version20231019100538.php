<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20231019100538 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE user_list (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, UNIQUE INDEX UNIQ_3E49B4D1A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_list_product (user_list_id INT NOT NULL, product_id INT NOT NULL, INDEX IDX_8FC9A5A265A30881 (user_list_id), INDEX IDX_8FC9A5A24584665A (product_id), PRIMARY KEY(user_list_id, product_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE user_list ADD CONSTRAINT FK_3E49B4D1A76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE user_list_product ADD CONSTRAINT FK_8FC9A5A265A30881 FOREIGN KEY (user_list_id) REFERENCES user_list (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE user_list_product ADD CONSTRAINT FK_8FC9A5A24584665A FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE user_list DROP FOREIGN KEY FK_3E49B4D1A76ED395');
        $this->addSql('ALTER TABLE user_list_product DROP FOREIGN KEY FK_8FC9A5A265A30881');
        $this->addSql('ALTER TABLE user_list_product DROP FOREIGN KEY FK_8FC9A5A24584665A');
        $this->addSql('DROP TABLE user_list');
        $this->addSql('DROP TABLE user_list_product');
    }
}
