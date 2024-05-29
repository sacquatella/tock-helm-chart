CHART=charts/tock
chartversion?=`awk '/^version/ {print $$NF}' ${CHART}/Chart.yaml`
appversion?=`awk '/^appVersion/ {print $$NF}' ${CHART}/Chart.yaml`


lint:
	helm lint ${CHART}

debug:
	helm install --dry-run --debug tockdebug ${CHART}

template:
	helm template test ${CHART} --debug

version:
	@echo "Chart Name:tock Application Version:$(appversion)  Chart Version:${chartversion}"

build:
	helm repo add bitnami https://charts.bitnami.com/bitnami
	helm dep update ${CHART}
	helm lint ${CHART}
	echo "Chart Name:Tock Application Version:${appversion}  Chart Version:${chartversion} "
	helm package ${CHART} --version ${chartversion} --app-version ${appversion} --destination packages

doc:
	helm-docs -c ${CHART}

publish:
	helm push packages/tock-${chartversion}.tgz oci://registry.hub.docker.com/onelans