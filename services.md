#

## SetUp CRDs

### Argo Rollouts

Controller installation - https://argoproj.github.io/argo-rollouts/installation/#controller-installation

```sh
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
```

Kubectl plugin installation - https://argoproj.github.io/argo-rollouts/installation/#kubectl-plugin-installation

### Argo Workfflows


Manifests installation

```sh
kubectl create namespace argo
kubectl apply -n argo -f https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/quick-start-postgres.yaml
```

And following https://towardsdatascience.com/creating-containerized-workflows-with-argo-ec1011b04370

```sh
kubectl port-forward -n argo svc/argo-server 2746:2746
```

```sh
open https://localhost:2746
```


### Vault - https://learn.hashicorp.com/tutorials/vault/kubernetes-raft-deployment-guide?in=vault/kubernetes

Just to play with secretGenerators inside kustomize

```sh
kubectl create namespace vault
helm template vault hashicorp/vault --namespace vault --include-crds > services/infrastructure/vault/base/install.yaml
kubectl apply -k services/infrastructure/vault/overlays/development
```

```sh
kubectl port-forward -n vault vault-0 8200:8200
```

```sh
open http://localhost:8200
```

### Istio

```sh
brew install istioctl
```

```sh
istioctl operator init
```

```sh
$> istioctl profile dump demo
```

We define the IstioOperator that we can apply to the cluster

```sh
$> kubectl apply -k services/infrastructure/istio/overlays/development
```

Check if it's working fine

```sh
$> kubectl get services -n istio-system
```

```sh
$> kubectl get pods -n istio-system
```

### kube-prometheus

Get customized manifests to start simple

```sh
git clone git clone https://github.com/prometheus-operator/kube-prometheus.git ~/dev/github/prometheus-operator/kube-prometheus
```

```sh
cp ~/dev/github/prometheus-operator/kube-prometheus/kustomization.yaml services/infrastructure/kube-prometheus/base
cp -R ~/dev/github/prometheus-operator/kube-prometheus/manifests/ services/infrastructure/kube-prometheus/base/manifests/
```

Install kustomized manifests

```sh
kubectl apply -f services/infrastructure/kube-prometheus/base/manifests/setup
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
kubectl apply -f services/infrastructure/kube-prometheus/base/manifests/
```
