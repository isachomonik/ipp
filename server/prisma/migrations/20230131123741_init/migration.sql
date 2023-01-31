/*
  Warnings:

  - You are about to drop the `eleicao_membro` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `membro_id` on the `eleicoes` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "eleicao_membro_eleicao_id_key";

-- DropIndex
DROP INDEX "eleicao_membro_membro_id_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "eleicao_membro";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "_EleicaoToMembro" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_EleicaoToMembro_A_fkey" FOREIGN KEY ("A") REFERENCES "eleicoes" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_EleicaoToMembro_B_fkey" FOREIGN KEY ("B") REFERENCES "membros" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_eleicoes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT,
    "cargo_id" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    CONSTRAINT "eleicoes_cargo_id_fkey" FOREIGN KEY ("cargo_id") REFERENCES "cargos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_eleicoes" ("cargo_id", "date", "id", "nome") SELECT "cargo_id", "date", "id", "nome" FROM "eleicoes";
DROP TABLE "eleicoes";
ALTER TABLE "new_eleicoes" RENAME TO "eleicoes";
CREATE UNIQUE INDEX "eleicoes_id_key" ON "eleicoes"("id");
CREATE TABLE "new_membros" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "eleicao_id" TEXT
);
INSERT INTO "new_membros" ("cpf", "eleicao_id", "id", "nome") SELECT "cpf", "eleicao_id", "id", "nome" FROM "membros";
DROP TABLE "membros";
ALTER TABLE "new_membros" RENAME TO "membros";
CREATE UNIQUE INDEX "membros_cpf_key" ON "membros"("cpf");
CREATE TABLE "new_votos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "eleicao_id" TEXT NOT NULL,
    "membro_id" TEXT NOT NULL,
    CONSTRAINT "votos_eleicao_id_fkey" FOREIGN KEY ("eleicao_id") REFERENCES "eleicoes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "votos_membro_id_fkey" FOREIGN KEY ("membro_id") REFERENCES "membros" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_votos" ("eleicao_id", "id", "membro_id") SELECT "eleicao_id", "id", "membro_id" FROM "votos";
DROP TABLE "votos";
ALTER TABLE "new_votos" RENAME TO "votos";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "_EleicaoToMembro_AB_unique" ON "_EleicaoToMembro"("A", "B");

-- CreateIndex
CREATE INDEX "_EleicaoToMembro_B_index" ON "_EleicaoToMembro"("B");
