/*
  Warnings:

  - Added the required column `membro_id` to the `eleicoes` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_membros" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "cargo_id" TEXT NOT NULL,
    "eleicao_id" TEXT,
    CONSTRAINT "membros_eleicao_id_fkey" FOREIGN KEY ("eleicao_id") REFERENCES "eleicao_membro" ("eleicao_id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "membros_cargo_id_fkey" FOREIGN KEY ("cargo_id") REFERENCES "cargo_membro" ("cargo_id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_membros" ("cargo_id", "cpf", "id", "nome") SELECT "cargo_id", "cpf", "id", "nome" FROM "membros";
DROP TABLE "membros";
ALTER TABLE "new_membros" RENAME TO "membros";
CREATE UNIQUE INDEX "membros_cpf_key" ON "membros"("cpf");
CREATE TABLE "new_eleicoes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT,
    "cargo_id" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "membro_id" TEXT NOT NULL,
    CONSTRAINT "eleicoes_cargo_id_fkey" FOREIGN KEY ("cargo_id") REFERENCES "cargos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "eleicoes_membro_id_fkey" FOREIGN KEY ("membro_id") REFERENCES "eleicao_membro" ("membro_id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_eleicoes" ("cargo_id", "date", "id", "nome") SELECT "cargo_id", "date", "id", "nome" FROM "eleicoes";
DROP TABLE "eleicoes";
ALTER TABLE "new_eleicoes" RENAME TO "eleicoes";
CREATE UNIQUE INDEX "eleicoes_membro_id_key" ON "eleicoes"("membro_id");
CREATE UNIQUE INDEX "eleicoes_id_membro_id_key" ON "eleicoes"("id", "membro_id");
CREATE TABLE "new_votos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "eleicao_id" TEXT NOT NULL,
    "membro_id" TEXT NOT NULL,
    CONSTRAINT "votos_eleicao_id_membro_id_fkey" FOREIGN KEY ("eleicao_id", "membro_id") REFERENCES "eleicoes" ("id", "membro_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "votos_membro_id_fkey" FOREIGN KEY ("membro_id") REFERENCES "membros" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_votos" ("eleicao_id", "id", "membro_id") SELECT "eleicao_id", "id", "membro_id" FROM "votos";
DROP TABLE "votos";
ALTER TABLE "new_votos" RENAME TO "votos";
CREATE TABLE "new_cargo_membro" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "membro_id" TEXT NOT NULL,
    "cargo_id" TEXT NOT NULL
);
INSERT INTO "new_cargo_membro" ("cargo_id", "id", "membro_id") SELECT "cargo_id", "id", "membro_id" FROM "cargo_membro";
DROP TABLE "cargo_membro";
ALTER TABLE "new_cargo_membro" RENAME TO "cargo_membro";
CREATE UNIQUE INDEX "cargo_membro_membro_id_key" ON "cargo_membro"("membro_id");
CREATE UNIQUE INDEX "cargo_membro_cargo_id_key" ON "cargo_membro"("cargo_id");
CREATE TABLE "new_cargos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "membro_id" TEXT,
    CONSTRAINT "cargos_membro_id_fkey" FOREIGN KEY ("membro_id") REFERENCES "cargo_membro" ("membro_id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_cargos" ("id", "nome") SELECT "id", "nome" FROM "cargos";
DROP TABLE "cargos";
ALTER TABLE "new_cargos" RENAME TO "cargos";
CREATE TABLE "new_eleicao_membro" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "membro_id" TEXT,
    "eleicao_id" TEXT
);
INSERT INTO "new_eleicao_membro" ("eleicao_id", "id", "membro_id") SELECT "eleicao_id", "id", "membro_id" FROM "eleicao_membro";
DROP TABLE "eleicao_membro";
ALTER TABLE "new_eleicao_membro" RENAME TO "eleicao_membro";
CREATE UNIQUE INDEX "eleicao_membro_membro_id_key" ON "eleicao_membro"("membro_id");
CREATE UNIQUE INDEX "eleicao_membro_eleicao_id_key" ON "eleicao_membro"("eleicao_id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
