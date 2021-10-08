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
