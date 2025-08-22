{{- define "my-fullstack.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "my-frontend.fullname" -}}
{{- printf "%s-frontend" (include "my-fullstack.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "my-frontend.labels" -}}
app.kubernetes.io/name: {{ include "my-frontend.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "my-backend.fullname" -}}
{{- printf "%s-backend" (include "my-fullstack.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "my-backend.labels" -}}
app.kubernetes.io/name: {{ include "my-backend.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
