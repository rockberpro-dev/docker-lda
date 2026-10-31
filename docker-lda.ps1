# ==============================================================================
# LDA — Logical Docker Aliases
# https://github.com/rockberpro-dev/docker-lda
#
# Install:
#   iwr -useb https://raw.githubusercontent.com/rockberpro-dev/docker-lda/main/setup.ps1 | iex
#
# Manual install:
#   Add `. "$HOME\.config\docker-lda\docker-lda.ps1"` to your $PROFILE
# ==============================================================================

# --- PULL / RUN ---
function dpl  { docker pull @args }
function dpu  { docker push @args }
function dbl  { docker build @args }
function drn  { docker run @args }
function drni { docker run -it @args }

# --- CONTAINER ---
function dps  { docker ps @args }
function dpsa { docker ps -a @args }
function drm  { docker rm @args }
function drmf { docker rm -f @args }
function dex  { docker exec @args }
function dexi { docker exec -it @args }

# --- LOGS ---
function dlg  { docker logs @args }
function dlgf { docker logs -f @args }

# --- IMAGE ---
function dim  { docker image @args }
function dils { docker image ls @args }
function dirm { docker image rm @args }
function dipr { docker image prune @args }
function dtg  { docker tag @args }

# --- VOLUME ---
function dv   { docker volume @args }
function dvls { docker volume ls @args }
function dvrm { docker volume rm @args }
function dvpr { docker volume prune @args }

# --- NETWORK ---
function dn   { docker network @args }
function dnls { docker network ls @args }
function dnrm { docker network rm @args }
function dnpr { docker network prune @args }

# --- COMPOSE ---
function dc   { docker compose @args }
function dcu  { docker compose up @args }
function dcud { docker compose up -d @args }
function dcd  { docker compose down @args }
function dcb  { docker compose build @args }
function dcl  { docker compose logs @args }
function dclf { docker compose logs -f @args }
function dcr  { docker compose restart @args }
function dcs  { docker compose stop @args }
function dce  { docker compose exec @args }
function dcps { docker compose ps @args }
function dcpl { docker compose pull @args }

# --- MANAGEMENT ---
function dst { docker start @args }
function dsp { docker stop @args }
function drs { docker restart @args }
function dip { docker inspect @args }

# --- SYSTEM ---
function dsy   { docker system @args }
function dsypr { docker system prune @args }

# --- HELP ---
function lda { & "$(if ($env:XDG_CONFIG_HOME) { $env:XDG_CONFIG_HOME } else { "$HOME\.config" })\docker-lda\docker-lda-help.ps1" }
