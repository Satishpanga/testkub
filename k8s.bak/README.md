
# 🚀 Fullstack App Deployment on Kubernetes (Original Setup)

This Kubernetes setup deploys a **frontend** and **backend** application as two separate Pods, each managed by its own Deployment and exposed via individual NodePort Services. Ingress is used to route external traffic based on subdomain hostnames.

---

## 📁 Project Structure

```bash
k8s/
├── backend-deployment.yaml     # Deployment for backend app
├── backend-service.yaml        # NodePort service for backend
├── configmap.yaml              # Contains frontend/backend URLs as env vars
├── frontend-deployment.yaml    # Deployment for frontend app
├── frontend-service.yaml       # NodePort service for frontend
├── ingress.yaml                # Ingress routing using host-based rules
├── namespace.yaml              # Custom namespace definition
````

---

## 🗂️ Prerequisites

* A running Kubernetes cluster (e.g., Minikube, Kind, EKS, etc.)
* NGINX Ingress controller or other Ingress controller installed
* DNS entries or `/etc/hosts` entries pointing to your cluster Node IP:

  * `f.ai4devops.online` → `<NodeIP>`
  * `b.ai4devops.online` → `<NodeIP>`
* Docker images:

  * `pangasathish/my-frontend:latest`
  * `pangasathish/my-backend:latest`

---

## 🚀 Deployment Steps

1. **Create Namespace**

```bash
kubectl apply -f namespace.yaml
```

2. **Create ConfigMap**

```bash
kubectl apply -f configmap.yaml
```

3. **Deploy Backend**

```bash
kubectl apply -f backend-deployment.yaml
kubectl apply -f backend-service.yaml
```

4. **Deploy Frontend**

```bash
kubectl apply -f frontend-deployment.yaml
kubectl apply -f frontend-service.yaml
```

5. **Configure Ingress**

```bash
kubectl apply -f ingress.yaml
```

---

## 🌐 Accessing the App

| Component | URL                                                    | Notes                             |
| --------- | ------------------------------------------------------ | --------------------------------- |
| Frontend  | [http://f.ai4devops.online](http://f.ai4devops.online) | Routed to `frontend-service:3000` |
| Backend   | [http://b.ai4devops.online](http://b.ai4devops.online) | Routed to `backend-service:5000`  |

> Ensure your local DNS (or `/etc/hosts`) points both domains to the cluster's Node IP.

---

## 📦 Components Overview

### ConfigMap (`configmap.yaml`)

Used to inject hostnames as environment variables into both deployments.

```yaml
data:
  frontend: f.ai4devops.online
  backend: b.ai4devops.online
```

### Backend Deployment

* Runs on port `5000`
* Env var: `BACKEND_URL` (from ConfigMap)

### Frontend Deployment

* Runs on port `3000`
* Env var: `FRONTEND_URL` (from ConfigMap)

### Services

* `frontend-service`: Exposes frontend on NodePort `30300`
* `backend-service`: Exposes backend on NodePort `30500`

---

## 🧪 Validation Commands

```bash
kubectl get all -n my-namespace
kubectl describe ingress app-ingress -n my-namespace
```

---

## 🔧 Customization Options

* **Scaling**: Modify `replicas` in the deployment files.
* **TLS Support**: Can be added to Ingress via cert-manager or manual secret.
* **Health Checks**: Add `livenessProbe` and `readinessProbe` per container.
* **Port Mapping**: NodePort ranges can be customized (30000–32767).

---

## 🧹 Cleanup

To remove all resources:

```bash
kubectl delete -f ingress.yaml
kubectl delete -f frontend-service.yaml
kubectl delete -f frontend-deployment.yaml
kubectl delete -f backend-service.yaml
kubectl delete -f backend-deployment.yaml
kubectl delete -f configmap.yaml
kubectl delete -f namespace.yaml
```

---

## 👤 Author

* Managed by: **SATISH PANGA / Team: DevOps**
* Container Images:

  * Frontend: `pangasathish/my-frontend:latest`
  * Backend: `pangasathish/my-backend:latest`

---

To delete all:

kubectl delete ingress app-ingress -n my-namespace
kubectl delete deployment backend-deployment frontend-deployment -n my-namespace
kubectl delete service backend-service frontend-service -n my-namespace
kubectl delete configmap app-config -n my-namespace


verify:

kubectl get all -n my-namespace
kubectl get ingress -n my-namespace
