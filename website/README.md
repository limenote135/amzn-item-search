docker volume create amasearch-fiurebase-auth
docker build -t temp -f .\Dockerfile_release .
docker run -it --rm -v amasearch-fiurebase-auth:/root/.config temp sh
firebase login --no-localhost