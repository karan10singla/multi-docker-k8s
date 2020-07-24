docker build -t karan4336/multi-docker-client:latest -t karan4336/multi-docker-client:$SHA -f ./client/Dockerfile ./client
docker build -t karan4336/multi-docker-server:lates -t karan4336/multi-docker-server:$SHA -f ./server/Dockerfile ./server
docker build -t karan4336/multi-docker-worker:latest -t karan4336/multi-docker-worker:$SHA -f ./worker/Dockerfile ./worker

docker push karan4336/multi-docker-client:latest
docker push karan4336/multi-docker-server:latest
docker push karan4336/multi-docker-worker:latest


docker push karan4336/multi-docker-client:$SHA
docker push karan4336/multi-docker-server:$SHA
docker push karan4336/multi-docker-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=karan4336/multi-docker-client:$SHA
kubectl set image deployments/server-deployment server=karan4336/multi-docker-server:$SHA
kubectl set image deployments/worker-deployment worker=karan4336/multi-docker-worker:$SHA