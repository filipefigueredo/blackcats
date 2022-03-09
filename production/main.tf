module "rg" {
  source      = "git::github.com/Nmbrs/tf-modules//azure/resource-group?ref=main"
  name        = "rg-filipe-test-development"
  location    = local.location
  tags        = var.tags
}

module "storage_account" {
  source              = "git::github.com/Nmbrs/tf-modules//azure/storage_account?ref=main"
  name                = "sauniquename123"
  location            = "West Europe"
  resource_group_name = module.rg.name
  tags                = module.rg.tags
  account_kind        = "Storage"
  account_tier        = "Standard"
  replication_type    = "GRS"
}
