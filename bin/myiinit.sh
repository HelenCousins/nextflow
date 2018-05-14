#!/bin/bash -e

sed -i "s/USER/$(cat /secret/IRODS_USER_NAME)/" /root/.irods/irods_environment.$
echo $(cat /secret/IRODS_PASSWORD) | iinit

rm -r /secret
