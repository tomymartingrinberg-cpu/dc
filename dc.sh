#!/bin/bash

# Configuración
FPS=0.01

# Preparar terminal
tput civis
clear
trap "tput cnorm; clear; exit" SIGINT SIGTERM

# ==========================================
# EL AVIÓN CON LA PUNTA REAL (UNIDA)
# ==========================================
avion=$(cat << 'EOF'
                                                                   /|
                                                                  / |
                                                                 /  |
                                                                /   |
                                     __________________________/    |____
                      ______________/                               |    \__
           __________/                                              |       \_
   _______/                                                         |         \
  /                                                                 |          |
 /  ________________________________________________________________|          |
<  /                                                                |          |
 \ \________________________________________________________________|          |
  \                                                                 |          |
   \________________                                                |          |
                    \_______________________________________________|__________|
        /______________________________________________________________________\
        |  O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   |
        |______________________________________________________________________|
                            / /                              / /
                           O-O                              O-O
EOF
)

term_cols=$(tput cols)
avion_width=90

# Animación
for ((i=term_cols; i>-avion_width; i--)); do
    tput cup 0 0
    while IFS= read -r line; do
        if [ $i -gt 0 ]; then
            printf "%${i}s%s\n" "" "$line"
        else
            echo "${line: $(( -i ))}"
        fi
    done <<< "$avion"
    sleep $FPS
done

tput cnorm
clear
