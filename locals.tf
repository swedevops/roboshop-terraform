locals {
  vpc-id = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
}

locals {
  tags = {
    business_unit = "ecommerce"
    business_type = "retails"
    project = "roboshop"
    costcenter = 200
    env = var.env

  }
}