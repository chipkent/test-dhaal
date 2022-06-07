#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
BUILD_DIR=${SCRIPT_DIR}/build
WHL_DIR=${SCRIPT_DIR}/build/wheels

mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}

[ ! -d "deephaven-core" ] && git clone git@github.com:deephaven/deephaven-core.git
cd deephaven-core
git checkout main
git pull
./gradlew prepareCompose
./gradlew :py-embedded-server:assemble

rm -rf ${WHL_DIR}
mkdir ${WHL_DIR}

cp py/embedded-server/build/wheel/deephaven_server-*.whl py/server/build/wheel/deephaven-*.whl py/jpy/build/deephaven-jpy-wheel/deephaven_jpy-*.whl ${WHL_DIR}

cd ${SCRIPT_DIR}

docker build -t dhaal .

