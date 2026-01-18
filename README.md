# Nimbus IDP — Internal Developer Platform

Nimbus is a portfolio and learning Internal Developer Platform (IDP) built to demonstrate real-world Platform Engineering practices using Kubernetes, GitOps, and observability tooling. The goal of Nimbus is clarity, visibility, and correct platform boundaries — not abstraction-heavy magic.

Nimbus connects existing best-in-class tools into a single, opinionated platform workflow.

What Nimbus is:
- A lightweight Internal Developer Platform
- GitOps-driven (Git as the single source of truth)
- Kubernetes-first by design
- A practical platform engineering portfolio project

What Nimbus is not:
- A full developer portal (Backstage-style)
- A managed PaaS
- A replacement for Kubernetes knowledge

Platform principles:
- Kubernetes-first
- Git as the single source of truth
- Opinionated defaults over flexibility
- Designed to scale from single-node k3s to managed Kubernetes (EKS)

Tech stack:
- AWS EC2
- k3s (Kubernetes)
- Terraform
- Argo CD (GitOps continuous delivery)
- GitHub Actions (CI)
- Prometheus (metrics collection)
- Grafana (metrics visualization)
- Traefik Ingress (traffic routing)

Nimbus flow:
1. Developers push code to GitHub
2. GitHub Actions builds images and/or updates manifests
3. Argo CD detects changes and syncs desired state
4. Applications run on the Kubernetes cluster
5. Prometheus collects node and workload metrics
6. Grafana visualizes system and cluster health
7. Services are documented in the Nimbus Service Catalog

Git remains the single source of truth.

Repository structure:
.
├── apps/                          # Application manifests (GitOps)
│   └── demo-app/
├── observability/                 # Prometheus & Grafana stack
├── service-catalog/
│   ├── index.html                 # Lightweight catalog UI
│   └── services/
│       └── <service-name>/
│           └── service.yaml       # Service metadata (source of truth)
├── images/                        # Screenshots for documentation
└── README.md

Nimbus Service Catalog:
Nimbus includes a lightweight, Git-backed Service Catalog that provides a single place to discover services running on the platform. The catalog is read-only for developers and focused on visibility rather than provisioning.

Service definitions are stored in Git at:
service-catalog/services/*/service.yaml

Each service definition captures ownership, lifecycle, namespace, repository, and links to operational tooling such as Argo CD, Grafana, and Prometheus.

Dashboards:
Nimbus does not introduce custom dashboards. Existing platform tools are the interface.

Argo CD:
Argo CD acts as the GitOps control plane and is used to inspect application health, resource trees, sync status, and rollback history.

Access Argo CD:
kubectl -n argocd port-forward svc/argocd-server 8080:443
Open http://localhost:8080

Grafana:
Grafana provides observability into node resources, Kubernetes workloads, and networking metrics using Prometheus as a data source.

Access Grafana:
kubectl -n observability port-forward svc/prometheus-grafana 3000:80
Open http://localhost:3000

Preloaded dashboards include:
- Node Resource Overview
- Kubernetes Networking
- Kubernetes Workloads

Prometheus:
Prometheus is used strictly as the metrics backend and is not intended for direct developer usage.

Status:
Nimbus is an intentionally minimal but complete MVP demonstrating GitOps workflows, platform layering, operational visibility, and service ownership modeling. Future improvements may include environment promotion, alerting and SLOs, and richer service metadata.

Author:
Built by Temple Osaroejiji
Cloud / DevOps / Platform Engineering
