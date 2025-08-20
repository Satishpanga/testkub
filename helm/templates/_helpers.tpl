{{/*
Return the name of the chart
*/}}
{{- define "my-frontend.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Return the fullname of the release
*/}}
{{- define "my-frontend.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "my-frontend.labels" -}}
app.kubernetes.io/name: {{ include "my-frontend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

