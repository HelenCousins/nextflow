export IRODS_USER_NAME=$(cat /secret/IRODS_USER_NAME)
export IRODS_PASSWORD=$(cat /secret/IRODS_PASSWORD)
sed -i "s/USER/$IRODS_USER_NAME/" /root/.irods/irods_environment.json
echo $IRODS_PASSWORD | iinit

