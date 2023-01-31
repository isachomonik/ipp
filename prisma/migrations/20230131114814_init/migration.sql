-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_membros" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "cargo_id" TEXT,
    "eleicao_id" TEXT,
    CONSTRAINT "membros_eleicao_id_fkey" FOREIGN KEY ("eleicao_id") REFERENCES "eleicao_membro" ("eleicao_id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "membros_cargo_id_fkey" FOREIGN KEY ("cargo_id") REFERENCES "cargo_membro" ("cargo_id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_membros" ("cargo_id", "cpf", "eleicao_id", "id", "nome") SELECT "cargo_id", "cpf", "eleicao_id", "id", "nome" FROM "membros";
DROP TABLE "membros";
ALTER TABLE "new_membros" RENAME TO "membros";
CREATE UNIQUE INDEX "membros_cpf_key" ON "membros"("cpf");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
