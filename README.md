# Helm Chart for Tock  (theopenconversationkit)


[Tock](https://doc.tock.ai/fr/), an open conversational AI platform provide a complete solution to build conversational agents aka bots.

Tock can integrate and experiment with both classic and Generative AI (LLM, RAG) models.


## Quick start

```console 
$ helm install mytork ./charts/tock
```

You will find more information on chart parameters at the helm chart [README](charts/tock/README.md).

## What is deployed 

The chart deploy all tock components. It's able also to deploy a mongodb database (Bitnami mongoDb chart is used as subchart) or use an existing mongodb backend.


```plantuml
@startuml

package "Kubernetes" {

node "adminWeb" {

Component "bot_admin" <<pod>> as BAPOD
Component "admin-web-svc" <<service>> as BASVC
Component "admin-web-ing" <<ingress>> as BAING
Component "admin-web-cfg" <<configmap>> as BACFM

BASVC --> BAPOD
BAPOD --> BACFM
BAING --> BASVC

}

node "bot_api" {

Component "bot_api" <<pod>> as BAPIPOD
Component "bot-api-svc" <<service>> as BAPISVC
Component "bot-api-ing" <<ingress>> as BAPIING
Component "bot-api-cfg" <<configmap>> as BAPICFM

BAPISVC --> BAPIPOD
BAPIPOD --> BAPICFM
BAPIING --> BAPISVC

}

node "build_worker" {

Component "build-worker" <<pod>> as BWPOD
Component "build-worker-svc" <<service>> as BWSVC
Component "build-worker-cfg" <<configmap>> as BWCFM

BWPOD --> BWCFM
BWSVC --> BWPOD

}

node "duckling" {

Component "duckling" <<pod>> as DPOD
Component "duckling-svc" <<service>> as DSVC
Component "duckling-cfg" <<configmap>> as DCFM

DPOD --> DCFM
DSVC-->DPOD

}

node "kotlin_compiler" {

Component "kotlin-compiler" <<pod>> as KCPOD
Component "kotlin-compiler-svc" <<service>> as KCSVC
Component "kotlin-compiler-cfg" <<configmap>> as KCCFM

KCPOD --> KCCFM
KCSVC --> KCPOD

}

node "nlp_api" {

Component "nlp-api" <<pod>> as NLPPOD
Component "nlp-api-svc" <<service>> as NLPSVC
Component "nlp-api-cfg" <<configmap>> as NLPCFM

NLPPOD --> NLPCFM
NLPSVC --> NLPPOD

}

database "mongodb" {

Component "mongodb-1" <<pod>> as NONG1POD
Component "mongodb-2" <<pod>> as NONG2POD
Component "mongodb-3" <<pod>> as NONG3POD
Component "mongodb-svc"  <<headless-service>> as NONGSVC

NONGSVC ..> NONG1POD
NONGSVC ..> NONG2POD
NONGSVC ..> NONG3POD
}

BAPOD -> NONGSVC
BAPOD -> BAPISVC
BAPOD -> DSVC
BAPOD -> NLPSVC
BAPOD -> KCSVC

BAPIPOD -> NONGSVC
BAPIPOD -> NLPSVC

BWPOD -> NONGSVC

DPOD -> NONGSVC

NLPPOD -> NONGSVC
NLPPOD -> DSVC

}

HTTP - BAING
HTTP - BAPIING


@enduml
```