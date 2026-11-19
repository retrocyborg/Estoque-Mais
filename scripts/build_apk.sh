#!/usr/bin/env bash
set -e

# ==============================================================================
# Script de Build do APK Unificado - Estoque Mais (Beta)
# ==============================================================================

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_SRC="${PROJECT_DIR}/app_src"
BUILD_DIR="${PROJECT_DIR}/build"
KEYSTORE="${PROJECT_DIR}/estoquemais-release.keystore"
KEY_ALIAS="estoquemais"
KEY_PASS="estoquemais123"
BUILD_TOOLS="/Users/nandafrancodemedeiros/Library/Android/sdk/build-tools/35.0.0"

VERSION="0.5"
APK_NAME="EstoqueMais-beta-${VERSION}.apk"
UNALIGNED_APK="${BUILD_DIR}/app-unaligned.apk"
FINAL_APK="${PROJECT_DIR}/${APK_NAME}"
DOWNLOADS_APK="${HOME}/Downloads/${APK_NAME}"

echo "==> Iniciando Build do Estoque Mais (Beta ${VERSION})..."
mkdir -p "${BUILD_DIR}"
rm -f "${UNALIGNED_APK}" "${FINAL_APK}"

# 1. Empacotar arquivos do app
echo "==> [1/4] Empacotando APK com zip..."
(cd "${APP_SRC}" && zip -r -D -X -9 "${UNALIGNED_APK}" .)

# 2. Alinhar com zipalign
echo "==> [2/4] Alinhando APK com zipalign (4 bytes)..."
"${BUILD_TOOLS}/zipalign" -f -p 4 "${UNALIGNED_APK}" "${FINAL_APK}"

# 3. Assinar com apksigner (esquemas v1, v2 e v3)
echo "==> [3/4] Assinando APK com apksigner..."
"${BUILD_TOOLS}/apksigner" sign \
  --ks "${KEYSTORE}" \
  --ks-pass "pass:${KEY_PASS}" \
  --ks-key-alias "${KEY_ALIAS}" \
  --key-pass "pass:${KEY_PASS}" \
  "${FINAL_APK}"

# 4. Verificar assinatura
echo "==> [4/4] Verificando assinatura do APK..."
"${BUILD_TOOLS}/apksigner" verify --verbose "${FINAL_APK}"

# Copiar para Downloads se possível
if cp "${FINAL_APK}" "${DOWNLOADS_APK}" 2>/dev/null; then
  echo "==> APK copiado com sucesso para ${DOWNLOADS_APK}"
else
  echo "==> APK gerado em ${FINAL_APK} (copie manualmente para ~/Downloads se houver restrição de permissão do macOS)"
fi

echo "=============================================================================="
echo "SUCESSO: ${APK_NAME} gerado com sucesso!"
echo "Localização no repositório: ${FINAL_APK}"
echo "=============================================================================="
