-- CreateTable
CREATE TABLE `tbl_responsavel` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(256) NOT NULL,
    `nome` VARCHAR(50) NOT NULL,
    `rg` VARCHAR(20) NOT NULL,
    `cpf` VARCHAR(20) NOT NULL,
    `telefone` VARCHAR(20) NOT NULL,
    `data_nascimento` DATE NOT NULL,
    `senha` VARCHAR(191) NOT NULL,
    `foto` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `tbl_responsavel_email_key`(`email`),
    UNIQUE INDEX `tbl_responsavel_rg_key`(`rg`),
    UNIQUE INDEX `tbl_responsavel_cpf_key`(`cpf`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_comentario` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `comentario` TEXT NOT NULL,
    `data_postagem` DATETIME(3) NOT NULL,
    `id_responsavel` INTEGER NOT NULL,
    `id_motorista` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_avaliacao` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `avaliacao` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_avaliacao_responsavel_motorista` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_avalicao` INTEGER NOT NULL,
    `id_responsavel` INTEGER NOT NULL,
    `id_motorista` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_motorista` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(256) NOT NULL,
    `nome` VARCHAR(50) NOT NULL,
    `rg` VARCHAR(20) NOT NULL,
    `cpf` VARCHAR(20) NOT NULL,
    `telefone` VARCHAR(20) NOT NULL,
    `data_nascimento` DATE NOT NULL,
    `senha` VARCHAR(191) NOT NULL,
    `foto` VARCHAR(191) NOT NULL,
    `data_inicio_carreira` DATE NOT NULL,
    `avaliacao` DOUBLE NOT NULL,
    `descricao` TEXT NOT NULL,
    `id_van` INTEGER NOT NULL,
    `id_endereco` INTEGER NOT NULL,

    UNIQUE INDEX `tbl_motorista_email_key`(`email`),
    UNIQUE INDEX `tbl_motorista_rg_key`(`rg`),
    UNIQUE INDEX `tbl_motorista_cpf_key`(`cpf`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_van` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `placa` VARCHAR(20) NOT NULL,
    `quantidade_vagas` INTEGER NOT NULL,
    `foto` TEXT NOT NULL,
    `descricao` TEXT NOT NULL,
    `id_modelo` INTEGER NOT NULL,

    UNIQUE INDEX `tbl_van_placa_key`(`placa`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_modelo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `modelo` VARCHAR(60) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_endereco` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cep` VARCHAR(20) NOT NULL,
    `numero` VARCHAR(20) NOT NULL,
    `bairro` VARCHAR(200) NOT NULL,
    `logradouro` VARCHAR(200) NOT NULL,
    `id_estado` INTEGER NOT NULL,

    UNIQUE INDEX `tbl_endereco_cep_key`(`cep`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_estado` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `estado` VARCHAR(150) NOT NULL,
    `id_cidade` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_cidade` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cidade` VARCHAR(150) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_responsavel_endereco` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_responsavel` INTEGER NOT NULL,
    `id_endereco` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_motorista_escola` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_escola` INTEGER NOT NULL,
    `id_motorista` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_escola` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `escola` VARCHAR(100) NOT NULL,
    `id_endereco` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_contrato` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome_passageiro` VARCHAR(150) NOT NULL,
    `idade_passageiro` INTEGER NOT NULL,
    `id_motorista` INTEGER NOT NULL,
    `id_responsavel` INTEGER NOT NULL,
    `id_preco` INTEGER NOT NULL,
    `id_escola` INTEGER NOT NULL,
    `id_tipo_contrato` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_preco` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `preco` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_tipo_contrato` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tipo_contrato` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `tbl_comentario` ADD CONSTRAINT `tbl_comentario_id_responsavel_fkey` FOREIGN KEY (`id_responsavel`) REFERENCES `tbl_responsavel`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_comentario` ADD CONSTRAINT `tbl_comentario_id_motorista_fkey` FOREIGN KEY (`id_motorista`) REFERENCES `tbl_motorista`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_avaliacao_responsavel_motorista` ADD CONSTRAINT `tbl_avaliacao_responsavel_motorista_id_avalicao_fkey` FOREIGN KEY (`id_avalicao`) REFERENCES `tbl_avaliacao`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_avaliacao_responsavel_motorista` ADD CONSTRAINT `tbl_avaliacao_responsavel_motorista_id_responsavel_fkey` FOREIGN KEY (`id_responsavel`) REFERENCES `tbl_responsavel`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_avaliacao_responsavel_motorista` ADD CONSTRAINT `tbl_avaliacao_responsavel_motorista_id_motorista_fkey` FOREIGN KEY (`id_motorista`) REFERENCES `tbl_motorista`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_motorista` ADD CONSTRAINT `tbl_motorista_id_van_fkey` FOREIGN KEY (`id_van`) REFERENCES `tbl_van`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_motorista` ADD CONSTRAINT `tbl_motorista_id_endereco_fkey` FOREIGN KEY (`id_endereco`) REFERENCES `tbl_endereco`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_van` ADD CONSTRAINT `tbl_van_id_modelo_fkey` FOREIGN KEY (`id_modelo`) REFERENCES `tbl_modelo`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_endereco` ADD CONSTRAINT `tbl_endereco_id_estado_fkey` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_estado` ADD CONSTRAINT `tbl_estado_id_cidade_fkey` FOREIGN KEY (`id_cidade`) REFERENCES `tbl_cidade`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_responsavel_endereco` ADD CONSTRAINT `tbl_responsavel_endereco_id_responsavel_fkey` FOREIGN KEY (`id_responsavel`) REFERENCES `tbl_responsavel`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_responsavel_endereco` ADD CONSTRAINT `tbl_responsavel_endereco_id_endereco_fkey` FOREIGN KEY (`id_endereco`) REFERENCES `tbl_endereco`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_motorista_escola` ADD CONSTRAINT `tbl_motorista_escola_id_escola_fkey` FOREIGN KEY (`id_escola`) REFERENCES `tbl_escola`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_motorista_escola` ADD CONSTRAINT `tbl_motorista_escola_id_motorista_fkey` FOREIGN KEY (`id_motorista`) REFERENCES `tbl_motorista`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_escola` ADD CONSTRAINT `tbl_escola_id_endereco_fkey` FOREIGN KEY (`id_endereco`) REFERENCES `tbl_endereco`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_contrato` ADD CONSTRAINT `tbl_contrato_id_motorista_fkey` FOREIGN KEY (`id_motorista`) REFERENCES `tbl_motorista`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_contrato` ADD CONSTRAINT `tbl_contrato_id_responsavel_fkey` FOREIGN KEY (`id_responsavel`) REFERENCES `tbl_responsavel`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_contrato` ADD CONSTRAINT `tbl_contrato_id_preco_fkey` FOREIGN KEY (`id_preco`) REFERENCES `tbl_preco`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_contrato` ADD CONSTRAINT `tbl_contrato_id_escola_fkey` FOREIGN KEY (`id_escola`) REFERENCES `tbl_escola`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tbl_contrato` ADD CONSTRAINT `tbl_contrato_id_tipo_contrato_fkey` FOREIGN KEY (`id_tipo_contrato`) REFERENCES `tbl_tipo_contrato`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
