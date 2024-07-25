# tock

A helm chart for Tock. Tock is an open conversational AI platform. It's a complete solution to build conversational agents aka bots.Tock can integrate and experiment with both classic and Generative AI (LLM, RAG) models

![Version: 0.4.3](https://img.shields.io/badge/Version-0.4.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 24.3.4](https://img.shields.io/badge/AppVersion-24.3.4-informational?style=flat-square)

## DLDR

To install the chart with the release name `my-release`:

```console
$ helm registry login -u myuser registry.hub.docker.com
$ helm install my-release  oci://registry.hub.docker.com/onelans/tock --version 0.4.2
```

## Introduction

This chart helps to setup a Tock environnement.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mongodb | 13.6.8 |
| https://opensearch-project.github.io/helm-charts/ | opensearch | 2.21.0 |
| https://opensearch-project.github.io/helm-charts/ | opensearch-dashboards | 2.19.0 |

## Sections

This creates values, but sectioned into own section tables if a section comment is provided.

## Values

### adminWeb

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| adminWeb.affinity | object | `{}` | affinity |
| adminWeb.authCongifMap | string | `""` | Authentification configurations, set confimap name. cf README to have a sample. |
| adminWeb.containerSecurityContext.enabled | bool | `true` | Configure containers' Security Context ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod |
| adminWeb.containerSecurityContext.runAsGroup | int | `99` | Run as group id |
| adminWeb.containerSecurityContext.runAsNonRoot | bool | `true` | Run as non root |
| adminWeb.containerSecurityContext.runAsUser | int | `99` | Run as user id |
| adminWeb.environment.botadminverticle_base_href | string | `""` | Have to be set if tock studio is deployed as subdomain https://sssss/tockstudio |
| adminWeb.environment.botadminverticle_body_limit | string | `"-1"` | botadminverticle_body_limit |
| adminWeb.environment.tock_default_log_level | string | `"info"` | log level |
| adminWeb.environment.tock_env | string | `"false"` | tock_env |
| adminWeb.environment.tock_https_env | string | `"prod"` | Environment |
| adminWeb.image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ e.g: pullSecrets:   - myRegistryKeySecretName |
| adminWeb.image.registry | string | `"docker.io"` | Docker image registry |
| adminWeb.image.repository | string | `"tock/bot_admin"` | Docker docker image name |
| adminWeb.image.tag | string | `"24.3.4"` | Docker image tag |
| adminWeb.ingress.annotations | object | `{}` | ingress annotations annotations:  kubernetes.io/ingress.class: traefik  kubernetes.io/ingress.class: nginx  kubernetes.io/tls-acme: "true" |
| adminWeb.ingress.deprecated | bool | `false` | set to true for deployement on cluster version < 1.19 (apiVersion: networking.k8s.io/v1beta1 vs apiVersion: networking.k8s.io/v1) |
| adminWeb.ingress.enabled | bool | `true` | enable the ingress |
| adminWeb.ingress.path | string | `"/"` | ingress path |
| adminWeb.ingress.tls | list | `[]` | TLS secrets and which hosts they sould be use for  - secretName: chart-example-tls    hosts:      - chart-example.local |
| adminWeb.nodeSelector | object | `{}` | node selector |
| adminWeb.podSecurityContext.enabled | bool | `true` | Configure Pod Security Context |
| adminWeb.podSecurityContext.fsGroup | int | `99` | fsGroup |
| adminWeb.podSecurityContext.sysctls | list | `[]` | sysctls |
| adminWeb.replicas | int | `1` | Replication settings, should be = 1 in production |
| adminWeb.resources.limits | object | `{}` | resources limits |
| adminWeb.resources.requests | object | `{}` | resources requests |
| adminWeb.service.port | int | `8080` | kubernetes service port |
| adminWeb.service.type | string | `"ClusterIP"` | kubernetes service type |
| adminWeb.tolerations | list | `[]` | tolerations |

### botApi

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| botApi.affinity | object | `{}` | affinity |
| botApi.containerSecurityContext.enabled | bool | `true` | Configure Container Security Context ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod |
| botApi.containerSecurityContext.runAsGroup | int | `99` | Run as Group id |
| botApi.containerSecurityContext.runAsNonRoot | bool | `true` | Run as non root |
| botApi.containerSecurityContext.runAsUser | int | `99` | Run as user id |
| botApi.environment.tock_api_timout_in_s | string | `"10"` | Timeout in seconds for websocket service, default is 10 |
| botApi.environment.tock_bot_api_timeout_in_ms | string | `"5000"` | Timeout in milliseconds for webhook service, default is 5000 |
| botApi.environment.tock_default_log_level | string | `"info"` | bot api log level |
| botApi.environment.tock_env | string | `"integ"` | tock environment (prod, dev, integ) |
| botApi.environment.tock_web_enable_markdown | string | `"false"` | Enable markdown |
| botApi.environment.tock_web_sse | bool | `true` | Enable Server Sent Event |
| botApi.environment.tock_web_use_default_cors_handler | string | `"true"` | CORS handler |
| botApi.environment.tock_web_use_default_cors_handler_allowed_methods | string | `""` | CORS handler allowed methods Slould be set to "GET, POST, PUT, DELETE, OPTIONS, HEAD" |
| botApi.environment.tock_web_use_default_cors_handler_url | string | `"*"` | CORS handler URL |
| botApi.environment.tock_web_use_default_cors_handler_with_credentials | string | `"false"` | CORS handler with credentials |
| botApi.environment.tock_websocket_enabled | string | `"true"` | Enable websocket |
| botApi.image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ e.g: pullSecrets:   - myRegistryKeySecretName |
| botApi.image.registry | string | `"docker.io"` | Docker image registry |
| botApi.image.repository | string | `"tock/bot_api"` | Docker image name |
| botApi.image.tag | string | `"24.3.4"` | Docker image tag |
| botApi.ingress.annotations | object | `{}` | annotations: kubernetes.io/ingress.class: traefik kubernetes.io/ingress.class: nginx kubernetes.io/tls-acme: "true" |
| botApi.ingress.deprecated | bool | `false` | set to true for deployement on cluster version < 1.19 (apiVersion: networking.k8s.io/v1beta1 vs apiVersion: networking.k8s.io/v1) |
| botApi.ingress.enabled | bool | `true` | enable bot api the ingress |
| botApi.ingress.path | string | `"/"` | ingress path |
| botApi.ingress.tls | list | `[]` | TLS secrets and which hosts they sould be use for  - secretName: chart-example-tls    hosts:      - chart-example.local |
| botApi.nodeSelector | object | `{}` | node selector |
| botApi.podSecurityContext.enabled | bool | `true` | Configure Pod Security Context |
| botApi.podSecurityContext.fsGroup | int | `99` | fsGroup |
| botApi.podSecurityContext.sysctls | list | `[]` | sysctls |
| botApi.replicas | int | `1` | should be > 1 in production |
| botApi.resources | object | `{"limits":{},"requests":{}}` | botApi resource requests and limits ref: https://kubernetes.io/docs/user-guide/compute-resources/ |
| botApi.service.port | int | `8080` | kubernetes service port |
| botApi.service.type | string | `"ClusterIP"` | kubernetes service type |
| botApi.tolerations | list | `[]` | tolerations |

### buildWorker

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| buildWorker.affinity | object | `{}` | affinity |
| buildWorker.containerSecurityContext.enabled | bool | `true` | Configure Container Security Context ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod |
| buildWorker.containerSecurityContext.runAsGroup | int | `99` | Run as Group id |
| buildWorker.containerSecurityContext.runAsNonRoot | bool | `true` | Run as non root |
| buildWorker.containerSecurityContext.runAsUser | int | `99` | Run as user id |
| buildWorker.environment.JAVA_ARGS | string | `"-Xmx1g -XX:MaxMetaspaceSize=256m"` | JAVA_ARGS |
| buildWorker.environment.tock_default_log_level | string | `"info"` | log level |
| buildWorker.environment.tock_env | string | `"prod"` | tock environment (prod, dev, integ) |
| buildWorker.image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ e.g: pullSecrets:   - myRegistryKeySecretName |
| buildWorker.image.registry | string | `"docker.io"` | Docker image registry |
| buildWorker.image.repository | string | `"tock/build_worker"` | Docker image name |
| buildWorker.image.tag | string | `"24.3.4"` | Docker image tag |
| buildWorker.nodeSelector | object | `{}` | node selector |
| buildWorker.podSecurityContext.enabled | bool | `true` | Configure Pod Security Context |
| buildWorker.podSecurityContext.fsGroup | int | `99` | fsGroup |
| buildWorker.podSecurityContext.sysctls | list | `[]` | sysctls |
| buildWorker.resources | object | `{"limits":{},"requests":{}}` | buildWorker resource requests and limits ref: https://kubernetes.io/docs/user-guide/compute-resources/ |
| buildWorker.tolerations | list | `[]` | tolerations |

### Duckling

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| duckling.affinity | object | `{}` | affinity |
| duckling.containerSecurityContext.enabled | bool | `true` | Configure Container Security Context ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod |
| duckling.containerSecurityContext.runAsGroup | int | `99` | Run as Group id |
| duckling.containerSecurityContext.runAsNonRoot | bool | `true` | Run as non root |
| duckling.containerSecurityContext.runAsUser | int | `99` | Run as user id |
| duckling.environment.tock_default_log_level | string | `"info"` | log level |
| duckling.environment.tock_env | string | `"prod"` | tock environment (prod, dev, integ) |
| duckling.image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ e.g: pullSecrets:   - myRegistryKeySecretName |
| duckling.image.registry | string | `"docker.io"` | Docker image registry |
| duckling.image.repository | string | `"tock/duckling"` | Docker image name |
| duckling.image.tag | string | `"24.3.4"` | Docker image tag |
| duckling.nodeSelector | object | `{}` | node selector |
| duckling.podSecurityContext.enabled | bool | `true` | Configure Pod Security Context |
| duckling.podSecurityContext.fsGroup | int | `99` | fsGroup |
| duckling.podSecurityContext.sysctls | list | `[]` | sysctls |
| duckling.replicas | string | `nil` | should be > 1 in production |
| duckling.resources | object | `{"limits":{},"requests":{}}` | Duckling resource requests and limits ref: https://kubernetes.io/docs/user-guide/compute-resources/ |
| duckling.tolerations | list | `[]` | tolerations |

### genAiOrchestrator

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| genAiOrchestrator.affinity | object | `{}` | affinity |
| genAiOrchestrator.containerSecurityContext.enabled | bool | `true` | Configure Container Security Context ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod |
| genAiOrchestrator.containerSecurityContext.runAsGroup | int | `99` | Run as Group id |
| genAiOrchestrator.containerSecurityContext.runAsNonRoot | bool | `true` | Run as non root |
| genAiOrchestrator.containerSecurityContext.runAsUser | int | `99` | Run as user id |
| genAiOrchestrator.environment.tock_gen_ai_orchestrator_application_environment | string | `"DEV"` | DEV or PROD in uppercase only |
| genAiOrchestrator.environment.tock_gen_ai_orchestrator_em_provider_timeout | int | `120` | llm embedding retries |
| genAiOrchestrator.environment.tock_gen_ai_orchestrator_llm_provider_max_retries | int | `0` | llm retries |
| genAiOrchestrator.environment.tock_gen_ai_orchestrator_llm_provider_timeout | int | `120` | llm timeout |
| genAiOrchestrator.environment.tock_gen_ai_orchestrator_open_search_host | string | `"opensearch-node1"` | Opensearch host |
| genAiOrchestrator.environment.tock_gen_ai_orchestrator_open_search_port | int | `9200` | Opensearch port |
| genAiOrchestrator.environment.tock_gen_ai_orchestrator_open_search_pwd | string | `"admin"` | Opensearch password |
| genAiOrchestrator.environment.tock_gen_ai_orchestrator_open_search_timeout | int | `5` | Opensearch timeout |
| genAiOrchestrator.environment.tock_gen_ai_orchestrator_open_search_user | string | `"admin"` | Opensearch login |
| genAiOrchestrator.image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ e.g: pullSecrets:   - myRegistryKeySecretName |
| genAiOrchestrator.image.registry | string | `"docker.io"` | Docker image registry |
| genAiOrchestrator.image.repository | string | `"tock/gen-ai-orchestrator-server"` | Docker image name |
| genAiOrchestrator.image.tag | string | `"24.3.4"` | Docker image tag |
| genAiOrchestrator.nodeSelector | object | `{}` | node selector |
| genAiOrchestrator.podSecurityContext.enabled | bool | `true` | Configure Pod Security Context |
| genAiOrchestrator.podSecurityContext.fsGroup | int | `99` | fsGroup |
| genAiOrchestrator.podSecurityContext.sysctls | list | `[]` | sysctls |
| genAiOrchestrator.replicas | int | `1` | should be > 1 in production |
| genAiOrchestrator.resources | object | `{"limits":{},"requests":{}}` | gen-ai-orchestrator-server resource requests and limits ref: https://kubernetes.io/docs/user-guide/compute-resources/ |
| genAiOrchestrator.tolerations | list | `[]` | tolerations |

### Global

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.NetworkPolicy.enabled | bool | `false` | Enable creation of NetworkPolicy resources |
| global.clusterDomain | string | `"cluster.local"` | Default Kubernetes cluster domain |
| global.deployMongoDb.enabled | bool | `true` | If true Deploy MongoDB subchart |
| global.deployOpenSearch.dashboardEnabled | bool | `false` | If true Deploy OpenSearch Dashboard as subchart |
| global.deployOpenSearch.enabled | bool | `false` | If true Deploy OpenSearch subchart |
| global.deployOpenSearch.openSearchHost | string | `"opensearch-node1"` | for an existing opensearch cluster |
| global.deployOpenSearch.openSearchPort | string | `"9200"` | for an existing opensearch cluster |
| global.deployOpenSearch.openSearchPwd | string | `"admin"` | for an existing opensearch cluster |
| global.deployOpenSearch.openSearchUser | string | `"admin"` | for an existing opensearch cluster |
| global.imagePullSecrets | list | `[]` | Glocal Image pull secret E.g. imagePullSecrets:   - myRegistryKeySecretName  |
| global.imageRegistry | string | `""` | Global Docker image registry |
| global.initContainerImage | object | `{"containerSecurityContext":{"enabled":true,"runAsGroup":99,"runAsNonRoot":true,"runAsUser":99},"pullPolicy":"IfNotPresent","pullSecrets":[],"registry":"docker.io","repository":"busybox","tag":"1.36.1"}` | initcontainer images |
| global.initContainerImage.containerSecurityContext | object | `{"enabled":true,"runAsGroup":99,"runAsNonRoot":true,"runAsUser":99}` | Configure Container Security Context ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod @param containerSecurityContext.enabled Enabled init containers' Security Context @param containerSecurityContext.runAsUser Set init container Server containers' Security Context runAsUser |
| global.mongodbPort | string | `"27017"` | If mongoDB is not deployed by the chart, the mongodb port |
| global.mongodbUrls | string | `"mongodb://myuser:mypass@xx.xx.xx.xx:27017,xx.xx.xx.xx:27017,xx.xx.xx.xx:27017/mydb?replicaSet=rs0"` | If mongoDB is not deployed by the chart, you can use this to connect to an external mongoDB mongodbUrls: mongodb://myuser:mypass@fqdn-node1:27017,fqdn-node2:27017,fqdn-node3:27017/mydb?replicaSet=rs0 |
| global.mongodbcheckfqdn | string | `"fqdn-node1"` | If mongoDB is not deployed by the chart, the node use to check if the mongodb is up |
| global.wildcardDomain | string | `"rancher.localhost"` | Default domain used for ingress |

### KotlinCompiler

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| kotlinCompiler.affinity | object | `{}` | affinity |
| kotlinCompiler.containerSecurityContext.enabled | bool | `true` | Configure Container Security Context ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod |
| kotlinCompiler.containerSecurityContext.runAsGroup | int | `99` | Run as Group id |
| kotlinCompiler.containerSecurityContext.runAsNonRoot | bool | `true` | Run as non root |
| kotlinCompiler.containerSecurityContext.runAsUser | int | `99` | Run as user id |
| kotlinCompiler.environment.tock_default_log_level | string | `"info"` | log level |
| kotlinCompiler.environment.tock_env | string | `"prod"` | tock environment (prod, dev, integ) |
| kotlinCompiler.environment.tock_kotlin_compiler_classpath | string | `"/maven"` | compiler classpath |
| kotlinCompiler.image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ e.g: pullSecrets:   - myRegistryKeySecretName |
| kotlinCompiler.image.registry | string | `"docker.io"` | Docker image registry |
| kotlinCompiler.image.repository | string | `"tock/kotlin_compiler"` | Docker image name |
| kotlinCompiler.image.tag | string | `"24.3.4"` | Docker image tag |
| kotlinCompiler.nodeSelector | object | `{}` | node selector |
| kotlinCompiler.podSecurityContext.enabled | bool | `true` | Configure Pod Security Context |
| kotlinCompiler.podSecurityContext.fsGroup | int | `99` | fsGroup |
| kotlinCompiler.podSecurityContext.sysctls | list | `[]` | sysctls |
| kotlinCompiler.resources | object | `{"limits":{},"requests":{}}` | KotlinCompiler resource requests and limits ref: https://kubernetes.io/docs/user-guide/compute-resources/ |
| kotlinCompiler.tolerations | list | `[]` | tolerations |

### mongodb

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| mongodb | object | `{"arbiter":{"enabled":false},"architecture":"replicaset","auth":{"enabled":false},"extraFlags":["--bind_ip_all"],"persistence":{"enabled":true,"size":"1Gi"},"replicaCount":3,"replicaSetConfigurationSettings":{"enabled":true},"replicaSetName":"tock"}` | MongoDB settings. See Bitnami MongoDB chart for more details |
| mongodb.arbiter.enabled | bool | `false` | Enable MongoDB arbiter |
| mongodb.architecture | string | `"replicaset"` | MongoDB architecture |
| mongodb.auth.enabled | bool | `false` | Enable MongoDB authentication |
| mongodb.extraFlags | list | `["--bind_ip_all"]` | MongoDB extraFlags |
| mongodb.persistence.enabled | bool | `true` | Enable MongoDB persistence using PVC |
| mongodb.persistence.size | string | `"1Gi"` | MongoDB volume size |
| mongodb.replicaCount | int | `3` | MongoDB replicaSet configuration settings |
| mongodb.replicaSetConfigurationSettings | object | `{"enabled":true}` | MongoDB replicaSet configuration settings |
| mongodb.replicaSetConfigurationSettings.enabled | bool | `true` | MongoDB replicaSet configuration settings |
| mongodb.replicaSetName | string | `"tock"` | MongoDB replicaSet name |

### nlpApi

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nlpApi.affinity | object | `{}` | affinity |
| nlpApi.containerSecurityContext.enabled | bool | `true` | Configure Container Security Context ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod |
| nlpApi.containerSecurityContext.runAsGroup | int | `99` | Run as Group id |
| nlpApi.containerSecurityContext.runAsNonRoot | bool | `true` | Run as non root |
| nlpApi.containerSecurityContext.runAsUser | int | `99` | Run as user id |
| nlpApi.environment.tock_default_log_level | string | `"info"` | tock environment (prod, dev, integ) |
| nlpApi.environment.tock_env | string | `"prod"` | tock environment (prod, dev, integ) |
| nlpApi.environment.tock_web_use_default_cors_handler | string | `"true"` | cors handler |
| nlpApi.environment.tock_web_use_default_cors_handler_allowed_methods | string | `""` | cors handler allowed methods, could be "GET, POST, PUT, DELETE, OPTIONS, HEAD" |
| nlpApi.environment.tock_web_use_default_cors_handler_url | string | `"*"` | cors handler URL |
| nlpApi.environment.tock_web_use_default_cors_handler_with_credentials | string | `"false"` | cors handler with credentials |
| nlpApi.image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ e.g: pullSecrets:   - myRegistryKeySecretName |
| nlpApi.image.registry | string | `"docker.io"` | Docker image registry |
| nlpApi.image.repository | string | `"tock/nlp_api"` | Docker image name |
| nlpApi.image.tag | string | `"24.3.4"` | Docker image tag |
| nlpApi.nodeSelector | object | `{}` | node selector |
| nlpApi.podSecurityContext.enabled | bool | `true` | Configure Pod Security Context |
| nlpApi.podSecurityContext.fsGroup | int | `99` | fsGroup |
| nlpApi.podSecurityContext.sysctls | list | `[]` | sysctls |
| nlpApi.replicas | int | `1` | should be > 1 in production |
| nlpApi.resources | object | `{"limits":{},"requests":{}}` | nlpApi resource requests and limits ref: https://kubernetes.io/docs/user-guide/compute-resources/ |
| nlpApi.tolerations | list | `[]` | tolerations |

### openSearch

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| opensearch.clusterName | string | `"opensearch-cluster"` | OpenSearch architectureCluster name |
| opensearch.opensearchJavaOpts | string | `"-Xms512m -Xmx512m"` | OpenSearch java options |
| opensearch.replicas | int | `3` | Cluster node number |
| opensearch.singleNode | bool | `false` | Deploy as single node |

### Other Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| opensearch.extraEnvs[0].name | string | `"OPENSEARCH_INITIAL_ADMIN_PASSWORD"` |  |
| opensearch.extraEnvs[0].value | string | `"DoThisOne12+"` |  |

## Authentification configurations

The following sample clould be added as ConfigMap to configure the authentication of the admin web interface.

To use it , you have to apply the following ConfigMap to your cluster.

```console
$ kubectl apply -f ./admin-web-auth-cfg.yaml
```

And set in your values file `adminWeb.authCongifMap` to `admin-web-auth-cfg` (configmap name)

`admin-web-auth-cfg.yaml`

```yaml
apiVersion: v1
  kind: ConfigMap
  metadata:
    name: admin-web-auth-cfg
    labels:
      app.kubernetes.io/name: admin-web-auth
      app.kubernetes.io/component: admin-web
    data:
      tock_users:  "alice@tock.ai,bob@tock.ai" # Credentials (separated by commas). Default value `admin@app.com`
      tock_passwords: "secret1,secret2" # Password (separated by commas). Default value `password`
      tock_organizations: "tock,tock" # Organizations (separated by commas). Default value `app``
      tock_roles: "botUser,nlpUser|botUser|admin|technicalAdmin" #  Roles separated | (and then by commas). Default value is empty."
 ```

In this example, Alice has the role 'botUser', whereas Bob has all roles.
To define the identities and roles of several users, separate their values with commas.

## Deployment on arm64 and processor without AVX instructions

It seems the native build of MongoDB requires AVX instructions at the processor level

https://github.com/bitnami/charts/issues/12834

For Arm, the image used in value must be changed and the following Mongodb chart image should be used instead.

https://artifacthub.io/packages/helm/bitnami/mongodb/13.6.8

## Deployment sample on Rancher Desktop

```console
$ helm install mytock oci://registry.hub.docker.com/onelans/tock --version 0.3.4 -f ./rancher-values.yaml
```

`rancher-values.yaml`
```yaml
global:
  wildcardDomain: rancher.localhost
  deployMongoDb:
    enabled: true

botApi:
  environment:
    tock_default_log_level: "debug"
    tock_web_use_default_cors_handler_url : "*"
  ingress:
    enabled: true

mongodb:
  architecture: "replicaset"
  auth:
    enabled: false
  persistence:
    enabled: false
    size: 1Gi
  image:
    repository: zcube/bitnami-compat-mongodb
    tag: 6.0.5

nlpApi:
  environment:
    tock_env: prod
    tock_web_use_default_cors_handler: "true"
    tock_web_use_default_cors_handler_url: "*"
    tock_web_use_default_cors_handler_with_credentials: "false"
  repository:
    image: tock/nlp_api
    tag: 24.3.4

adminWeb:
  ingress:
    enabled: true
```

> The values file defines a MongoDB image that is compatible with macOS Arm

## Deployment sample on GKE

```console
$ helm install mytock oci://registry.hub.docker.com/onelans/tock --version 0.3.4 -f ./gke-values.yaml
```

`gke-values.yaml`

```yaml
global:
  wildcardDomain: gke.mydomain.com
  deployMongoDb:
    enabled: true

botApi:
  ingress:
    enabled: true
    annotations:
      kubernetes.io/ingress.class: "gce"
  service:
    type: NodePort

adminWeb:
  ingress:
    enabled: true
    annotations:
      kubernetes.io/ingress.class: "gce" 
  service:
    type: NodePort
```

> The values file defines the use of the GCE ingress controller
> You can get the external IP of the ingress controller with the following command
> `kubectl get ingress mytock-admin-web  --output yaml`

