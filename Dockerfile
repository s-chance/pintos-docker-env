# 使用Ubuntu作为基础镜像
FROM ubuntu:18.04

# 更新Ubuntu的软件包列表，安装Pintos所需的依赖
# 克隆并安装fzf到/usr/local
RUN apt-get update && \
    apt-get install -y vim gcc make gdb qemu-system clang git curl wget ca-certificates --no-install-recommends && \
    git clone --depth 1 https://github.com/junegunn/fzf.git /usr/local/fzf && \
    /usr/local/fzf/install --all && \
    rm -rf /var/lib/apt/lists/*

# 将你的Pintos项目目录复制到Docker容器中，设置工作目录，设置环境变量
COPY pintos /pintos
WORKDIR /pintos
ENV PATH=/pintos/src/utils:$PATH
