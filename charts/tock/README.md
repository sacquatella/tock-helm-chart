# tock

A helm chart for Tock. Tock is an open conversational AI platform. It's a complete solution to build conversational agents aka bots.Tock can integrate and experiment with both classic and Generative AI (LLM, RAG) models

![Version: 0.3.4](https://img.shields.io/badge/Version-0.3.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 23.9.2](https://img.shields.io/badge/AppVersion-23.9.2-informational?style=flat-square)

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mongodb | 13.6.8 |

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm repo add foo-bar http://charts.foo-bar.com
$ helm install my-release foo-bar/tock
```

## Sections

This creates values, but sectioned into own section tables if a section comment is provided.

## Values

### adminWeb

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| adminWeb.affinity | object | `{}` | affinity |
| adminWeb.authCongifMap | string | `""` | Authentification configurations, set confimap name. Athentication configurations . Add the configuration in the form of key value pair in a configmap. If authCongifMap is not set default values are used. ref: https://doc.tock.ai/tock/fr/admin/securite/ ` apiVersion: v1  kind: ConfigMap  metadata:    name: admin-web-auth-cfg  labels:    app.kubernetes.io/name: admin-web-auth    app.kubernetes.io/component: admin-web    data:      tock_users:  "alice@tock.ai,bob@tock.ai" # Identifiants (séparés par des virgules). Valeur par defaut `admin@app.com`      tock_passwords: "secret1,secret2" # Mots de passe (séparés par des virgules). Valleur par defaut `password``       tock_organizations: "tock,tock" # Organisations (séparées par des virgules). Valleur par defaut `app``      tock_roles: "botUser,nlpUser|botUser|admin|technicalAdmin" #  Rôles séparés par des | (puis par des virgules). Valeur par defaut vide ` Dans cet exemple, Alice a le rôle botUser, alors que Bob a tous les rôles. Pour définir l'identité et les rôles de plusieurs utilisateurs, on sépare les valeurs par des virgules. |
| adminWeb.containerSecurityContext.enabled | bool | `true` | Configure containers' Security Context ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod |
| adminWeb.containerSecurityContext.runAsGroup | int | `99` | Run as group id |
| adminWeb.containerSecurityContext.runAsNonRoot | bool | `true` | Run as non root |
| adminWeb.containerSecurityContext.runAsUser | int | `99` | Run as user id |
| adminWeb.environment.botadminverticle_base_href | string | `""` | Have to be set if tock studio is deployed as subdomain https://sssss/tockstudio |
| adminWeb.environment.botadminverticle_body_limit | string | `"-1"` | botadminverticle_body_limit |
| adminWeb.environment.tock_default_log_level | string | `"info"` | log level |
| adminWeb.environment.tock_env | string | `"false"` | tock_env |
| adminWeb.environment.tock_https_env | string | `"prod"` | Environment |
| adminWeb.image.registry | string | `"docker.io"` | Docker image registry |
| adminWeb.image.repository | string | `"tock/bot_admin"` | Docker docker image name |
| adminWeb.image.tag | string | `"23.9.2"` | Docker image tag |
| adminWeb.ingress.annotations | object | `{}` | ingress annotations annotations:  kubernetes.io/ingress.class: traefik  kubernetes.io/ingress.class: nginx  kubernetes.io/tls-acme: "true" |
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
| botApi.environment.tock_env | string | `"integ"` | tock environment (prod, dev, integ) |

### buildWorker

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| buildWorker | object | `{"affinity":{},"containerSecurityContext":{"enabled":true,"runAsGroup":99,"runAsNonRoot":true,"runAsUser":99},"environment":{"tock_env":"prod"},"image":{"pullSecrets":[],"registry":"docker.io","repository":"tock/build_worker","tag":"23.9.2"},"nodeSelector":{},"podSecurityContext":{"enabled":true,"fsGroup":99,"sysctls":[]},"resources":{"limits":{},"requests":{}},"tolerations":[]}` | -------------------------------------------- |

### Global

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.NetworkPolicy.enabled | bool | `false` | Enable creation of NetworkPolicy resources |
| global.clusterDomain | string | `"cluster.local"` | Default Kubernetes cluster domain |
| global.deployMongoDb.enabled | bool | `false` | If true Deploy MongoDB subchart |
| global.imagePullSecrets | list | `[]` | Glocal Image pull secret E.g. imagePullSecrets:   - myRegistryKeySecretName  |
| global.imageRegistry | string | `""` | Global Docker image registry |
| global.initContainerImage | object | `{"containerSecurityContext":{"enabled":true,"runAsGroup":99,"runAsNonRoot":true,"runAsUser":99},"pullPolicy":"IfNotPresent","pullSecrets":[],"registry":"docker.io","repository":"busybox","tag":"1.36.1"}` | initcontainer images |
| global.initContainerImage.containerSecurityContext | object | `{"enabled":true,"runAsGroup":99,"runAsNonRoot":true,"runAsUser":99}` | Configure Container Security Context ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod @param containerSecurityContext.enabled Enabled init containers' Security Context @param containerSecurityContext.runAsUser Set init container Server containers' Security Context runAsUser |
| global.mongodbPort | string | `"27017"` | If mongoDB is not deployed by the chart, the mongodb port |
| global.mongodbUrls | string | `"mongodb://myuser:mypass@10.118.127.233:27017,10.118.127.234:27017,10.118.127.235:27017/mydb?replicaSet=rs0"` | If mongoDB is not deployed by the chart, you can use this to connect to an external mongoDB mongodbUrls: mongodb://myuser:mypass@fqdn-node1:27017,fqdn-node2:27017,fqdn-node3:27017/mydb?replicaSet=rs0 |
| global.mongodbcheckfqdn | string | `"fqdn-node1"` | If mongoDB is not deployed by the chart, the node use to check if the mongodb is up |
| global.wildcardDomain | string | `"rancher.localhost"` | Default domain used for ingress |

### kotlinCompiler

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| kotlinCompiler | object | `{"affinity":{},"containerSecurityContext":{"enabled":true,"runAsGroup":99,"runAsNonRoot":true,"runAsUser":99},"environment":{"tock_env":"prod","tock_kotlin_compiler_classpath":"/maven"},"image":{"pullSecrets":[],"registry":"docker.io","repository":"tock/kotlin_compiler","tag":"23.9.2"},"nodeSelector":{},"podSecurityContext":{"enabled":true,"fsGroup":99,"sysctls":[]},"resources":{"limits":{},"requests":{}},"tolerations":[]}` | -------------------------------------------- |

### mongodb

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| mongodb | object | `{"arbiter":{"enabled":false},"architecture":"replicaset","auth":{"enabled":false},"extraFlags":["--bind_ip_all"],"persistence":{"enabled":true,"size":"1Gi"},"replicaCount":3,"replicaSetConfigurationSettings":{"enabled":true},"replicaSetName":"tock"}` | -------------------------------------------- |

### nlpApi

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nlpApi | object | `{"affinity":{},"containerSecurityContext":{"enabled":true,"runAsGroup":99,"runAsNonRoot":true,"runAsUser":99},"environment":{"tock_env":"prod","tock_web_use_default_cors_handler":"true","tock_web_use_default_cors_handler_url":"*","tock_web_use_default_cors_handler_with_credentials":"false"},"image":{"pullSecrets":[],"registry":"docker.io","repository":"tock/nlp_api","tag":"23.9.2"},"nodeSelector":{},"podSecurityContext":{"enabled":true,"fsGroup":99,"sysctls":[]},"replicas":1,"resources":{"limits":{},"requests":{}},"tolerations":[]}` | -------------------------------------------- |

### Other Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| adminWeb | object | `{"affinity":{},"authCongifMap":"","containerSecurityContext":{"enabled":true,"runAsGroup":99,"runAsNonRoot":true,"runAsUser":99},"environment":{"botadminverticle_base_href":"","botadminverticle_body_limit":"-1","tock_default_log_level":"info","tock_env":"false","tock_https_env":"prod"},"image":{"pullSecrets":[],"registry":"docker.io","repository":"tock/bot_admin","tag":"23.9.2"},"ingress":{"annotations":{},"deprecated":false,"enabled":true,"path":"/","tls":[]},"nodeSelector":{},"podSecurityContext":{"enabled":true,"fsGroup":99,"sysctls":[]},"replicas":1,"resources":{"limits":{},"requests":{}},"service":{"port":8080,"type":"ClusterIP"},"tolerations":[]}` | -------------------------------------------- |
| adminWeb.ingress.deprecated | bool | `false` | set to true for deployement on cluster version < 1.19 (apiVersion: networking.k8s.io/v1beta1 vs apiVersion: networking.k8s.io/v1) |
| botApi | object | `{"affinity":{},"containerSecurityContext":{"enabled":true,"runAsGroup":99,"runAsNonRoot":true,"runAsUser":99},"environment":{"tock_default_log_level":"info","tock_env":"integ"},"image":{"pullSecrets":[],"registry":"docker.io","repository":"tock/bot_api","tag":"23.9.2"},"ingress":{"annotations":{},"deprecated":false,"enabled":true,"path":"/","tls":[]},"nodeSelector":{},"podSecurityContext":{"enabled":true,"fsGroup":99,"sysctls":[]},"replicas":1,"resources":{"limits":{},"requests":{}},"service":{"port":8080,"type":"ClusterIP"},"tolerations":[]}` | -------------------------------------------- |
| botApi.environment.tock_default_log_level | string | `"info"` | bot api log level |
| duckling | object | `{"affinity":{},"containerSecurityContext":{"enabled":true,"runAsGroup":99,"runAsNonRoot":true,"runAsUser":99},"environment":{"tock_env":"prod"},"image":{"pullSecrets":[],"registry":"docker.io","repository":"tock/duckling","tag":"23.9.2"},"nodeSelector":{},"podSecurityContext":{"enabled":true,"fsGroup":99,"sysctls":[]},"replicas":1,"resources":{"limits":{},"requests":{}},"tolerations":[]}` | -------------------------------------------- |

## Deployment on arm64.
It seems the native build of MongoDB requires AVX instructions at the processor level

https://github.com/bitnami/charts/issues/12834

For Arm, the image used in value must be changed and the following Mongodb chart image should be used instead.

https://artifacthub.io/packages/helm/bitnami/mongodb/13.6.8

## Deployment sample on Rancher Desktop

```console
$ helm install mytock charts/tock -f ./rancher-values.yaml
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