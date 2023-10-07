{{- define "pet-clinic-visits-service.name" -}}
{{- if .Values.nameOverride -}}
{{- printf "%s-visits" .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := .Release.Name | trunc 29 -}}
{{- printf "visits-service" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "pet-clinic-visits-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "pet-clinic-visits-service.labels" -}}
helm.sh/chart: {{ include "pet-clinic-visits-service.chart" . }}
{{ include "pet-clinic-visits-service.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "pet-clinic-visits-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pet-clinic-visits-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "pet-clinic-visits-service.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "pet-clinic-visits-service.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
