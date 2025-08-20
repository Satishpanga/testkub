
# 🚀 Fullstack App Deployment on Kubernetes

This project deploys a fullstack application (frontend + backend) on a Kubernetes cluster using a **single Pod** containing both containers. The setup includes:

- Combined Deployment (`frontend + backend`)
- Combined NodePort Service
- Ingress routing for frontend and backend
- ConfigMap-based environment configuration
- Custom namespace

---

## 📁 Project Structure

```bash
k8s/
├── configmap.yaml              # Contains frontend and backend URLs
├── fullstack-deployment.yaml  # Unified Deployment with both containers
├── fullstack-service.yaml     # NodePort service exposing both frontend and backend
├── namespace.yaml             # Custom namespace definition
├── updated-ingress.yaml       # Ingress routing based on subdomains
````

---

## 🗂️ Prerequisites

* Kubernetes cluster (Minikube, Kind, or production)
* Ingress Controller (e.g., NGINX Ingress installed)
* kubectl configured to access your cluster
* DNS or `/etc/hosts` entries for:

  * `f.ai4devops.online` → `<NodeIP>`
  * `b.ai4devops.online` → `<NodeIP>`

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

3. **Deploy Application (Frontend + Backend in One Pod)**

```bash
kubectl apply -f fullstack-deployment.yaml
```

4. **Create Combined Service**

```bash
kubectl apply -f fullstack-service.yaml
```

5. **Configure Ingress**

Make sure your ingress controller is installed, then:

```bash
kubectl apply -f updated-ingress.yaml
```

---

## 🌐 Accessing the App

| Component | URL                                                    | Notes                                  |
| --------- | ------------------------------------------------------ | -------------------------------------- |
| Frontend  | [http://f.ai4devops.online](http://f.ai4devops.online) | Routed to port `3000` in fullstack pod |
| Backend   | [http://b.ai4devops.online](http://b.ai4devops.online) | Routed to port `5000` in fullstack pod |

> Make sure DNS or `/etc/hosts` routes the above domains to your cluster's Node IP.

---

## 🧪 Validation

Check everything is running:

```bash
kubectl get all -n my-namespace
kubectl describe ingress app-ingress -n my-namespace
```

---

## 🔧 Customization

* **Scaling**: Currently set to 1 replica; not ideal for high availability.
* **TLS**: Ingress supports HTTPS with cert-manager or manual secrets (not included here).
* **Readiness/Liveness Probes**: Recommended for production; can be added per container.
* **Logging**: Both containers share the same Pod logs. Use container name filtering for clarity.

---

## 📌 Notes

* The backend and frontend share the same Pod and network namespace (can communicate via `localhost`).
* Services are exposed using NodePorts `30300` (frontend) and `30500` (backend).
* Ingress routes external traffic to the appropriate container port inside the Pod.

---

## 🧹 Cleanup

To remove everything:

```bash
kubectl delete -f updated-ingress.yaml
kubectl delete -f fullstack-service.yaml
kubectl delete -f fullstack-deployment.yaml
kubectl delete -f configmap.yaml
kubectl delete -f namespace.yaml
```

---

## 👤 Author

* Managed by: **SATISH PANGA / Team: DevOps**
* Images from DockerHub: `pangasathish/my-frontend:latest`, `pangasathish/my-backend:latest`

---

Deploy all at once:

kubectl apply -f namespace.yaml
kubectl apply -f configmap.yaml
kubectl apply -f fullstack-deployment.yaml
kubectl apply -f fullstack-service.yaml
kubectl apply -f updated-ingress.yaml



Verify:

kubectl get all -n my-namespace
kubectl describe ingress app-ingress -n my-namespace
