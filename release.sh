#!/bin/bash
set -e

VERSION="25.0"
PKG_NAME="avion"
TAG="v$VERSION"
TARBALL="$PKG_NAME-$VERSION.tar.gz"

# 1. Limpiar versiones viejas
rm -f *.tar.gz *.zip

# 2. Generar plantillas
./build_packages.sh

# 3. Empaquetar fuente
TEMP_DIR="dc-$VERSION"
mkdir -p "$TEMP_DIR"
cp dc.sh Makefile LICENSE README.md "$TEMP_DIR/"
tar -czf "$TARBALL" "$TEMP_DIR"
rm -rf "$TEMP_DIR"

# 4. Subir a GitHub (requiere gh auth login)
gh release create "$TAG" "$TARBALL" --title "Edición $VERSION" --notes "Soporte 2025 completo."
zip -r packaging_v$VERSION.zip packaging/
gh release upload "$TAG" packaging_v$VERSION.zip

echo "¡Versión $VERSION está en el aire!"
