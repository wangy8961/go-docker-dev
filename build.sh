#!/bin/bash

cd /app
# 编译，GO_BUILD_FLAGS 是可选的环境变量值
go build -o app ${GO_BUILD_FLAGS}
# 运行，APP_RUN_FLAGS 是可选的环境变量值
./app ${APP_RUN_FLAGS}