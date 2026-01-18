flowchart TD
    Dev[Developer] --> Git[GitHub Repo]

    Git --> CI[GitHub Actions (CI)]
    CI --> Git

    Git --> Argo[Argo CD (GitOps)]
    Argo --> K8s[Kubernetes Cluster (k3s)]

    K8s --> App[Application Workloads]
    K8s --> Obs[Observability Stack]

    Obs --> Prom[Prometheus]
    Obs --> Graf[Grafana]

    Git --> Catalog[Nimbus Service Catalog]
    Catalog --> Argo
    Catalog --> Graf
    Catalog --> Prom
