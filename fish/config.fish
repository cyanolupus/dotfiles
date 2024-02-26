if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set platform (uname -s)
if test $platform = "Darwin"
    set brew_path (ls /opt/homebrew/bin/brew 2> /dev/null)
    if test $status = 0
        eval "$($brew_path shellenv)"
    end

    set pip3_path (which pip3)
    if test $status = 0
        alias pip="$pip3_path"
    end

    bind "[1;2C" forward-word
    bind "[1;2D" backward-word
end

set cargo_path (ls $HOME/.cargo/bin 2> /dev/null)
if test $status = 0
    export PATH="$cargo_path:$PATH"
end

set deno_path (ls $HOME/.deno/bin 2> /dev/null)
if test $status = 0
    export PATH="$deno_path:$PATH"
end

set go_path (ls $HOME/go/bin 2> /dev/null)
if test $status = 0
    export PATH="$go_path:$PATH"
end

set nano_path (which nano)
if test $status = 0
    export EDITOR="$nano_path"
end

set exa_path (which exa)
if test $status = 0
    alias ls="$exa_path"
    alias la="$exa_path -a"
end

set trash_path (which trash)
if test $status = 0
    alias rm="$trash_path"
end

set tmux_path (which tmux)
if test $status = 0
    alias detach="$tmux_path detach"
end
