# 使用Ubuntu作为基础镜像
FROM ubuntu:18.04

# 更新Ubuntu的软件包列表
RUN apt-get update

# 安装Pintos所需的依赖
RUN apt-get install -y gcc make qemu-system clang  --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# 将你的Pintos项目目录复制到Docker容器中
COPY pintos /pintos

# 设置工作目录
WORKDIR /pintos

# 设置环境变量
ENV PATH=/pintos/src/utils:$PATH
