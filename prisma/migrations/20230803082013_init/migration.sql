/*
  Warnings:

  - Added the required column `birthday` to the `Employee` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `CompanyEvent` DROP FOREIGN KEY `CompanyEvent_companyId_fkey`;

-- AlterTable
ALTER TABLE `CompanyEvent` MODIFY `companyId` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `Employee` ADD COLUMN `birthday` DATETIME(3) NOT NULL;

-- CreateTable
CREATE TABLE `_EmployeeCompanyEvents` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_EmployeeCompanyEvents_AB_unique`(`A`, `B`),
    INDEX `_EmployeeCompanyEvents_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `CompanyEvent` ADD CONSTRAINT `CompanyEvent_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `Company`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_EmployeeCompanyEvents` ADD CONSTRAINT `_EmployeeCompanyEvents_A_fkey` FOREIGN KEY (`A`) REFERENCES `CompanyEvent`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_EmployeeCompanyEvents` ADD CONSTRAINT `_EmployeeCompanyEvents_B_fkey` FOREIGN KEY (`B`) REFERENCES `Employee`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
