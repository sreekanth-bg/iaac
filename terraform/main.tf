resource "google_compute_instance" "raddit" {
  name         = "raddit-instance"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"

  # boot disk specifications
  boot_disk {
    initialize_params {
      image = "raddit-base" // use image built with Packer
    }
  }

  # networks to attach to the VM
  network_interface {
    network = "default"
    access_config {} // use ephemaral public IP
  }

  connection {
    host        = "${google_compute_instance.raddit.network_interface.0.access_config.0.nat_ip}"
    #type        = "ssh"
    user        = "raddit-user"
    private_key = "${file("~/.ssh/raddit-user")}"
  }

  provisioner "remote-exec" {
    # Install Ansible
    inline = [
      #"sudo apt-add-repository -y ppa:ansible/ansible",
      "sudo apt-get -y update",
      "sudo apt-get -y install ansible",
    ]
  }

  provisioner "file" {
    source      = "../ansible"
    destination = "/home/raddit-user/"
  }

  provisioner "remote-exec" {
    inline = [
      "ansible-playbook -v /home/raddit-user/ansible/deploy.yml"
    ] 
  }

}

resource "google_compute_firewall" "raddit" {
  name    = "allow-raddit-tcp-9292"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9292", "22"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_project_metadata" "raddit" {
  metadata = {
    ssh-keys = "raddit-user:${file("~/.ssh/raddit-user.pub")}" // path to ssh key file
  }
}

