if status is-interactive
    fish_add_path $HOME/.cargo/bin
    atuin init fish | source
    fnm env --use-on-cd | source
end
