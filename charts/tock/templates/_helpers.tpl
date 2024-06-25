

{{- define "common.names.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}



{{/*
Create the default FQDN for Mongo primary headless service
It use for checking if mongo service is ready or not when a container start.
We truncate at 63 chars because of the DNS naming spec.
*/}}
{{- define "url.mongo.default.headless" -}}
{{- if .Values.global.deployMongoDb.enabled -}}
{{- printf "%s-%s.%s-%s" .Release.Name "mongodb-0" .Release.Name "mongodb-headless" -}}
{{- else -}}
{{- printf "%s" .Values.global.mongodbcheckfqdn -}}
{{- end -}}
{{- end -}}

{{/*
Create the default FQDN for Mongo primary headless service
It use for checking if mongo service is ready or not when a container start.
We truncate at 63 chars because of the DNS naming spec.
*/}}
{{- define "url.mongo.isup" -}}
{{- if .Values.global.deployMongoDb.enabled -}}
{{- printf "%s-%s" .Release.Name "mongodb-headless" -}}
{{- else -}}
{{- printf "%s" .Values.global.mongodbcheckfqdn -}}
{{- end -}}
{{- end -}}


{{/*
Get mongodb Port
*/}}
{{- define "port.mongo" -}}
{{- if .Values.global.deployMongoDb.enabled -}}
{{- printf "%s-%s.%s-%s" .Release.Name "mongodb-0" .Release.Name "mongodb-headless" -}}
{{- else -}}
{{- default "27017" .Values.global.mongodbPort -}}
{{- end -}}
{{- end -}}



{{/*
Create the full URI for Mongo service
podname.servicename.namespacename.svc.clusterdomain:port
*/}}
{{- define "url.mongo.full" -}}
{{- if .Values.global.deployMongoDb.enabled -}}
{{- printf "%s-%s.%s-%s.%s.svc.%s:%s" .Release.Name "mongodb-0" .Release.Name "mongodb-headless" .Release.Namespace .Values.global.clusterDomain "27017" -}}
{{- else -}}
{{- printf "%s:%s" .Values.global.mongodbUrls .Values.global.mongodbPort -}}
{{- end -}}
{{- end -}}

{{/*
Create the full URI for Mongo service
*/}}
{{- define "urls.mongo" -}}
{{- if .Values.global.deployMongoDb.enabled -}}
{{- $mongo1 := printf "%s-%s.%s-%s.%s.svc.%s:%s" .Release.Name "mongodb-0" .Release.Name "mongodb-headless" .Release.Namespace .Values.global.clusterDomain "27017" -}}
{{- $mongo2 := printf "%s-%s.%s-%s.%s.svc.%s:%s" .Release.Name "mongodb-1" .Release.Name "mongodb-headless" .Release.Namespace .Values.global.clusterDomain "27017" -}}
{{- $mongo3 := printf "%s-%s.%s-%s.%s.svc.%s:%s" .Release.Name "mongodb-2" .Release.Name "mongodb-headless" .Release.Namespace .Values.global.clusterDomain "27017" -}}
{{- printf "mongodb://%s,%s,%s" $mongo1 $mongo2 $mongo3 -}}
{{- else -}}
{{- printf "%s" .Values.global.mongodbUrls -}}
{{- end -}}
{{- end -}}

{{/*
Create the full URI for Opensearch service
*/}}
{{- define "urls.opensearch" -}}
{{- if .Values.global.deployOpenSearch.enabled -}}
{{/* - $opensearch1 := printf "%s-%s.%s-%s.%s.svc.%s" .Release.Name "opensearch-cluster-master-0" .Release.Name "opensearch-cluster-master-headless" .Release.Namespace .Values.global.clusterDomain - */}}
{{- $opensearch1 := printf "%s.%s.%s.svc.%s" "opensearch-cluster-master-0" "opensearch-cluster-master-headless" .Release.Namespace .Values.global.clusterDomain -}}
{{- printf "%s" $opensearch1 -}}
{{- else -}}
{{- printf "%s" .Values.global.deployOpenSearch.openSearchHost -}}
{{- end -}}
{{- end -}}

{{/*
Get Opensearch Port
*/}}
{{- define "port.opensearch" -}}
{{- if .Values.global.deployOpenSearch.enabled -}}
{{- default "9200" .Values.opensearch.httpPort -}}
{{- else -}}
{{- printf "%s" .Values.global.deployOpenSearch.openSearchPort -}}
{{- end -}}
{{- end -}}


{{/*
Get Opensearch user
*/}}
{{- define "user.opensearch" -}}
{{- printf "%s" "admin" -}}
{{- end -}}

{{/*
Get Opensearch password
*/}}
{{- define "pwd.opensearch" -}}
{{- if .Values.global.deployOpenSearch.enabled -}}
{{- range .Values.opensearch.extraEnvs }}
  {{- if eq .name "OPENSEARCH_INITIAL_ADMIN_PASSWORD" }}
    {{-  printf "%s" .value -}}
  {{- end }}
{{- end }}
{{- else -}}
{{- default "admin" .Values.global.deployOpenSearch.openSearchPassword -}}
{{- end -}}
{{- end -}}


{{/*
Build user defined mongodb urls
*/}}
{{- define "mongo.BuildString" -}}
{{- $mongourls := list -}}
{{- $global := . -}}
{{- range .Values.global.mongodbUrls -}}
{{- $mongo := printf "%s:%s" . $global.Values.global.mongodbPort -}}
{{- $mongourls := append $mongourls $mongo -}}
{{- end -}}
{{- printf "%s" $mongourls -}}
{{- end -}}


{{/*
Build opensearch urls
*/}}
{{- define "opensearch.BuildString" -}}
{{- $opensearchurls := list -}}
{{- $global := . -}}
{{- range .Values.global.opensearchUrls -}}
{{- $opensearch := printf "%s:%s" . $global.Values.global.opensearchPort -}}
{{- $opensearchurls := append $opensearchurls $opensearch -}}
{{- end -}}
{{- printf "%s" $opensearchurls -}}
{{- end -}}
*/}}


{{/*
Return the proper image name
{{ include "common.images.image" ( dict "imageRoot" .Values.path.to.the.image "global" .Values.global ) }}
*/}}
{{- define "common.images.image" -}}
{{- $registryName := .imageRoot.registry -}}
{{- $repositoryName := .imageRoot.repository -}}
{{- $separator := ":" -}}
{{- $termination := .imageRoot.tag | toString -}}
{{- if .global }}
    {{- if .global.imageRegistry }}
     {{- $registryName = .global.imageRegistry -}}
    {{- end -}}
{{- end -}}
{{- if .imageRoot.digest }}
    {{- $separator = "@" -}}
    {{- $termination = .imageRoot.digest | toString -}}
{{- end -}}
{{- if $registryName }}
    {{- printf "%s/%s%s%s" $registryName $repositoryName $separator $termination -}}
{{- else -}}
    {{- printf "%s%s%s"  $repositoryName $separator $termination -}}
{{- end -}}
{{- end -}}


{{/*
Return the proper Docker Image Registry Secret Names (deprecated: use common.images.renderPullSecrets instead)
{{ include "common.images.pullSecrets" ( dict "images" (list .Values.path.to.the.image1, .Values.path.to.the.image2) "global" .Values.global) }}
*/}}
{{- define "common.images.pullSecrets" -}}
  {{- $pullSecrets := list }}

  {{- if .global }}
    {{- range .global.imagePullSecrets -}}
      {{- if kindIs "map" . -}}
        {{- $pullSecrets = append $pullSecrets .name -}}
      {{- else -}}
        {{- $pullSecrets = append $pullSecrets . -}}
      {{- end }}
    {{- end -}}
  {{- end -}}

  {{- range .images -}}
    {{- range .pullSecrets -}}
      {{- if kindIs "map" . -}}
        {{- $pullSecrets = append $pullSecrets .name -}}
      {{- else -}}
        {{- $pullSecrets = append $pullSecrets . -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if (not (empty $pullSecrets)) }}
imagePullSecrets:
    {{- range $pullSecrets | uniq }}
  - name: {{ . }}
    {{- end }}
  {{- end }}
{{- end -}}


{{/*
Return the proper admin web image name
*/}}
{{- define "adminWeb.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.adminWeb.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper bot api image name
*/}}
{{- define "botApi.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.botApi.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper bot api internal url
*/}}
{{- define "botApi.url" -}}
{{- printf "%s-%s.%s.svc.%s" .Release.Name "bot-api" .Release.Namespace .Values.global.clusterDomain -}}
{{- end -}}

{{/*
Return the proper buildWorker image name
*/}}
{{- define "buildWorker.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.buildWorker.image "global" .Values.global) -}}
{{- end -}}


{{/*
Return the proper duckling image name
*/}}
{{- define "duckling.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.duckling.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper duckling internal url
*/}}
{{- define "duckling.url" -}}
{{- printf "%s-%s.%s.svc.%s" .Release.Name "duckling" .Release.Namespace .Values.global.clusterDomain -}}
{{- end -}}


{{/*
Return the proper kotlinCompiler image name
*/}}
{{- define "kotlinCompiler.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.kotlinCompiler.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper kotlinCompiler internal url
*/}}
{{- define "kotlinCompiler.url" -}}
{{- printf "%s-%s.%s.svc.%s" .Release.Name "kotlin-compiler" .Release.Namespace .Values.global.clusterDomain -}}
{{- end -}}


{{/*
Return the proper genai-orchestrator internal url
*/}}
{{- define "genai.url" -}}
{{- printf "%s-%s.%s.svc.%s" .Release.Name "genai-orchestrator" .Release.Namespace .Values.global.clusterDomain -}}
{{- end -}}


{{/*
Return the proper nlpApi image name
*/}}
{{- define "nlpApi.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.nlpApi.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper nlpApi internal url
*/}}
{{- define "nlpApi.url" -}}
{{- printf "%s-%s.%s.svc.%s" .Release.Name "nlp-api" .Release.Namespace .Values.global.clusterDomain -}}
{{- end -}}


{{/*
Return the proper genAiOrchestrator image name
*/}}
{{- define "genAiOrchestrator.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.genAiOrchestrator.image "global" .Values.global) -}}
{{- end -}}


{{/*
Return the proper busybox image name for init containers
*/}}
{{- define "initContainer.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.global.initContainerImage "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper adminWeb Docker Image Registry Secret Names
*/}}
{{- define "adminWeb.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.adminWeb.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper botApi Docker Image Registry Secret Names
*/}}
{{- define "botApi.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.botApi.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper buildWorker Docker Image Registry Secret Names
*/}}
{{- define "buildWorker.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.buildWorker.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper duckling Docker Image Registry Secret Names
*/}}
{{- define "duckling.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.duckling.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper kotlinCompiler Docker Image Registry Secret Names
*/}}
{{- define "kotlinCompiler.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.kotlinCompiler.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper nlpApi Docker Image Registry Secret Names
*/}}
{{- define "nlpApi.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.nlpApi.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper genAiOrchestrator Docker Image Registry Secret Names
*/}}
{{- define "genAiOrchestrator.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.genAiOrchestrator.image) "global" .Values.global) -}}
{{- end -}}