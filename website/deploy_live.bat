docker compose -f .\docker-compose.release.yml -f .\docker-compose.release.live.yml up --build --force-recreate --remove-orphans
docker ps -a
pause
