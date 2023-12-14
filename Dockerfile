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
	&& cargo install cargo-binstall \
	&& cargo install atuin \
	&& cargo install fnm \
	&& fnm install 20 \
	&& fnm install 18 \
	&& fnm default 20

RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list \
	&& curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null \
	&& sudo apt update \
	&& sudo apt install -y fish
