#!/usr/bin/env bash
# Records resources/img/demo.svg. Needs asciinema (>= 2.4.0) and bunx or npx.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
RUNNER="bunx"; command -v bunx >/dev/null || RUNNER="npx -y"

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

# Fake docker (no real daemon) and a config dir so `lda` runs the working copy
mkdir -p "$WORK/bin" "$WORK/config/docker-lda"
cat > "$WORK/bin/docker" <<'SHIM'
#!/usr/bin/env bash
case "$*" in
  "run -d --name web -p 8080:80 nginx") echo "3f9c2a7b1d4e8a65c0b2f1e9d7a4c3b8e5f60912a7d4c8b3e1f20a9c5d6b7e84" ;;
  "ps") printf 'CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                  NAMES\n3f9c2a7b1d4e   nginx     "/docker-entrypoint.…"   2 seconds ago   Up 2 seconds   0.0.0.0:8080->80/tcp   web\n' ;;
  "logs web") printf '/docker-entrypoint.sh: Configuration complete; ready for start up\n2025/01/01 12:00:00 [notice] 1#1: nginx/1.27.3\n2025/01/01 12:00:00 [notice] 1#1: start worker processes\n' ;;
  "stop web"|"rm web") echo web ;;
  "image ls") printf 'REPOSITORY   TAG       IMAGE ID       CREATED       SIZE\nnginx        latest    a1b2c3d4e5f6   2 weeks ago   192MB\nalpine       3.20      f6e5d4c3b2a1   5 weeks ago   7.8MB\n' ;;
  *) echo "docker $*" ;;
esac
SHIM
chmod +x "$WORK/bin/docker"
ln -s "$ROOT/docker-lda-help.sh" "$ROOT/docker-lda.sh" "$WORK/config/docker-lda/"

export PATH="$WORK/bin:$PATH"
export XDG_CONFIG_HOME="$WORK/config"
export LDA_DIR="$ROOT" SCRIPT="$ROOT/resources/demo/script.txt"
export LC_ALL=C.UTF-8 LANGUAGE=en_US:en
export HOME="$WORK"   # keep real home out of the recording

asciinema rec --overwrite -q -i 1 --cols 80 --rows 18 \
  -c "bash $ROOT/resources/demo/play.sh" "$WORK/demo.cast"

mkdir -p "$ROOT/resources/img"
$RUNNER svg-term-cli --in "$WORK/demo.cast" --out "$ROOT/resources/img/demo.svg" \
  --window --no-cursor --padding 10
echo "Wrote resources/img/demo.svg"
