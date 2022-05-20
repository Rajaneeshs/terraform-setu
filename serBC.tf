resource "aws_instance" "servB" {
	count                   = "${var.servB_count}"
	ami                     = "${var.ami_id}"
	instance_type           = "${var.instance_size}"
	subnet_id               = "${element(module.vpc.private_subnets, count.index)}"
	key_name                = "${var.aws_key_name}"
	vpc_security_group_ids  = [ "${aws_security_group.servB.id}" ]
	root_block_device = {
				volume_size = "var.volume_size"
				volume_type = "var.volume_type"
			    }
	user_data               = <<-EOF
#!/bin/bash
mkdir -p /etc/ansible/facts.d
EOF

resource "aws_instance" "servC" {
	count                   = "${var.servC_count}"
	ami                     = "${var.ami_id}"
	instance_type           = "${var.instance_size}"
	subnet_id               = "${element(module.vpc.private_subnets, count.index)}"
	key_name                = "${var.aws_key_name}"
	vpc_security_group_ids  = [ "${aws_security_group.servC.id}" ]
	root_block_device = {
				volume_size = "var.volume_size"
				volume_type = "var.volume_type"
			    }
	user_data               = <<-EOF
#!/bin/bash
mkdir -p /etc/ansible/facts.d
EOF
