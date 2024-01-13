# pintos-docker-env
Use docker to build the basic environment for pintos

使用 docker 搭建 pintos 的基本环境

### 构建步骤

1. 先下载 Pintos 实验源代码到项目根目录，确保`pintos`和`Dockerfile`处于同一级目录，参考目录结构如下

   ```tree
   .
   ├── docker-compose.yml
   ├── Dockerfile
   ├── pintos
   └── README.md
   ```

   [Pintos 实验初始源代码下载](https://pintos-os.org/cgi-bin/gitweb.cgi?p=pintos-anon;a=tree;h=refs/heads/master;hb=refs/heads/master) (使用的是anon版本)

2. 在项目根目录下执行`docker build -t pintos .`命令构建  pintos 的 docker 镜像

3. 接着执行`docker-compose up -d`命令在后台启动 pintos 的 docker 容器

4. 执行`docker exec -it pintos /bin/bash`进入 pintos 容器的交互式终端进行操作



### 后续补充

1. 如果 docker 容器停止运行，重新执行`docker-compose up -d`即可重新运行容器
2. 容器使用了`bind mounts`的方式挂载本地文件到容器中，容器内的修改会直接映射到本地。不过需要注意容器内部的权限是 root，本地普通用户可能无法直接对本地文件进行操作
3. 如果需要删除容器，在项目根目录下执行`docker-compose down`命令即可
