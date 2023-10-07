{{/*
Config Service
*/}}
{{- define "pet-clinic-config-server.name" -}}
{{- if .Values.nameOverride -}}
{{- printf "%s-config" .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := .Release.Name | trunc 29 -}}
{{- printf "config-server" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "pet-clinic-config-server.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "pet-clinic-config-server.labels" -}}
helm.sh/chart: {{ include "pet-clinic-config-server.chart" . }}
{{ include "pet-clinic-config-server.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "pet-clinic-config-server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pet-clinic-config-server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "pet-clinic-config-server.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "pet-clinic-config-server.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
