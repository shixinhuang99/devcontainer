FROM mcr.microsoft.com/devcontainers/base:bullseye

USER vscode

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal

RUN curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

RUN . $HOME/.profile && cargo binstall --no-confirm --pkg-url="https://github.com/tamasfe/taplo/releases/download/0.8.1/taplo-linux-aarch64.gz" --pkg-fmt="gz" taplo
