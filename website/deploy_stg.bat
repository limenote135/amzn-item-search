COPY /Y .\env_files\robots.stg.txt .\public\robots.txt
COPY /Y .env.stg.production .env.production
COPY /Y .\src\plugin\firebaseAuth.stg.json .\src\plugin\firebaseAuth.json
COPY /Y sentry.stg.properties sentry.properties

docker compose -f .\docker-compose.release.yml -f .\docker-compose.release.stg.yml up --build --force-recreate --remove-orphans
docker ps -a
pause
