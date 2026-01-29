#!/bin/bash

echo "--- 🚀 Iniciando Restauração do Seu Rice ---"

# 1. Restaurar Programas (Flatpaks)
# Ele lê a lista flatpaks.txt e manda instalar um por um
if [ -f "flatpaks.txt" ]; then
    echo "📦 Instalando seus Flatpaks..."
    xargs flatpak install -y < flatpaks.txt
else
    echo "⚠️  Arquivo flatpaks.txt não encontrado."
fi

# 2. Restaurar Visual (dconf)
# Aplica o tema, ícones e configurações do Zorin
if [ -f "zorin-settings.dconf" ]; then
    echo "🎨 Restaurando configurações visuais..."
    dconf load / < zorin-settings.dconf
else
    echo "⚠️  Arquivo dconf não encontrado."
fi

# 3. Restaurar Terminal (.bashrc / .zshrc)
# Faz um backup do atual antes de substituir (segurança)
echo "💻 Restaurando configurações do terminal..."

if [ -f ".bashrc" ]; then
    cp ~/.bashrc ~/.bashrc.backup_antes_do_restore
    cp .bashrc ~/
    echo "✅ .bashrc restaurado (backup criado)."
fi

if [ -f ".zshrc" ]; then
    cp ~/.zshrc ~/.zshrc.backup_antes_do_restore
    cp .zshrc ~/
    echo "✅ .zshrc restaurado (backup criado)."
fi

echo "--- 🎉 Restauração Concluída! ---"
echo "Reinicie o computador para ver todas as mudanças."
