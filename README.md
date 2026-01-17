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
- NGINX Ingress for traffic routing

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

## What Nimbus Is (and Is Not)

Nimbus is:
- A lightweight Internal Developer Platform
- A GitOps-driven deployment system
- A foundation for platform engineering practices

Nimbus is not:
- A full developer portal UI
- A managed PaaS
- A replacement for Kubernetes knowledge

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

## Future Improvements

- Service catalog
- Application templates
- Environment promotion workflows
- Alerting and SLOs
- Optional developer portal UI

---

## Status

Nimbus is a portfolio and learning project demonstrating
platform engineering, GitOps workflows, Kubernetes operations,
and observability fundamentals.

---

## Author

Built by Temple Osaroejiji  
Cloud / DevOps / Platform Engineering
