#!/usr/bin/env bash

# ==============================================================================
# Script de Execução no Computador (Desktop / Web / PWA) - Estoque Mais
# ==============================================================================

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_DIR="${PROJECT_DIR}/app_src/assets"
PORT="${PORT:-3000}"

echo "=============================================================================="
echo "           ESTOQUE MAIS WMS - MODO COMPUTADOR (DESKTOP / WEB)"
echo "=============================================================================="
echo "Diretório do App: ${APP_DIR}"
echo ""

# Função para abrir navegador de acordo com o SO
abrir_navegador() {
  local url="$1"
  if [[ "$OSTYPE" == "darwin"* ]]; then
    open "${url}"
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xdg-open "${url}" 2>/dev/null || sensible-browser "${url}" 2>/dev/null || echo "Abra no navegador: ${url}"
  elif [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "cygwin"* ]]; then
    start "${url}"
  else
    echo "Abra no seu navegador: ${url}"
  fi
}

# 1. Iniciar servidor local com Python 3 se disponível
if command -v python3 &>/dev/null; then
  echo "==> Iniciando servidor web local na porta ${PORT} via Python 3..."
  echo "==> Acesse no seu computador: http://localhost:${PORT}"
  echo "==> DICA: No Google Chrome, Edge ou Safari, clique no ícone 'Instalar' na barra de endereços para usar como app de desktop independente."
  echo ""
  
  (sleep 1 && abrir_navegador "http://localhost:${PORT}") &
  cd "${APP_DIR}" && python3 -m http.server "${PORT}"
  exit 0
fi

# 2. Alternativa com Node.js (npx serve)
if command -v npx &>/dev/null; then
  echo "==> Iniciando via npx serve..."
  (sleep 1 && abrir_navegador "http://localhost:${PORT}") &
  npx serve -l "${PORT}" "${APP_DIR}"
  exit 0
fi

# 3. Fallback: Abrir arquivo index.html diretamente no navegador
echo "==> Abrindo index.html diretamente no navegador padrão..."
abrir_navegador "file://${APP_DIR}/index.html"
