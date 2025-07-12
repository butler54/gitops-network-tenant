
{{- define "tenants.validation.cidr" -}}
  {{- $value := .value -}}
  {{- $name := .name -}}
  {{- $cidrRegex := "^([0-9]{1,3}\\.){3}[0-9]{1,3}(\\/([0-9]|[1-2][0-9]|3[0-2]))?$" -}}
  {{- if not (kindIs "string" $value) -}}
    {{- fail (printf "Validation failed for '%s': value '%v' is not a string. Please provide a valid CIDR block." $name $value) -}}
  {{- end -}}
  {{- if not (regexMatch $cidrRegex $value) -}}
    {{- fail (printf "Validation failed for '%s': value '%s' is not a valid CIDR block. Please use the format 'x.x.x.x/y' where y is 0-32." $name $value) -}}
  {{- end -}}
{{- end -}}
