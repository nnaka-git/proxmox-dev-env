#!/usr/bin/env bash

BACKUP_DEST=/mnt/pve/ReadyNAS/dump
BACKUP_VMID=${1}

vzdump ${BACKUP_VMID} --dumpdir ${BACKUP_DEST} --compress zstd
