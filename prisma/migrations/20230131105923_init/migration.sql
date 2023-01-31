/*
  Warnings:

  - You are about to drop the `Votos` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Votos";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "votos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "eleicao_id" TEXT NOT NULL,
    "membro_id" TEXT NOT NULL,
    CONSTRAINT "votos_eleicao_id_fkey" FOREIGN KEY ("eleicao_id") REFERENCES "eleicoes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "votos_membro_id_fkey" FOREIGN KEY ("membro_id") REFERENCES "membros" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
