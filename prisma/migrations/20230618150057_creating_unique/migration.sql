/*
  Warnings:

  - A unique constraint covering the columns `[modelo]` on the table `tbl_modelo` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `tbl_modelo_modelo_key` ON `tbl_modelo`(`modelo`);
