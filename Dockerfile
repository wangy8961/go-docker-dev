FROM golang:1.12.5-stretch

# 设置代理，因为后续 go get github.com/cespare/reflex 会下载依赖 golang.org/x/sys/unix 等
ENV HTTP_PROXY='socks5://127.0.0.1:1080'
ENV HTTPS_PROXY='socks5://127.0.0.1:1080'
# 安装 reflex 包
RUN go get github.com/cespare/reflex
# 复制 reflex 的配置文件到容器中的根目录下
COPY reflex.conf /usr/src
COPY build.sh /usr/src
# 设置容器内的工作目录，用于 RUN, CMD, ENTRYPOINT, COPY, ADD 等指令
WORKDIR /app
# 容器启动时，运行 reflex -c /usr/src/reflex.conf
# 由于工作目录已切换到 /app，所以 reflex 会监控 /app 目录下的 .go 或 go.mod 文件的变化
ENTRYPOINT ["reflex", "-c", "/usr/src/reflex.conf"]