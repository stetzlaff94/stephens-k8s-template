provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

terraform {
  backend "s3" {
    bucket         = "poastapp-terraform-state-bucket"
    key            = "k8s-template/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "my-terraform-state-lock"
  }
}

resource "helm_release" "k8s_template" {
  name       = "k8s-template"
  chart      = "./k8s-template"

  set {
    name  = "metrics.enabled"
    value = "true"
  }

  set {
    name  = "image.repository"
    value = var.image_name
  }

  set {
    name  = "image.tag"
    value = var.image_tag
  }

  set {
    name  = "secrets.ecrRegistrySecret.dockerConfigJson"
    value = var.image_pull_secret
  }

}