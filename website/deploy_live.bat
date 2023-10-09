COPY /Y .\env_files\robots.live.txt .\public\robots.txt
COPY /Y .env.live.production .env.production
COPY /Y .\src\plugin\firebaseAuth.live.json .\src\plugin\firebaseAuth.json
COPY /Y sentry.live.properties sentry.properties

docker compose -f .\docker-compose.release.yml -f .\docker-compose.release.live.yml up --build --force-recreate --remove-orphans
docker ps -a
pause
