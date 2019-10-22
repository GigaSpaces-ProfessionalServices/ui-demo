#!/usr/bin/env bash
DIRNAME=$(dirname ${BASH_SOURCE[0]})



if [[ -z "${GS_DIR}" ]]; then
    echo "GS_DIR environment variable is not set"
    exit 1
fi


#SERVER=""

if [[ -n "${SERVER}" ]]; then
   SERVER_PARAM="--server=${SERVER}"
fi




${GS_DIR}/bin/gs.sh pu deploy --partitions=10 --backups=1 --max-instances-per-vm=1 products-catalog ${DIRNAME}/products-catalog/target/products-catalog.jar

${GS_DIR}/bin/gs.sh pu deploy products-loader ${DIRNAME}/products-loader/target/products-loader.jar

${GS_DIR}/bin/gs.sh pu deploy products-feeder ${DIRNAME}/products-feeder/target/products-feeder.jar
