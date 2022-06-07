#!/bin/bash

if [ -z "${DHC_ROOT}" ] 
then
	echo "Please set \$DHC_ROOT to your Deephaven repository"
        exit -1
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
WHL_DIR=${SCRIPT_DIR}/wheels

cd ${DHC_ROOT}

./gradlew prepareCompose
./gradlew :py-embedded-server:assemble

rm -rf ${WHL_DIR}
mkdir ${WHL_DIR}

cp py/embedded-server/build/wheel/deephaven_server-*.whl py/server/build/wheel/deephaven-*.whl py/jpy/build/deephaven-jpy-wheel/deephaven_jpy-*.whl ${WHL_DIR}

cd ${SCRIPT_DIR}

docker build -t dhaal .

