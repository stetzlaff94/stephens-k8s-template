# stephens-k8s-template
Generic k8s-template that uses Helm to deploy a Go app

## Prerequisites
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Usage
1. Clone this repo
2. Run `terraform init` in the repo/terraform directory. This will initialize the terraform module to create one-time resources for the rpo
3. Run `terraform apply` in the repo/terraform directory to apply
4. Configure github actions with AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
5. rename "k8s-template" accordingly if desired
6. push to main branch to trigger github action

## Notes
This deployment pipeline uses terraform to apply a custom helm chart to launch an application. 
It should work out of the box, but allows for use-case specific modification

This assumes we are using AWS for our image registry, but can be modified to use any registry
It is helpful to set up a remote provider for terraform as well