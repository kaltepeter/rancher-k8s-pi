# rancher-k8s-pi

Cloud-Init files to create a Raspberry PI based [Rancher](https://rancher.io) v2.5.7 management node that also provides local NFS storage
and a node that Rancher can manage.

Flash each SD card with Ubuntu [21.04](https://ubuntu.com/download/raspberry-pi/thank-you?version=21.04&architecture=server-arm64+raspi) and copy over the user-data file to the system-boot partition

- user-data is the cloud-init file for the Rancher Management Node and NFS Server
- user-data2 is the cloud-init file for the Rancher K8s Node

### Minimum Hardware:
2 or more Raspberry Pi 4 4GB

### Recommended Hardware:
2 or more Raspberry Pi 4 8GB

## Generating Files from templates

There is a script `generate-from-template.sh` that will take variables from your `.env` file and output a completed file. You can than redirect that output to a file system location or copy the output.

1. `cp ./.env.example ./.env` and edit env variables to fit your needs
1. For each file needed (input_file: template to process, output_file: where to write):
    1. `sh ./generate-from-template.sh <input_file>` to get output in console (test)
    1. `sh ./generate-from-template.sh <input_file> > <output_file>` to write to the <output_file> location.

### Note to use your ssh public key for access from another machine

1. To generate a key called pk8s1 (replace 127.0.0.1 with target machine ip)

    ```bash
    ssh-keygen -t rsa -C ubuntu@127.0.0.1 -f ~/.ssh/pk8s1
    cat ~/.ssh/pk8s1.pub | ssh ubuntu@127.0.0.1 'cat >> .ssh/authorized_keys'
    ```

1. `pbcopy < ~/.ssh/pk8s1.pub` This is copy to clipboard. Use that as the env var.

1. `ssh -i ~/.ssh/pk8s1 ubuntu@127.0.0.1` to login with the named key after your node is up.