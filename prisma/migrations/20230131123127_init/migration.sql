-- CreateTable
CREATE TABLE "_CargoToMembro" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_CargoToMembro_A_fkey" FOREIGN KEY ("A") REFERENCES "cargos" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_CargoToMembro_B_fkey" FOREIGN KEY ("B") REFERENCES "membros" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
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
CREATE UNIQUE INDEX "cargo_membro_membro_id_cargo_id_key" ON "cargo_membro"("membro_id", "cargo_id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "_CargoToMembro_AB_unique" ON "_CargoToMembro"("A", "B");

-- CreateIndex
CREATE INDEX "_CargoToMembro_B_index" ON "_CargoToMembro"("B");
