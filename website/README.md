docker volume create amasearch-firebase-auth
docker build -t temp -f .\Dockerfile_release .
docker run -it --rm -v amasearch-firebase-auth:/root/.config temp sh
firebase login --no-localhost