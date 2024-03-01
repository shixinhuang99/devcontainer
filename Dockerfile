FROM mcr.microsoft.com/devcontainers/base:bullseye

RUN apt-get update \
	&& export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
	&& pkg-config \
	&& libssl-dev \
	&& binaryen

USER vscode

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal

RUN . $HOME/.profile \
	&& cargo install --locked just \
	&& cargo install --locked taplo-cli \
	&& cargo install --locked git-cliff \
	&& cargo install --locked cargo-edit --bin cargo-set-version \
	&& cargo install --locked atuin \
	&& cargo install --locked bat \
	&& cargo install --locked ripgrep \
	&& cargo install --locked coreutils \
	&& cargo install --locked fnm \
	&& fnm install 20 \
	&& fnm install 18 \
	&& fnm default 20

RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list \
	&& curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null \
	&& sudo apt update \
	&& sudo apt install -y fish

COPY ./config.fish /home/vscode/.config/fish/config.fish
