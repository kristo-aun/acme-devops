{{/* vim: set filetype=mustache: */}}
{{/*
postgresql customisation
*/}}
{{- define "postgresql.name" -}}
{{- default "acme-postgresql" -}}
{{- end -}}

{{- define "postgresql.fullname" -}}
{{- default "acme-postgresql" -}}
{{- end -}}

{{/* expands to the fqdn using the component name. Note domain has a leading . */}}
{{- define "externalFQDN" -}}
{{- if .Values.ingress.hostname  }}{{- printf "%s" .Values.ingress.hostname -}}
{{- else -}}
{{- printf "login.%s%s" .Release.Namespace .Values.domain -}}
{{- end -}}
{{- end -}}
