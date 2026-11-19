#!/usr/bin/env bash
set -e

# ==============================================================================
# Script de Configuração do Banco de Dados - Estoque Mais (MySQL)
# ==============================================================================

DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-3306}"
DB_USER="${DB_USER:-root}"
DB_PASS="${DB_PASS:-}"
DB_NAME="controle_estoque"
SQL_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/bd_01.sql"

echo "==> Configurando banco de dados ${DB_NAME} em ${DB_HOST}:${DB_PORT}..."

if [ -z "${DB_PASS}" ]; then
  mysql -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" < "${SQL_FILE}"
else
  mysql -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" < "${SQL_FILE}"
fi

echo "==> Banco ${DB_NAME} inicializado com sucesso a partir de bd_01.sql!"
