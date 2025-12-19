# --- Variables ---
TARGET = avion
PREFIX ?= /usr
BINDIR = $(DESTDIR)$(PREFIX)/bin

# --- No hay compilación en Bash, así que 'all' no hace nada ---
all:
	@echo "El script de Bash no necesita compilación."

# --- Instalación del script ---
install:
	mkdir -p $(BINDIR)
	install -m 755 dc.sh $(BINDIR)/$(TARGET)

# --- Limpieza ---
clean:
	@echo "Nada que limpiar."

.PHONY: all install clean
