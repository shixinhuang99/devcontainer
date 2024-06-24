# Init

#### workspace permission

```sh
sudo chown vscode /home/vscode/workspace
```

#### reset password

```sh
sudo passwd root
```

```sh
sudo passwd vscode
```

#### fish

Add

```sh
fish_add_path $HOME/.cargo/bin
atuin init fish | source
fnm env --use-on-cd | source
```

to your `is-interactive` block in your `~/.config/fish/config.fish` file

# Manually install the following tools because using QEMU during the image building stage results in very long compilation times

```sh
cargo install atuin
cargo install cargo-edit --no-default-features --features set-version
cargo install taplo-cli
```

# Known issues

- Updating the toolchain via `rustup` will fail, you need to uninstall and reinstall manually

- Can't use GPG keys

  ```sh
  error: gpg failed to sign the data:
  gpg: can't connect to the agent: End of file
  gpg: keydb_search failed: No agent running
  gpg: skipped "...": No agent running
  [GNUPG:] INV_SGNR 0 ...
  [GNUPG:] FAILURE sign ...
  gpg: signing failed: No agent running
  ```

  Make sure the `gpg-agent` is running on the host

  ```sh
  eval $(gpg-agent --daemon)
  ```

  And the GPG key has been imported

  ```sh
  gpg --list-secret-keys
  ```
