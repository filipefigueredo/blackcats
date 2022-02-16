module "rg" {
  source      = "git::github.com/Nmbrs/terraform-modules//azure/resource-group?ref=1.0.0"
  project     = var.kitchen_name
  tags        = var.tags
  environment = var.environment
}
