terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = ">=0.13"
    }
  }
}
provider "proxmox" {
  # url is the hostname (FQDN if you have one) for the proxmox host you'd like to connect to to issue the commands. my proxmox host is 'prox-1u'. Add /api2/json at the end for the API
  pm_api_url = "https://172.17.97.42:8006/api2/json"
  # api token id is in the form of: <username>@pam!<tokenId>
  pm_api_token_id = "lilyan@pam!token_1"
  # this is the full secret wrapped in quotes. don't worry, I've already deleted this from my proxmox cluster by the time you read this post
  pm_api_token_secret = "10d3d661-431b-4859-82bd-67298ca95426"
  # leave tls_insecure set to true unless you have your proxmox SSL certificate situation fully sorted out (if you do, you will know)
  pm_tls_insecure = true
}


//Q2
resource "proxmox_vm_qemu" "test-vm" {
  name = "test-vm" 
  target_node = "pve"
  // On clone depuis la machine précédente
  clone = "Debian1"

  // Ici on configure les spécifications
  cores = 1
  memory = 1024

  // Ici on configure le disque
  disk {
    size = "10G"
    type = "scsi"
    storage = "local-lvm"
  }
}


// Q3
resource "proxmox_vm_qemu" "DebianCloned" {
    name = "DebianCloned"
    target_node = "pve"
    clone = "Debian1"

    // On double les coeurs
    cores = proxmox_vm_qemu.test-vm.cores * 2
    // On double la mémoire
    memory = proxmox_vm_qemu.test-vm.memory * 2

    // Ici on configure le disque
    disk {
        storage = "local-lvm"
        type = "scsi"
        size = "10G"
    }   
}


//Q4
resource "proxmox_vm_qemu" "vm1" {
  target_node = "pve"
  vmid = 101
  name = "test-vm"
  start_at_boot = true
  //delay de 60 secondes avant le démarrage de cette vm
  delay_start = 60
}

resource "proxmox_vm_qemu" "vm2" {
  target_node = "pve"
  vmid = 102
  name = "DebianCloned"
  start_at_boot = true
}


//Q7
resource "proxmox_vm_qemu" "test-vm" {
  target_node = "pve"
  //nombre de VM deployer avec "count"
  count = 10
  vmid = 101
  //nom modifié pour chaque VM
  name = "vm1-${count.index}"
}

resource "proxmox_vm_qemu" "DebianCloned" {
  target_node = "pve"
  count = 2
  vmid = 102
  name = "vm2-${count.index}"
}