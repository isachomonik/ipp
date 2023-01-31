-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_cargo_membro" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "membro_id" TEXT,
    "cargo_id" TEXT,
    CONSTRAINT "cargo_membro_membro_id_fkey" FOREIGN KEY ("membro_id") REFERENCES "membros" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "cargo_membro_cargo_id_fkey" FOREIGN KEY ("cargo_id") REFERENCES "cargos" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_cargo_membro" ("cargo_id", "id", "membro_id") SELECT "cargo_id", "id", "membro_id" FROM "cargo_membro";
DROP TABLE "cargo_membro";
ALTER TABLE "new_cargo_membro" RENAME TO "cargo_membro";
CREATE UNIQUE INDEX "cargo_membro_membro_id_cargo_id_key" ON "cargo_membro"("membro_id", "cargo_id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
