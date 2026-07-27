#!/usr/bin/env bash
# Script de automação para extrair, mesclar e compilar os locales do FlatLight

# Garante que roda a partir da raiz do repositório
CDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$CDIR" || exit 1

echo "1. Extraindo strings para locale/FlatLight.pot..."
xgettext --package-name="FlatLight" \
         --package-version="1.1-alfa" \
         --language=Shell \
         --from-code=UTF-8 \
         --keyword=gettext \
         --keyword=eval_gettext \
         -o locale/FlatLight.pot \
         flatlight

echo "2. Mesclando atualizações nos arquivos .po..."
if [[ -f locale/en/LC_MESSAGES/FlatLight.po ]]; then
    msgmerge --update locale/en/LC_MESSAGES/FlatLight.po locale/FlatLight.pot
fi

echo "3. Compilando os arquivos .mo..."
msgfmt locale/en/LC_MESSAGES/FlatLight.po -o locale/en/LC_MESSAGES/FlatLight.mo

echo "Feito! Tradução atualizada e compilada com sucesso."
