docker compose -f .\docker-compose.release.yml -f .\docker-compose.release.stg.yml up --build --force-recreate --remove-orphans
docker ps -a
pause
