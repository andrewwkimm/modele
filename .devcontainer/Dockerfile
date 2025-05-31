# See here for image contents: https://hub.docker.com/r/nvidia/cuda

FROM nvidia/cuda:12.9.0-runtime-ubuntu22.04

RUN \
    apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y bash-completion curl git python3 python3-pip sudo \
    && pip install pre-commit

# Coding only for vscode user and not root
RUN groupadd --gid 1000 vscode \
    && useradd --uid 1000 --gid vscode --shell /bin/bash --create-home vscode

USER vscode

RUN curl -sSL https://install.python-poetry.org | python3 - \
    && bash -c "echo 'source <(poetry completions bash)' >> ~/.bashrc"
