#

## SetUp CRDs

### Argo Rollouts

Controller installation - https://argoproj.github.io/argo-rollouts/installation/#controller-installation

```sh
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
```

Kubectl plugin installation - https://argoproj.github.io/argo-rollouts/installation/#kubectl-plugin-installation
