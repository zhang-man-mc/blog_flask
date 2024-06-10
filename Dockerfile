# 安装Python3基础镜像
ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}-alpine


# 设置工作目录
WORKDIR /app

COPY dist/* .

RUN python -m pip install flaskr-1.0.0-py3-none-any.whl

# 设置环境变量
ENV FLASK_APP=flaskr FLASK_ENV=development
# 创建数据库表 运行应用
RUN flask init-db

EXPOSE 8000

CMD flask run --host=0.0.0.0  --port=8000

