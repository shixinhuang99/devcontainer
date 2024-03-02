FROM mcr.microsoft.com/devcontainers/base:bullseye

RUN apt-get update \
	&& export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
	pkg-config \
	libssl-dev \
	binaryen

USER vscode

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal

RUN . $HOME/.profile \
	&& curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash \
	&& cargo binstall --no-confirm just \
	&& cargo install taplo-cli \
	&& cargo binstall --no-confirm git-cliff \
	&& cargo install cargo-edit --bin cargo-set-version \
	&& cargo binstall --no-confirm atuin \
	&& cargo binstall --no-confirm bat \
	&& cargo binstall --no-confirm ripgrep \
	&& cargo binstall --no-confirm coreutils \
	&& cargo binstall --no-confirm fnm \
	&& fnm install 20 \
	&& fnm install 18 \
	&& fnm default 20

RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list \
	&& curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null \
	&& sudo apt update \
	&& sudo apt install -y fish

COPY ./config.fish /home/vscode/.config/fish/config.fish
