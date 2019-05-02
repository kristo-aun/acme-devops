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
