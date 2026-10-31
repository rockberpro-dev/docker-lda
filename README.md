<p align="center">
  <img src="resources/img/logo.png" alt="docker-lda" width="200">
</p>

<h1 align="center">Logical Docker Aliases</h1>

<p align="center">A curated set of short, memorable Docker aliases organized by category.</p>

## Install

**Linux / macOS / WSL:**

```bash
curl -sL https://raw.githubusercontent.com/rockberpro-dev/docker-lda/main/setup.sh | bash
```

**Windows (PowerShell):**

```powershell
iwr -useb https://raw.githubusercontent.com/rockberpro-dev/docker-lda/main/setup.ps1 | iex
```

Then reload your shell (`source ~/.bashrc` on Bash, `. $PROFILE` on PowerShell).

The script copies the files to `~/.config/docker-lda/` and adds a single source line to your shell profile.

Manual install, upgrade and uninstall: [GUIDE.md](GUIDE.md).

## How It Reads

Two-letter **prefix** picks the command. One-letter **suffix** is the first letter of the subcommand or flag.

```
dpl   → docker pull            dps   → docker ps
dpu   → docker push            dpsa  → docker ps -a
dbl   → docker build           drm   → docker rm
drn   → docker run             drmf  → docker rm -f
drni  → docker run -it         dex   → docker exec
                               dexi  → docker exec -it

dlg   → docker logs            dim   → docker image
dlgf  → docker logs -f         dils  → docker image ls
                                dirm  → docker image rm
dv    → docker volume          dipr  → docker image prune
dvls  → docker volume ls       dtg   → docker tag
dvrm  → docker volume rm       dsy   → docker system
dvpr  → docker volume prune     dsypr → docker system prune

dn    → docker network
dnls  → docker network ls
dnrm  → docker network rm
dnpr  → docker network prune
```

```
dc    → docker compose         dst   → docker start
dcu   → docker compose up      dsp   → docker stop
dcud  → docker compose up -d   drs   → docker restart
dcd   → docker compose down    dip   → docker inspect
dcb   → docker compose build
dcl   → docker compose logs
dclf  → docker compose logs -f
dcr   → docker compose restart
dcs   → docker compose stop
dce   → docker compose exec
dcps  → docker compose ps
dcpl  → docker compose pull
```

Run `lda` to see every alias right in your terminal:

```
╔═════════════════════════════════════════════════╗
║                Docker Aliases                   ║
╠═════════════════════════════════════════════════╣
║ ── Pull / Run ──                                ║
║ dpl    │ docker pull                            ║
║ drn    │ docker run                             ║
║ drni   │ docker run -it                         ║
║ ── Container ──                                 ║
║ dps    │ docker ps                              ║
║ dpsa   │ docker ps -a                           ║
║         ...                                     ║
╚═════════════════════════════════════════════════╝
  45 aliases across 10 groups
```

## Alias Reference

| Alias   | Command                    | Group       |
| ------- | -------------------------- | ----------- |
| `dpl`   | `docker pull`              | Pull / Run  |
| `dpu`   | `docker push`              | Pull / Run  |
| `dbl`   | `docker build`             | Pull / Run  |
| `drn`   | `docker run`               | Pull / Run  |
| `drni`  | `docker run -it`           | Pull / Run  |
| `dps`   | `docker ps`                | Container   |
| `dpsa`  | `docker ps -a`             | Container   |
| `drm`   | `docker rm`                | Container   |
| `drmf`  | `docker rm -f`             | Container   |
| `dex`   | `docker exec`              | Container   |
| `dexi`  | `docker exec -it`          | Container   |
| `dlg`   | `docker logs`              | Logs        |
| `dlgf`  | `docker logs -f`           | Logs        |
| `dim`   | `docker image`             | Image       |
| `dils`  | `docker image ls`          | Image       |
| `dirm`  | `docker image rm`          | Image       |
| `dipr`  | `docker image prune`       | Image       |
| `dtg`   | `docker tag`               | Image       |
| `dv`    | `docker volume`            | Volume      |
| `dvls`  | `docker volume ls`         | Volume      |
| `dvrm`  | `docker volume rm`         | Volume      |
| `dvpr`  | `docker volume prune`      | Volume      |
| `dn`    | `docker network`           | Network     |
| `dnls`  | `docker network ls`        | Network     |
| `dnrm`  | `docker network rm`        | Network     |
| `dnpr`  | `docker network prune`     | Network     |
| `dc`    | `docker compose`           | Compose     |
| `dcu`   | `docker compose up`        | Compose     |
| `dcud`  | `docker compose up -d`     | Compose     |
| `dcd`   | `docker compose down`      | Compose     |
| `dcb`   | `docker compose build`     | Compose     |
| `dcl`   | `docker compose logs`      | Compose     |
| `dclf`  | `docker compose logs -f`   | Compose     |
| `dcr`   | `docker compose restart`   | Compose     |
| `dcs`   | `docker compose stop`      | Compose     |
| `dce`   | `docker compose exec`      | Compose     |
| `dcps`  | `docker compose ps`        | Compose     |
| `dcpl`  | `docker compose pull`      | Compose     |
| `dst`   | `docker start`             | Management  |
| `dsp`   | `docker stop`              | Management  |
| `drs`   | `docker restart`           | Management  |
| `dip`   | `docker inspect`           | Management  |
| `dsy`   | `docker system`            | System      |
| `dsypr` | `docker system prune`      | System      |
| `lda`   | show alias table           | Help        |

---

[GUIDE.md](GUIDE.md) · [CHANGELOG.md](CHANGELOG.md) · [setup.sh](setup.sh) · [docker-lda.sh](docker-lda.sh) · [docker-lda-help.sh](docker-lda-help.sh) · [setup.ps1](setup.ps1) · [docker-lda.ps1](docker-lda.ps1) · [docker-lda-help.ps1](docker-lda-help.ps1)
