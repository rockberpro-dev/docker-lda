# ==============================================================================
# LDA — Logical Docker Aliases
# https://github.com/rockberpro-dev/docker-lda
#
# Install:
#   curl -sL https://raw.githubusercontent.com/rockberpro-dev/docker-lda/main/setup.sh | bash
#
# Manual install:
#   echo 'source ~/.config/docker-lda/docker-lda.sh' >> ~/.bashrc && source ~/.bashrc
# ==============================================================================

# --- PULL / RUN ---
alias dpl='docker pull'
alias dpu='docker push'
alias dbl='docker build'
alias drn='docker run'
alias drni='docker run -it'

# --- CONTAINER ---
alias dps='docker ps'
alias dpsa='docker ps -a'
alias drm='docker rm'
alias drmf='docker rm -f'
alias dex='docker exec'
alias dexi='docker exec -it'

# --- LOGS ---
alias dlg='docker logs'
alias dlgf='docker logs -f'

# --- IMAGE ---
alias dim='docker image'
alias dils='docker image ls'
alias dirm='docker image rm'
alias dipr='docker image prune'
alias dtg='docker tag'

# --- VOLUME ---
alias dv='docker volume'
alias dvls='docker volume ls'
alias dvrm='docker volume rm'
alias dvpr='docker volume prune'

# --- NETWORK ---
alias dn='docker network'
alias dnls='docker network ls'
alias dnrm='docker network rm'
alias dnpr='docker network prune'

# --- COMPOSE ---
alias dc='docker compose'
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcd='docker compose down'
alias dcb='docker compose build'
alias dcl='docker compose logs'
alias dclf='docker compose logs -f'
alias dcr='docker compose restart'
alias dcs='docker compose stop'
alias dce='docker compose exec'
alias dcps='docker compose ps'
alias dcpl='docker compose pull'

# --- MANAGEMENT ---
alias dst='docker start'
alias dsp='docker stop'
alias drs='docker restart'
alias dip='docker inspect'

# --- SYSTEM ---
alias dsy='docker system'
alias dsypr='docker system prune'

# --- HELP ---
alias lda='"${XDG_CONFIG_HOME:-$HOME/.config}/docker-lda/docker-lda-help.sh"'
