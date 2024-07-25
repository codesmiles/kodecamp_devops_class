variable "nat_gw_cred" {
  description = "nat_gw__cred"
  type = object({
    tags          = string
    subnet_id        = string
    elastic_ip_id = string
  })

}
