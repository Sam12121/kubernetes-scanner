# Helm chart for Toae Kubernetes Scanner

### Install

```shell
helm repo add toae-k8s-scanner https://toae-helm-charts.s3.amazonaws.com/toae-k8s-scanner
```

```shell
helm show values toae-k8s-scanner/toae-k8s-scanner
helm show readme toae-k8s-scanner/toae-k8s-scanner
```

```shell
helm install toae-k8s-scanner toae-k8s-scanner/toae-k8s-scanner \
    --set managementConsoleUrl="40.40.40.40" \
    --set toaeKey="xxxxx" \
    --set clusterName="prod-cluster" \
    --namespace toae-k8s-scanner \
    --create-namespace
```
