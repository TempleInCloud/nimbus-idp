# Nimbus — Internal Developer Platform (IDP)

Nimbus is a Kubernetes-based Internal Developer Platform designed to provide
a simple, opinionated “golden path” for deploying and operating applications.

## Goals (Nimbus v1)
- Self-service application deployment (API or web)
- Standard CI/CD pipeline
- GitOps-based delivery
- Basic observability and logging
- Simple service catalog

## Platform Principles
- Kubernetes-first
- Git as the source of truth
- Opinionated defaults over flexibility
- Designed to scale from single-node k3s to EKS

## Tech Stack (v1)
- AWS EC2
- k3s (Kubernetes)
- Terraform
- Argo CD (GitOps)
- GitHub Actions
- NGINX Ingress
