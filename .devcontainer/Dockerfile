# See here for image contents: https://github.com/devcontainers/templates/tree/main/src/ubuntu

FROM mcr.microsoft.com/devcontainers/base:jammy

# RUN \
#     apt-get update \
#     && apt-get upgrade -y \
#     && apt-get install -y <package-name>

# Coding only for vscode user and not root
USER vscode

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv
