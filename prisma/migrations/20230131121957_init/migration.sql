/*
  Warnings:

  - You are about to drop the column `cargo_id` on the `membros` table. All the data in the column will be lost.
  - You are about to drop the column `membro_id` on the `cargos` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_membros" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "eleicao_id" TEXT,
    CONSTRAINT "membros_eleicao_id_fkey" FOREIGN KEY ("eleicao_id") REFERENCES "eleicao_membro" ("eleicao_id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_membros" ("cpf", "eleicao_id", "id", "nome") SELECT "cpf", "eleicao_id", "id", "nome" FROM "membros";
DROP TABLE "membros";
ALTER TABLE "new_membros" RENAME TO "membros";
CREATE UNIQUE INDEX "membros_cpf_key" ON "membros"("cpf");
CREATE TABLE "new_cargo_membro" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "membro_id" TEXT NOT NULL,
    "cargo_id" TEXT NOT NULL,
    CONSTRAINT "cargo_membro_membro_id_fkey" FOREIGN KEY ("membro_id") REFERENCES "membros" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "cargo_membro_cargo_id_fkey" FOREIGN KEY ("cargo_id") REFERENCES "cargos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_cargo_membro" ("cargo_id", "id", "membro_id") SELECT "cargo_id", "id", "membro_id" FROM "cargo_membro";
DROP TABLE "cargo_membro";
ALTER TABLE "new_cargo_membro" RENAME TO "cargo_membro";
CREATE UNIQUE INDEX "cargo_membro_membro_id_key" ON "cargo_membro"("membro_id");
CREATE UNIQUE INDEX "cargo_membro_cargo_id_key" ON "cargo_membro"("cargo_id");
CREATE UNIQUE INDEX "cargo_membro_membro_id_cargo_id_key" ON "cargo_membro"("membro_id", "cargo_id");
CREATE TABLE "new_cargos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL
);
INSERT INTO "new_cargos" ("id", "nome") SELECT "id", "nome" FROM "cargos";
DROP TABLE "cargos";
ALTER TABLE "new_cargos" RENAME TO "cargos";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
