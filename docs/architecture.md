# Nimbus Architecture

```mermaid
flowchart TD
    Dev[Developer] --> Git[GitHub Repo]

    Git --> CI[GitHub Actions<br/>(CI)]
    CI --> Git

    Git --> Argo[Argo CD<br/>(GitOps)]
    Argo --> K8s[Kubernetes Cluster<br/>(k3s)]

    K8s --> App[Application Workloads]
    K8s --> Obs[Observability Stack]

    Obs --> Prom[Prometheus]
    Obs --> Graf[Grafana]

    Git --> Catalog[Nimbus Service Catalog]
    Catalog --> Argo
    Catalog --> Graf
    Catalog --> Prom
