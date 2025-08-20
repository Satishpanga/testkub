# My-Fullstack Helm Chart

This Helm chart deploys a fullstack application consisting of a frontend and backend running inside a single Kubernetes Pod. It includes LoadBalancer service and ingress configurations for your domains.

***

## Prerequisites

- Kubernetes cluster with access configured via `kubectl`
- Helm 3 installed on your local machine or CI
- Docker images for frontend (`pangasathish/my-frontend`) and backend (`pangasathish/my-backend`) pushed to a container registry
- MetalLB (or suitable LoadBalancer) installed on your cluster
- NGINX ingress controller deployed if using ingress

***

## Directory Structure

```
my-frontend/
├── Chart.yaml
├── values.yaml
└── templates/
    ├── deployment.yaml
    ├── service.yaml
    ├── ingress.yaml
    ├── _helpers.tpl
```

***

## Installation

1. **Create the target namespace**

```sh
kubectl create namespace my-namespace
```

2. **Install the chart**

```sh
helm install my-fullstack ./helm --namespace my-namespace
```

3. **Verify deployment**

```sh
kubectl get all -n my-namespace
kubectl get svc -n my-namespace
```

4. **Test access**

- Frontend:  
  ```sh
  curl http://:3000
  ```
- Backend:  
  ```sh
  curl http://:5000
  ```

Or use your ingress domains in the browser:

- http://f.ai4devops.online  
- http://b.ai4devops.online

***

## Upgrading the Application

After making changes (e.g., updating image tags or chart templates):

```sh
helm upgrade my-fullstack ./helm --namespace my-namespace
```

***

## Uninstalling

```sh
helm uninstall my-fullstack --namespace my-namespace
kubectl delete namespace my-namespace
```

***

## Customizing the Chart

Edit `values.yaml` to adjust:

- Image repositories and tags  
- Service LoadBalancer type and ports  
- Ingress hosts and class name  
- Replica count  
- Resource requests and limits (optional)

***

## Troubleshooting

- Use `kubectl logs` to check pod logs.
- Check ingress controller logs if ingress routes fail.
- Use `helm uninstall` and `helm install` to reset resources if needed.

***

## References

- [Helm Official Documentation](https://helm.sh/docs/)
- [Kubernetes Official Documentation](https://kubernetes.io/docs/home/)
- [MetalLB Documentation](https://metallb.universe.tf/)

***

