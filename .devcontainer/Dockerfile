# See here for image contents: https://github.com/devcontainers/templates/tree/main/src/ubuntu

FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

RUN \
    apt-get upgrade \
    && apt-get update \
    && apt-get install -y bash-completion curl python3-pip \
    # Add --break-system-packages if using noble
    && pip install pre-commit

RUN ln -s /usr/bin/python3 /usr/bin/python

# Coding only for vscode user and not root
USER vscode

RUN curl -sSL https://install.python-poetry.org | python3 - \
    && bash -c "echo 'source <(poetry completions bash)' >> ~/.bashrc"
