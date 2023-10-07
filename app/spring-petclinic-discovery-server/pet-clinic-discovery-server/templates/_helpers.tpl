{{/*
discovery Service
*/}}
{{- define "pet-clinic-discovery-server.name" -}}
{{- if .Values.nameOverride -}}
{{- printf "%s-discovery" .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := .Release.Name | trunc 29 -}}
{{- printf "discovery-server" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "pet-clinic-discovery-server.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "pet-clinic-discovery-server.labels" -}}
helm.sh/chart: {{ include "pet-clinic-discovery-server.chart" . }}
{{ include "pet-clinic-discovery-server.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "pet-clinic-discovery-server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pet-clinic-discovery-server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "pet-clinic-discovery-server.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "pet-clinic-discovery-server.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
