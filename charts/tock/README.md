# tock

A helm chart for Tock. Tock is an open conversational AI platform. It's a complete solution to build conversational agents aka bots.Tock can integrate and experiment with both classic and Generative AI (LLM, RAG) models

![Version: 0.3.4](https://img.shields.io/badge/Version-0.3.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 23.9.2](https://img.shields.io/badge/AppVersion-23.9.2-informational?style=flat-square)

## DLDR

To install the chart with the release name `my-release`:

```console
$ helm registry login -u myuser registry.hub.docker.com
$ helm install my-release  oci://registry.hub.docker.com/onelans/tock --version 0.3.4
```

## Introduction

This chart helps to setup a Tock environnement.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mongodb | 13.6.8 |

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
| adminWeb.image.tag | string | `"23.9.2"` | Docker image tag |
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
| botApi.image.tag | string | `"23.9.2"` | Docker image tag |
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

### Global

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.NetworkPolicy.enabled | bool | `false` | Enable creation of NetworkPolicy resources |
| global.clusterDomain | string | `"cluster.local"` | Default Kubernetes cluster domain |
| global.deployMongoDb.enabled | bool | `true` | If true Deploy MongoDB subchart |
| global.imagePullSecrets | list | `[]` | Glocal Image pull secret E.g. imagePullSecrets:   - myRegistryKeySecretName  |
| global.imageRegistry | string | `""` | Global Docker image registry |
| global.initContainerImage | object | `{"containerSecurityContext":{"enabled":true,"runAsGroup":99,"runAsNonRoot":true,"runAsUser":99},"pullPolicy":"IfNotPresent","pullSecrets":[],"registry":"docker.io","repository":"busybox","tag":"1.36.1"}` | initcontainer images |
| global.initContainerImage.containerSecurityContext | object | `{"enabled":true,"runAsGroup":99,"runAsNonRoot":true,"runAsUser":99}` | Configure Container Security Context ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod @param containerSecurityContext.enabled Enabled init containers' Security Context @param containerSecurityContext.runAsUser Set init container Server containers' Security Context runAsUser |
| global.mongodbPort | string | `"27017"` | If mongoDB is not deployed by the chart, the mongodb port |
| global.mongodbUrls | string | `"mongodb://myuser:mypass@10.118.127.233:27017,10.118.127.234:27017,10.118.127.235:27017/mydb?replicaSet=rs0"` | If mongoDB is not deployed by the chart, you can use this to connect to an external mongoDB mongodbUrls: mongodb://myuser:mypass@fqdn-node1:27017,fqdn-node2:27017,fqdn-node3:27017/mydb?replicaSet=rs0 |
| global.mongodbcheckfqdn | string | `"fqdn-node1"` | If mongoDB is not deployed by the chart, the node use to check if the mongodb is up |
| global.wildcardDomain | string | `"rancher.localhost"` | Default domain used for ingress |

### Other Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| buildWorker.affinity | object | `{}` |  |
| buildWorker.containerSecurityContext.enabled | bool | `true` |  |
| buildWorker.containerSecurityContext.runAsGroup | int | `99` |  |
| buildWorker.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| buildWorker.containerSecurityContext.runAsUser | int | `99` |  |
| buildWorker.environment.tock_env | string | `"prod"` |  |
| buildWorker.image.pullSecrets | list | `[]` |  |
| buildWorker.image.registry | string | `"docker.io"` |  |
| buildWorker.image.repository | string | `"tock/build_worker"` |  |
| buildWorker.image.tag | string | `"23.9.2"` |  |
| buildWorker.nodeSelector | object | `{}` |  |
| buildWorker.podSecurityContext.enabled | bool | `true` |  |
| buildWorker.podSecurityContext.fsGroup | int | `99` |  |
| buildWorker.podSecurityContext.sysctls | list | `[]` |  |
| buildWorker.resources.limits | object | `{}` |  |
| buildWorker.resources.requests | object | `{}` |  |
| buildWorker.tolerations | list | `[]` |  |
| duckling.affinity | object | `{}` |  |
| duckling.containerSecurityContext.enabled | bool | `true` |  |
| duckling.containerSecurityContext.runAsGroup | int | `99` |  |
| duckling.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| duckling.containerSecurityContext.runAsUser | int | `99` |  |
| duckling.environment.tock_env | string | `"prod"` |  |
| duckling.image.pullSecrets | list | `[]` |  |
| duckling.image.registry | string | `"docker.io"` |  |
| duckling.image.repository | string | `"tock/duckling"` |  |
| duckling.image.tag | string | `"23.9.2"` |  |
| duckling.nodeSelector | object | `{}` |  |
| duckling.podSecurityContext.enabled | bool | `true` |  |
| duckling.podSecurityContext.fsGroup | int | `99` |  |
| duckling.podSecurityContext.sysctls | list | `[]` |  |
| duckling.replicas | int | `1` |  |
| duckling.resources.limits | object | `{}` |  |
| duckling.resources.requests | object | `{}` |  |
| duckling.tolerations | list | `[]` |  |
| kotlinCompiler.affinity | object | `{}` |  |
| kotlinCompiler.containerSecurityContext.enabled | bool | `true` |  |
| kotlinCompiler.containerSecurityContext.runAsGroup | int | `99` |  |
| kotlinCompiler.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| kotlinCompiler.containerSecurityContext.runAsUser | int | `99` |  |
| kotlinCompiler.environment.tock_env | string | `"prod"` |  |
| kotlinCompiler.environment.tock_kotlin_compiler_classpath | string | `"/maven"` |  |
| kotlinCompiler.image.pullSecrets | list | `[]` |  |
| kotlinCompiler.image.registry | string | `"docker.io"` |  |
| kotlinCompiler.image.repository | string | `"tock/kotlin_compiler"` |  |
| kotlinCompiler.image.tag | string | `"23.9.2"` |  |
| kotlinCompiler.nodeSelector | object | `{}` |  |
| kotlinCompiler.podSecurityContext.enabled | bool | `true` |  |
| kotlinCompiler.podSecurityContext.fsGroup | int | `99` |  |
| kotlinCompiler.podSecurityContext.sysctls | list | `[]` |  |
| kotlinCompiler.resources.limits | object | `{}` |  |
| kotlinCompiler.resources.requests | object | `{}` |  |
| kotlinCompiler.tolerations | list | `[]` |  |
| mongodb.arbiter.enabled | bool | `false` |  |
| mongodb.architecture | string | `"replicaset"` |  |
| mongodb.auth.enabled | bool | `false` |  |
| mongodb.extraFlags[0] | string | `"--bind_ip_all"` |  |
| mongodb.persistence.enabled | bool | `true` |  |
| mongodb.persistence.size | string | `"1Gi"` |  |
| mongodb.replicaCount | int | `3` |  |
| mongodb.replicaSetConfigurationSettings.enabled | bool | `true` |  |
| mongodb.replicaSetName | string | `"tock"` |  |
| nlpApi.affinity | object | `{}` |  |
| nlpApi.containerSecurityContext.enabled | bool | `true` |  |
| nlpApi.containerSecurityContext.runAsGroup | int | `99` |  |
| nlpApi.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| nlpApi.containerSecurityContext.runAsUser | int | `99` |  |
| nlpApi.environment.tock_env | string | `"prod"` |  |
| nlpApi.environment.tock_web_use_default_cors_handler | string | `"true"` |  |
| nlpApi.environment.tock_web_use_default_cors_handler_url | string | `"*"` |  |
| nlpApi.environment.tock_web_use_default_cors_handler_with_credentials | string | `"false"` |  |
| nlpApi.image.pullSecrets | list | `[]` |  |
| nlpApi.image.registry | string | `"docker.io"` |  |
| nlpApi.image.repository | string | `"tock/nlp_api"` |  |
| nlpApi.image.tag | string | `"23.9.2"` |  |
| nlpApi.nodeSelector | object | `{}` |  |
| nlpApi.podSecurityContext.enabled | bool | `true` |  |
| nlpApi.podSecurityContext.fsGroup | int | `99` |  |
| nlpApi.podSecurityContext.sysctls | list | `[]` |  |
| nlpApi.replicas | int | `1` |  |
| nlpApi.resources.limits | object | `{}` |  |
| nlpApi.resources.requests | object | `{}` |  |
| nlpApi.tolerations | list | `[]` |  |

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
    tag: 23.9.0

adminWeb:
  ingress:
    enabled: true
```

> The values file defines a MongoDB image that is compatible with macOS Arm