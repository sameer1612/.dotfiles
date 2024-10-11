# Based on [emacs-kick](https://github.com/LionyxML/emacs-kick)

## Minimum Requirements

- Emacs version **>=30**
  - You can verify your version by running:

```bash
emacs --version
```

## Installation Instructions

1. **Clone the repository**:

**Note**: If you already have an existing Emacs configuration in
`~/.emacs.d`, please back it up before proceeding. You can do this
by renaming the directory:

```bash
mv ~/.emacs.d ~/.emacs.d.backup
```

If you have any additional configurations from other Emacs
installations, please clean them up. This includes directories and
files such as `~/.emacs.d`, `~/.emacs`, `~/.emacs~`,
`~/.config/emacs`, `~/.config/doom`, `~/.config/cache/emacs` and
any other related files.

After deleting/backing up, clone the repository:

```bash
git clone https://github.com/LionyxML/emacs-kick.git ~/.emacs.d
```

2. **Run the setup**:

   After cloning, install the configuration by running:

```bash
emacs -nw --eval="(ek/first-install)"
```

Alternatively, you can run the provided script `ek-reinstall.sh`
from inside `~/.emacs.d/`, which will achieve the same result:

```bash
cd ~/.emacs.d/ && ./ek-reinstall.sh
```
