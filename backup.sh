#!/bin/bash

# Define a pasta onde estamos (a pasta dos dotfiles)
DIR_ATUAL=$(pwd)

echo "--- Iniciando Backup do Rice do Zorin ---"

# 1. Salvar lista de Flatpaks (Loja do Zorin)
echo "Salvando lista de Flatpaks..."
flatpak list --app --columns=application > $DIR_ATUAL/flatpaks.txt

# 2. Salvar configurações do GNOME/Zorin (Temas, Dock, Atalhos)
# Isso salva o estado atual do seu desktop
echo "Salvando configurações do Zorin/GNOME..."
dconf dump / > $DIR_ATUAL/zorin-settings.dconf

# 3. Copiar configurações de terminal (Bash/Zsh)
# Verifica se o arquivo existe antes de copiar
if [ -f ~/.bashrc ]; then
    cp ~/.bashrc $DIR_ATUAL/.bashrc
    echo ".bashrc copiado."
fi

if [ -f ~/.zshrc ]; then
    cp ~/.zshrc $DIR_ATUAL/.zshrc
    echo ".zshrc copiado."
fi

# 4. (Opcional) Copiar pasta de configurações específicas
# Se você usa Starship, Neofetch ou Kitty, descomente as linhas abaixo:
# mkdir -p $DIR_ATUAL/.config
# cp -r ~/.config/neofetch $DIR_ATUAL/.config/ 2>/dev/null
# cp -r ~/.config/starship.toml $DIR_ATUAL/.config/ 2>/dev/null

echo "--- Backup concluído na pasta: $DIR_ATUAL ---"
echo "Agora você pode subir essa pasta para o GitHub!"
