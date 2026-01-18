# Nimbus — Internal Developer Platform (IDP)

Nimbus is a Kubernetes-based Internal Developer Platform designed to provide
a simple, opinionated "golden path" for deploying and operating applications
using GitOps principles.

---

## Goals (Nimbus v1)

- Self-service application deployment (API or web)
- Standard CI/CD pipeline
- GitOps-based delivery
- Basic observability and logging
- Simple service catalog (planned)

---

## Platform Principles

- Kubernetes-first
- Git as the source of truth
- Opinionated defaults over flexibility
- Designed to scale from single-node k3s to EKS

---

## Architecture Overview

Nimbus is built around Kubernetes and GitOps, bringing deployment and
observability into a single platform.

Core components:

- Kubernetes (k3s) as the runtime platform
- Argo CD for GitOps-based continuous delivery
- Prometheus for metrics collection
- Grafana for dashboards and visualization
- GitHub Actions for CI
- Traefik Ingress for traffic routing

---
## Architecture

Nimbus follows a GitOps-driven platform architecture built on Kubernetes.

📐 **Nimbus architecture diagram:**  
👉 [View Nimbus Architecture](docs/architecture.md)

This diagram shows how:
- Developers push code to GitHub
- CI pipelines build and update manifests
- Argo CD synchronizes desired state to Kubernetes
- Applications and observability run on the cluster
- The Nimbus Service Catalog provides a single discovery layer

---
## Architecture

Nimbus is built as a lightweight Internal Developer Platform using a layered architecture.

**Layers:**

- **Infrastructure Layer**
  - AWS EC2 hosts the Kubernetes (k3s) cluster.
  - This layer is abstracted away from application developers.

- **Platform Layer**
  - Kubernetes provides the execution environment.
  - Argo CD acts as the GitOps control plane, syncing desired state from Git.
  - Traefik handles ingress traffic into the cluster.

- **Observability Layer**
  - Prometheus collects metrics from nodes and Kubernetes components.
  - Grafana visualizes metrics through predefined dashboards.

- **Service Catalog**
  - Service metadata is stored in Git under `service-catalog/`.
  - Each service entry defines ownership, lifecycle, Git source, Kubernetes resources, and operational links.

---

## How Nimbus Works

1. Developers push application code to GitHub
2. GitHub Actions builds images and updates manifests
3. Argo CD detects changes and syncs them to Kubernetes
4. Prometheus collects metrics from nodes and workloads
5. Grafana visualizes system and cluster health

Git remains the single source of truth.

---

## Observability

Nimbus provides basic observability out of the box:

- Node CPU usage
- Node memory availability
- Disk usage
- Kubernetes system metrics

Grafana dashboards offer a Node Resource Overview for
monitoring cluster health.

---
## Service Catalog

Nimbus includes a lightweight **Service Catalog** that provides a single place to discover services running on the platform.

The catalog is:
- **Git-backed** (YAML as the source of truth)
- **Auto-updated via GitOps**
- **Read-only for developers**
- **Focused on visibility, not provisioning**

Each service entry describes:
- Ownership and lifecycle
- Kubernetes namespace and workloads
- Links to Argo CD, Grafana, and Prometheus
- Where the service is defined in Git

### Example Services
- `demo-app` – sample application deployed via Argo CD
- `observability-stack` – Prometheus and Grafana used by the platform

### How it works
1. Services are defined in Git under `service-catalog/services/*/service.yaml`
2. A simple static UI renders these definitions
3. Links point directly to live platform tools (Argo CD, Grafana, Prometheus)

The Service Catalog acts as a **discovery layer** on top of Kubernetes and GitOps.
---

## Tech Stack (v1)

- AWS EC2
- k3s (Kubernetes)
- Terraform
- Argo CD (GitOps)
- GitHub Actions (CI)
- Prometheus
- Grafana
- Traefik Ingress (default with k3s)

---

## Demo App Deployment (Validation)

- Deployed `demo-app` using **Argo CD** following GitOps principles
- Kubernetes **Service** created to expose the application internally
- Application reachability validated using `kubectl port-forward`
- Successfully accessed the running application via browser (nginx welcome page)

This confirms:
- Argo CD is syncing application manifests correctly
- Kubernetes networking (Service → Pod) is working as expected
- The platform can deploy and expose workloads reliably

---

## Traffic Flow (Demo App)

This demo app is deployed via GitOps and exposed through Traefik Ingress.

**Flow:**
GitHub (manifests) → Argo CD (sync) → Kubernetes (Deploy/Service/Ingress) → Traefik (routes traffic) → demo-app pods

**What this proves:**
- GitOps is working (Argo CD syncs cluster state from Git)
- The app is reachable through an Ingress route (Traefik)
- Core K8s objects (Deployment/Service/Ingress) are managed declaratively

---

## Future Improvements

- Application templates
- Environment promotion workflows
- Alerting and SLOs
- Optional developer portal UI

---

## Screenshots

Screenshots are stored in `docs/screenshots/`.

- Argo CD Applications (Synced/Healthy)
- demo-app Argo CD resource graph (Ingress → Service → Pods)
- Grafana dashboards (Node + Kubernetes/Pod networking)
- Prometheus targets (exporters UP)
- demo-app working in browser (nginx page)
---

## Author

Built by Temple Osaroejiji  
Cloud / DevOps / Platform Engineering
