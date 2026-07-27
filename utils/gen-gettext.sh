#!/usr/bin/env bash
# Script de automação para extrair, mesclar e compilar os locales do FlatLight

# Garante que roda a partir da raiz do repositório
CDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$CDIR" || exit 1

PRG="flatlight"
POT_FILE="locale/flatlight.pot"

echo "Extraindo strings para ${POT_FILE}..."
xgettext --package-name="${PRG}" \
         --package-version="1.3-alfa" \
         --language=Shell \
         --from-code=UTF-8 \
         --keyword=gettext \
         --keyword=eval_gettext \
         -o "${POT_FILE}" \
         "${PRG}"

# Garante que o loop não falhe se não houver arquivos
shopt -s nullglob

echo "Processando traduções encontradas em locale/..."

for po_file in locale/*/LC_MESSAGES/"${PRG}".po; do
    # Extrai o idioma a partir do caminho (ex: locale/es/LC_MESSAGES/flatlight.po -> es)
    lang=$(echo "$po_file" | cut -d'/' -f2)
    mo_file="locale/${lang}/LC_MESSAGES/${PRG}.mo"

    echo "==> [${lang}] Mesclando atualizações no .po..."
    msgmerge --update "$po_file" "$POT_FILE"

    echo "==> [${lang}] Compilando para .mo..."
    msgfmt "$po_file" -o "$mo_file"
done

shopt -u nullglob

echo "Feito! Todos os idiomas foram atualizados e compilados com sucesso."
