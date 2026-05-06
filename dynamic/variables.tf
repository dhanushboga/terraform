variable "ingress_rules" {

  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #allow from everyone
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #allow from everyone
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #allow from everyone
    },
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #allow from everyone
    },

  ]

}

variable "common_tags" {
  type = map(any)
  default = {
    Name        = "Security group for dynamic block"
    Component   = "backend"
    Environment = "dev"
  }

}

