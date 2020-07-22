docker build -t karan4336/multi-docker-client -f ./client/Dockerfile ./client
docker build -t karan4336/multi-docker-server -f ./server/Dockerfile ./server
docker build -t karan4336/multi-docker-worker -f ./worker/Dockerfile ./worker

docker push karan4336/multi-docker-client
docker push karan4336/multi-docker-server
docker push karan4336/multi-docker-worker

kubectl apply -f k8s

kubectl set image 