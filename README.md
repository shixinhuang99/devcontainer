# Init

#### workspace permission

```bash
sudo chown vscode /home/vscode/workspace
```

#### reset password

```bash
sudo passwd root
```

```bash
sudo passwd vscode
```

#### fish & atuin & fnm

Add

```bash
fish_add_path $HOME/.cargo/bin
atuin init fish | source
fnm env --use-on-cd | source
```

to your `is-interactive` block in your `~/.config/fish/config.fish` file

# Known issues

 - Updating the toolchain via `rustup` will fail, you need to uninstall and reinstall manually
