terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.14.0"
    }
  }
}

locals {
  values_metallb = {
    "MONITORING_NAMESPACE" = var.monitoring_namespace
    "IP_ADDRESS_POOL"      = var.ip_address_pool
    "NAMESPACE"            = var.namespace
  }
  instance_name = var.helm_release_name
}

resource "kubernetes_namespace" "metallb_namespace" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "load-balancer" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_release_name
  version    = var.metallb_version
  namespace  = var.namespace

  reuse_values = true

  values = [
    templatefile("${path.module}/values.yaml", local.values_metallb)
  ]
}

resource "kubectl_manifest" "ipaddresspool" {
  validate_schema = false
  yaml_body       = templatefile("${path.module}/ipaddresspool.yaml", local.values_metallb)
}

resource "kubectl_manifest" "l2advertisement" {
  validate_schema = false
  yaml_body       = templatefile("${path.module}/l2advertisement.yaml", local.values_metallb)
}