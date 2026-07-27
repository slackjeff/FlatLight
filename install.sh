#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Script de instalação para o FlatLight

set -euo pipefail

PRG="flatlight"
PREFIX="${PREFIX:-/usr/local}"
BINDIR="${PREFIX}/bin"
LOCALEDIR="${PREFIX}/share/locale"

# Cores
fRed='\e[31;1m'
fGreen='\e[32;1m'
fEnd='\e[m'

#-----------------------#
# Inicio
#-----------------------#
echo -e "${fGreen}==> Instalando ${PRG}...${fEnd}"

# Instala o executável
echo "--> Copiando executável para ${BINDIR}/${PRG}..."
install -d "$BINDIR"
install -m 755 "$PRG" "${BINDIR}/${PRG}"

# Instala o i18n
for mo_file in locale/*/LC_MESSAGES/FlatLight.mo; do
	[[ -f "${mo_file}" ]] || continue
	
	# Extrai a sigla do idioma do caminho locale
	lang=$(echo "$mo_file" | cut -d '/' -f 2)
	
	echo "[i18N] instalando idioma ${lang}"
	install -d "${LOCALEDIR}/${lang}/LC_MESSAGES"
	install -m 644 "$mo_file" "${LOCALEDIR}/${lang}/LC_MESSAGES/${PRG}.mo"
done

echo -e "${fGreen}✔ Instalação concluída com sucesso!${fEnd}"
