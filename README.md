1. Jellyfin

```bash
sudo docker run -d \
    --name jellyfin \
    -p 8096:8096 \
    --net=host \
    --volume jellyfin-config:/config \
    --volume jellyfin-cache:/cache \
    --mount type=bind,source=/home/topkek/media,target=/media \
    --mount type=bind,source=/data,target=/data \
    --restart=unless-stopped \
    jellyfin/jellyfin
```
docker volume create jellyseer-config

```bash
sudo docker run -d \
    --name jellyseerr \
    -p 5055:5055 \
    -v /opt/jellyseerr:/app/config \
    --restart unless-stopped \
    fallenbagel/jellyseerr:latest
 ```

sudo chown -R 1001:1001 /data
sudo chmod 0755 -R /data

 ```bash
 sudo docker rm prowlarr qbittorrent sonarr radarr

sudo docker run -d \
    --name prowlarr \
    --net=host \
    -p 9696:9696 \
    -e PUID=1001 \
    -e PGID=1001 \
    -e UMASK=002 \
    -e TZ="Etc/UTC" \
    -v /data/prowlarr:/config \
    --restart unless-stopped \
    ghcr.io/hotio/prowlarr

docker run -d \
  --name=flaresolverr \
  --net=host \
  -p 8191:8191 \
  -e LOG_LEVEL=info \
  --restart unless-stopped \
  ghcr.io/flaresolverr/flaresolverr:latest
(
sudo docker run -d \
  --name=qbittorrent \
  --net=host \
  -e PUID=1001 \
  -e PGID=1001 \
  -e TZ=Etc/UTC \
  -e WEBUI_PORT=8081 \
  -e TORRENTING_PORT=6881 \
  -p 8081:8081 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -v /data/qbittorrent:/appdata/config \
  -v /data/torrents:/data/torrents \
  --restart unless-stopped \
  lscr.io/linuxserver/qbittorrent:latest

sudo docker run -d \
    --name=sonarr \
    --net=host \
    -e PUID=1001 \
    -e PGID=1001 \
    -e TZ=Etc/UTC \
    -p 8989:8989 \
    -v /data/sonarr:/config \
    -v /data:/data \
    --restart unless-stopped \
    lscr.io/linuxserver/sonarr:latest

sudo docker run -d \
    --name=radarr \
    --net=host \
    -e PUID=1001 \
    -e PGID=1001 \
    -e TZ=Etc/UTC \
    -p 7878:7878 \
    -v /data/radarr:/config \
    -v /data:/data \
    --restart unless-stopped \
    lscr.io/linuxserver/radarr:latest
)
 ```


2. Traefik

```bash
sudo docker run -d \
    --name traefik \
    -p 8080:8080 \
    -p 80:80 \
    -v $PWD/traefik.yml:/etc/traefik/traefik.yml \
    traefik:v3.0
```

3. Penpot

wget https://raw.githubusercontent.com/penpot/penpot/main/docker/images/docker-compose.yaml


ctrl z
bg
disown

ps aux |grep python
reptyr $PID



mkdir -p ~/minio/data

docker run \
   -p 9000:9000 \
   -p 9001:9001 \
   --name minio \
   -v ~/minio/data:/data \
   -e "MINIO_ROOT_USER=ROOTNAME" \
   -e "MINIO_ROOT_PASSWORD=CHANGEME123" \
   quay.io/minio/minio server /data --console-address ":9001"


docker run -d \
    --name=vault \
    --restart unless-stopped \
    --cap-add=IPC_LOCK \
    -e 'VAULT_LOCAL_CONFIG={"storage": {"file": {"path": "/vault/file"}}, "listener": [{"tcp": { "address": "0.0.0.0:8200", "tls_disable": true}}], "default_lease_ttl": "168h", "max_lease_ttl": "720h", "ui": true}' \
    -p 8200:8200 \
    hashicorp/vault server
