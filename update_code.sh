#!/usr/bin/env bash
set -euo pipefail

COMPOSE_DIR="/home/is214/odoo"
ADDONS_SRC="/home/is214/deploy-temp/addons"
ADDONS_DEST="/home/is214/odoo/addons"

echo "[1] Sync custom helpdesk addons"
sudo cp -r ${ADDONS_SRC}/helpdesk* ${ADDONS_DEST}/

echo "[2] Fix permissions"
sudo chown -R is214:is214 ${ADDONS_DEST}

echo "[3] Restart Odoo container"
cd ${COMPOSE_DIR}
sudo docker compose restart odoo 2>/dev/null || true

echo "[4] Verify containers running"
sudo docker ps

echo "Deployment complete."
