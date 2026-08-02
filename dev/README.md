# Dev Scripts



## 1. run.sh


**What it does**


Compiles and runs a C/C++ source file in one step - no more typing 'gcc file.c -o file && .file' manually everytime.
Also self installs to PATH on first run to enable calling from anywhere afterward.


**Requirements**

- bash
- gcc
- g++

### Setup

**Clone repo**

```bash
git clone https://github.com/boazobondo205-lab/bash-toolkit-repo.git
cd dev
```

**Make it executable**

```bash
chmod +x run.sh
```

**Trigger PATH install**

```bash
./run.sh myfile.c
source ~/.bashrc    # relad once after first run
run.sh myfile.c    # now works from anywhere
```

***Known limitations***

- Self install writes to ~/.bashrc only. Does not support fish and zsh; fish users must manually add the PATH line to ```~/.config/fish/config.fish```
