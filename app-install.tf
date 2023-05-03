resource "null_resource" {
   count        = var.SPOT_INSTANCE_COUNT  + var.OD_INSTANCE_COUNT  

# Declaring the remote provisioner inside the resource
    provisioner "remote-exec" {
        connection {                   
            type     = "ssh"
            user     = local.SSH_USERNAME
            password = local.SSH_PASSWORD
            host     = element(local.INSTANCE_IPS, count.index)   
        }

        inline = [
            "ansible-pull -U https://github.com/b53-clouddevops/ansible.git robot-pull.yml -e ENV=${var.ENV} -e COMPONENT=${var.COMPONENT} -e VERSION=${var.APP_VERSION}"
        ]
    }
} 