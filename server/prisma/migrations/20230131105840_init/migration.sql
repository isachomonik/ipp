-- CreateTable
CREATE TABLE "membros" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "cpf" INTEGER NOT NULL,
    "cargo" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "cargo_membro" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "membro_id" TEXT NOT NULL,
    "cargo_id" TEXT NOT NULL,
    CONSTRAINT "cargo_membro_membro_id_fkey" FOREIGN KEY ("membro_id") REFERENCES "membros" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "cargo_membro_cargo_id_fkey" FOREIGN KEY ("cargo_id") REFERENCES "cargos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "cargos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "eleicao_membro" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "membro_id" TEXT NOT NULL,
    "eleicao_id" TEXT NOT NULL,
    CONSTRAINT "eleicao_membro_membro_id_fkey" FOREIGN KEY ("membro_id") REFERENCES "membros" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "eleicao_membro_eleicao_id_fkey" FOREIGN KEY ("eleicao_id") REFERENCES "eleicoes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "eleicoes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT,
    "cargo_id" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    CONSTRAINT "eleicoes_cargo_id_fkey" FOREIGN KEY ("cargo_id") REFERENCES "cargos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Votos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "eleicao_id" TEXT NOT NULL,
    "membro_id" TEXT NOT NULL,
    CONSTRAINT "Votos_eleicao_id_fkey" FOREIGN KEY ("eleicao_id") REFERENCES "eleicoes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Votos_membro_id_fkey" FOREIGN KEY ("membro_id") REFERENCES "membros" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "membros_cpf_key" ON "membros"("cpf");
