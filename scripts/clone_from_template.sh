#!/usr/bin/env bash

# 9000: Almalinux template
TEMPLATE_VMID=9000
CLONE_VMID=${1}
CLONE_VMNAME=${2}

# clone from template
qm clone ${TEMPLATE_VMID} ${CLONE_VMID} --name "${CLONE_VMNAME}" --full true

# set compute resources
qm set ${CLONE_VMID} --cores 2 --memory 4096

# resize disk (Resize after cloning, because it takes time to clone a large disk)
qm resize ${CLONE_VMID} scsi0 100G

# set snippet to vm
qm set ${CLONE_VMID} --cicustom "user=local:snippets/${CLONE_VMNAME}-user.yaml,network=local:snippets/${CLONE_VMNAME}-network.yaml"
qm start ${CLONE_VMID}