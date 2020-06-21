kubectl apply -f https://raw.githubusercontent.com/hobby-kube/manifests/master/storage/00-namespace.yml
kubectl apply -f https://raw.githubusercontent.com/hobby-kube/manifests/master/storage/operator.yml
kubectl apply -f https://raw.githubusercontent.com/hobby-kube/manifests/master/storage/cluster.yml

wait_for_it kubectl -n rook get pods

kubectl apply -f https://raw.githubusercontent.com/hobby-kube/manifests/master/storage/storageclass.yml
kubectl apply -f https://raw.githubusercontentcom/hobby-kube/manifests/master/storage/tools.yml