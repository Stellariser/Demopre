# 使用不受信任的基础镜像 (不安全)
FROM some-unknown-repo/python:3.9

# 未设置用户，默认使用 root 用户 (不安全)
# RUN useradd -ms /bin/bash myuser
# USER myuser

# 使用 ADD 而不是 COPY (不安全)
WORKDIR /app
ADD . /app

# 安装未固定版本的依赖项 (不安全)
RUN pip install -r requirements.txt

# 暴露多个不必要的端口 (不安全)
EXPOSE 8080 3306 22

# 在 Dockerfile 中包含敏感信息 (不安全)
ENV DB_PASSWORD='mysecretpassword'

# 未设置 HEALTHCHECK (不安全)
# HEALTHCHECK --interval=30s --timeout=10s \
# CMD curl -f http://localhost:8080/health || exit 1

# 以特权模式运行容器 (不安全)
CMD ["python", "app.py", "--privileged"]

# 使用 root 文件系统读写权限 (不安全)
RUN echo "unsafe content" > /etc/unsafe_file

# 未设置资源限制 (不安全)
# docker run -d --memory="512m" --cpus="1" my-image
