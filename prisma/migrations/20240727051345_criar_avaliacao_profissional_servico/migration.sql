-- CreateTable
CREATE TABLE `profissional` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `descricao` TEXT NOT NULL,
    `imagemUrl` VARCHAR(191) NOT NULL,
    `avaliacao` DOUBLE NOT NULL,
    `quantidadeAvaliacoes` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `servico` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `descricao` TEXT NULL,
    `preco` DOUBLE NOT NULL,
    `qtdeSlots` INTEGER NOT NULL,
    `imagemUrl` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `servico_nome_key`(`nome`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `agendamento` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `emailCliente` VARCHAR(191) NOT NULL,
    `data` TIMESTAMP NOT NULL,
    `profissionalId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_AgendamentoToServico` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_AgendamentoToServico_AB_unique`(`A`, `B`),
    INDEX `_AgendamentoToServico_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `agendamento` ADD CONSTRAINT `agendamento_profissionalId_fkey` FOREIGN KEY (`profissionalId`) REFERENCES `profissional`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_AgendamentoToServico` ADD CONSTRAINT `_AgendamentoToServico_A_fkey` FOREIGN KEY (`A`) REFERENCES `agendamento`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_AgendamentoToServico` ADD CONSTRAINT `_AgendamentoToServico_B_fkey` FOREIGN KEY (`B`) REFERENCES `servico`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
