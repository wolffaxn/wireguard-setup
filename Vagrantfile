# -*- mode: ruby -*-
# vi: set ft=ruby :

$nocloud_iso = File.expand_path(
  "./iso/nocloud.iso",
  File.dirname(__FILE__)
)

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Ubuntu 20.04 cloud image for vagrant
  config.vm.box = "ubuntu/focal64"
  # https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-vagrant.box
  config.vm.box_version = "20201016.0.0"

  # create wireguard node
  config.vm.define :wg do |wg|
    # the hostname the machine should have
    wg.vm.hostname = "wg"

    # time in seconds that vagrant will wait for the machine to boot
    wg.vm.boot_timeout = 300
    # disable automatic box update checking
    wg.vm.box_check_update = false

    wg.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
      vb.customize ["modifyvm", :id, "--audio", "none"]
      vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
      vb.customize ["modifyvm", :id, "--nictype2", "virtio"]

      if File.exist?($nocloud_iso)
        vb.customize [
          "storageattach", :id,
          "--storagectl", "SCSI",
          "--port", "1",
          "--type", "dvddrive",
          "--medium", "#{$nocloud_iso}"
        ]
      end
    end
  end
end
