Name:           avion
Version:        25.0
Release:        1%{?dist}
Summary:        Avion ASCII animado (v25.0)
License:        Toyoda
URL:            https://github.com/tomasmartingrinberg-cpu/dc
Source0:        %{name}-%{version}.tar.gz
BuildArch:      noarch
BuildRequires:  make
Requires:       bash, ncurses

%description
Animacion de un avion para la terminal escrita en Bash para el año 2025.

%install
make DESTDIR=%{buildroot} PREFIX=/usr install

%files
%{_bindir}/avion

%changelog
* jue dic 18 2025 Tomy <tomy.martin.grinberg@.com> - 25.0-1
- Lanzamiento de la versión 25.0
