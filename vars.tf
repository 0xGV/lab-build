

variable "api_endpoint" {
    default = "http://192.168.1.25:8006/api2/json"

}



#Input variables - read from .tfvars file

variable "token_id" {
    sensitive = true
}
variable "token_secret" {
    sensitive = true
}