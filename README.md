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

 - Can't use GPG keys
   ```bash
   error: gpg failed to sign the data:
   gpg: can't connect to the agent: End of file
   gpg: keydb_search failed: No agent running
   gpg: skipped "...": No agent running
   [GNUPG:] INV_SGNR 0 ...
   [GNUPG:] FAILURE sign ...
   gpg: signing failed: No agent running
   ```

   Make sure the `gpg-agent` is running on the host

   ```bash
   eval $(gpg-agent --daemon)
   ```

   And the GPG key has been imported

   ```bash
   gpg --list-secret-keys
   ```
