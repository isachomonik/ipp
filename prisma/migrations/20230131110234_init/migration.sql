/*
  Warnings:

  - You are about to drop the column `cargo` on the `membros` table. All the data in the column will be lost.
  - Added the required column `cargo_id` to the `membros` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_membros" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "cpf" INTEGER NOT NULL,
    "cargo_id" TEXT NOT NULL,
    CONSTRAINT "membros_cargo_id_fkey" FOREIGN KEY ("cargo_id") REFERENCES "cargos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_membros" ("cpf", "id", "nome") SELECT "cpf", "id", "nome" FROM "membros";
DROP TABLE "membros";
ALTER TABLE "new_membros" RENAME TO "membros";
CREATE UNIQUE INDEX "membros_cpf_key" ON "membros"("cpf");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
