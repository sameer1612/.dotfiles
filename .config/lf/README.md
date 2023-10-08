# Setup

Copy and paste to your `.bashrc` or `.zshrc`.

```bash
if type lf &> /dev/null; then
    # Set up icons
    LF_ICONS=$(sed $HOME/.config/lf/icons \
                -e '/^[ \t]*#/d'         \
                -e '/^[ \t]*$/d'         \
                -e 's/[ \t]\+/=/g'       \
                -e 's/$/ /')
    LF_ICONS=${LF_ICONS//$'\n'/:}
    export LF_ICONS

    # Set up lfcd
    LFCD="$HOME/.config/lf/scripts/lfcd.sh"
    if [ -f "$LFCD" ]; then
        source "$LFCD"
        bindkey -s "^o" "lfcd\n"  # set up key-binding for zsh
        # bind '"\C-o":"lfcd\C-m"'  # set up key-binding for bash
        alias lf=lfcd  # overwrite lf with lfcd
    fi
fi
```
