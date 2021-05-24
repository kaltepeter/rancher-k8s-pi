# H1 Cloud-Init Files

These are the cloud-init files for creating the Rancher Management Node and the Rancher Node.

- user-data - Rancher Management node
- user-data2 - Rancher K8s Node

## Generate Config Files (optional)

Replace `/Volumes/system-boot` with your disk location. It should end up in the root of the sd card.

1. Use static ip and wifi config

    For the rancher-mgmt:

    `sh ./generate-from-template.sh ./cloud-init/network-config-mgmt.template > /Volumes/system-boot/network-config` to write to a location.

    For the rancher-node:

    `sh ./generate-from-template.sh ./cloud-init/network-config-node.template > /Volumes/system-boot/network-config` to write to a location.

1. Use ssh key auth

    For the rancher-mgmt:
    
    `sh ./generate-from-template.sh ./cloud-init/user-data-mgmt.template > /Volumes/system-boot/user-data` to write to a location.    

    For the rancher-node:

    `sh ./generate-from-template.sh ./cloud-init/user-data-node.template > /Volumes/system-boot/user-data` to write to a location.
