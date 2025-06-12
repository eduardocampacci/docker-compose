#!/bin/bash

# Caminho base do projeto
BASE_DIR="/opt/nextcloud"

# Lista de diretórios a serem criados com seus respectivos donos (UID:GID)
declare -A DIRS_AND_OWNERS=(
  ["$BASE_DIR/db"]="1001:1001"
  ["$BASE_DIR/redis"]="999:999"
  ["$BASE_DIR/nc/html"]="33:33"
  ["$BASE_DIR/onlyoffice"]="101:101"
  ["$BASE_DIR/logs"]="33:33"
)

echo "Criando diretórios e aplicando permissões..."
for DIR in "${!DIRS_AND_OWNERS[@]}"; do
  OWNER=${DIRS_AND_OWNERS[$DIR]}
  [ ! -d "$DIR" ] && mkdir -p "$DIR"
  chown -R "$OWNER" "$DIR"
done

ENV_FILE="$BASE_DIR/.env"
if [ ! -f "$ENV_FILE" ]; then
  echo "Criando arquivo .env padrão..."
  cat > "$ENV_FILE" <<EOF
NEXTCLOUD_DB_NAME=nextcloud
NEXTCLOUD_DB_USER=nc_user
NEXTCLOUD_DB_PASSWORD=nc_pass
NEXTCLOUD_DB_ROOT_PASSWORD=nc_root_pass
NEXTCLOUD_ADMIN_USER=admin
NEXTCLOUD_ADMIN_PASSWORD=admin123
ONLYOFFICE_SECRET=supersecretkey
EOF
fi

DOCKERFILE="$BASE_DIR/nc/Dockerfile"
if [ ! -f "$DOCKERFILE" ]; then
  echo "Criando Dockerfile padrão..."
  cat > "$DOCKERFILE" <<EOF
FROM nextcloud:31

RUN apt update && apt install -y \\
    smbclient \\
    libsmbclient-dev \\
    && rm -rf /var/lib/apt/lists/*
EOF
fi

echo
echo "Script concluído com sucesso."
