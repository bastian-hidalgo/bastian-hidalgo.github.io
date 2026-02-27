#!/bin/bash

# Script para exportar el CV a PDF usando Google Chrome (Headless)
# Este script asegura que el CV se exporte en una sola página A4 y sin encabezados/pies de página.

# Ruta al ejecutable de Chrome en macOS
CHROME_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

# Obtener la ruta absoluta del index.html
CURRENT_DIR=$(pwd)
HTML_FILE="file://$CURRENT_DIR/index.html"
OUTPUT_FILE="Bastian-Hidalgo-CV.pdf"

echo "Generando PDF limpio desde: $HTML_FILE"

# Ejecutar Chrome con flags para evitar encabezados/pies de página
# --print-to-pdf-no-header es la clave para quitar la fecha/hora/titulo
"$CHROME_PATH" --headless --disable-gpu --print-to-pdf="$OUTPUT_FILE" --print-to-pdf-no-header --no-margins "$HTML_FILE"

if [ $? -eq 0 ]; then
    echo "¡Éxito! El CV ha sido exportado a $OUTPUT_FILE (Sin encabezados)"
else
    echo "Hubo un error al generar el PDF. Asegúrate de tener Google Chrome instalado."
fi
