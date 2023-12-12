# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/devcontainers/base:bullseye

USER vscode

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal

RUN . $HOME/.profile \
	&& cargo install just \
	&& cargo install taplo-cli \
	&& cargo install git-cliff \
	&& cargo install crm \
	&& cargo install cargo-edit --features vendored-openssl --bin cargo-set-version \
	&& cargo install fnm \
	&& fnm install 20 \
	&& fnm install 18 \
	&& fnm default 20

COPY init.sh /home/vscode/init.sh
