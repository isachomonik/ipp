/*
  Warnings:

  - You are about to drop the column `eleicao_id` on the `membros` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_membros" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL
);
INSERT INTO "new_membros" ("cpf", "id", "nome") SELECT "cpf", "id", "nome" FROM "membros";
DROP TABLE "membros";
ALTER TABLE "new_membros" RENAME TO "membros";
CREATE UNIQUE INDEX "membros_cpf_key" ON "membros"("cpf");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
