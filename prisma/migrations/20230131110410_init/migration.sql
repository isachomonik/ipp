-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_membros" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "cargo_id" TEXT NOT NULL,
    CONSTRAINT "membros_cargo_id_fkey" FOREIGN KEY ("cargo_id") REFERENCES "cargos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_membros" ("cargo_id", "cpf", "id", "nome") SELECT "cargo_id", "cpf", "id", "nome" FROM "membros";
DROP TABLE "membros";
ALTER TABLE "new_membros" RENAME TO "membros";
CREATE UNIQUE INDEX "membros_cpf_key" ON "membros"("cpf");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
