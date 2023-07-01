variable "vpc_security_group_ids" {
  type = map(list(string))
  default = {
    "name"     = ["sg-xxd36xxxxx36fdxxx"]
   # "jf-master-pd-gov" = ["sg-7f051404"]
  }
}