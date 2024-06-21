<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.14.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 2.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.14.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 2.0.4 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Resources

| Name | Type |
|------|------|
| [helm_release.load-balancer](https://registry.terraform.io/providers/hashicorp/helm/2.14.0/docs/resources/release) | resource |
| [kubectl_manifest.ipaddresspool](https://registry.terraform.io/providers/alekc/kubectl/2.0.4/docs/resources/manifest) | resource |
| [kubectl_manifest.l2advertisement](https://registry.terraform.io/providers/alekc/kubectl/2.0.4/docs/resources/manifest) | resource |
| [kubernetes_namespace.metallb_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_address_pool"></a> [ip\_address\_pool](#input\_ip\_address\_pool) | The IP address pool to use for MetalLB. This should be a list of IP addresses in CIDR notation.<br>Take care to ensure that the IP addresses are not already in use on your network.<br>The var is a string so quote should be escaped, e.g :<br>"[\"10.0.20.0/24\", \"10.0.22.3/32\"]" | `string` | n/a | yes |
| <a name="input_helm_release_name"></a> [helm\_release\_name](#input\_helm\_release\_name) | n/a | `string` | `"metallb"` | no |
| <a name="input_helm_repo_url"></a> [helm\_repo\_url](#input\_helm\_repo\_url) | n/a | `string` | `"https://charts.bitnami.com/bitnami"` | no |
| <a name="input_metallb_version"></a> [metallb\_version](#input\_metallb\_version) | n/a | `string` | `"6.3.5"` | no |
| <a name="input_monitoring_namespace"></a> [monitoring\_namespace](#input\_monitoring\_namespace) | n/a | `string` | `""` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | `"metallb-system"` | no |
<!-- END_TF_DOCS -->