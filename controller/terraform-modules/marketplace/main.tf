# Retrieve Marketplace listing Data
module "image_listing" {
  source          = "./listings"
  enabled         = var.enabled
  product_version = var.product_version
  license_model   = var.license_model //BYOL or PAID
}

## Subscribe to Marketplace listing
module "subscribe_to_listing" {
  source                      = "./subscription"
  enabled                     = var.subscribe
  compartment_id              = var.compartment_id
  mp_listing_id               = module.image_listing.listing_id
  mp_listing_resource_id      = module.image_listing.listing_resource_id
  mp_listing_resource_version = module.image_listing.listing_resource_version
}
