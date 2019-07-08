FROM python:3.6

# python envs
ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

# python dependencies
COPY requirements.txt /
RUN pip install -r ./requirements.txt --upgrade

COPY . /build
COPY config-dev.json /build/config.json
WORKDIR /build

CMD ["python", "-m", "mobiglas"]