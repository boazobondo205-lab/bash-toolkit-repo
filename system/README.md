# System scripts


## 1. sysinfo.sh

A single-run shell script that prints a full system snapshot to the terminal — no more typing `whoami`, `df -h`, `ip a` one by one.

---

### What It Shows

| Section | Details |
|---|---|
| **Identity** | User, UID/GID, hostname, working directory |
| **System** | OS, kernel, architecture, uptime, load average |
| **CPU** | Model, core count, architecture |
| **Memory** | RAM and swap — used vs total |
| **Disk** | Usage per mount point with color-coded thresholds |
| **Block Devices** | Disk layout via `lsblk` |
| **Network** | Active interfaces, IPs, default gateway |
| **Listening Ports** | All open/listening ports via `ss` |
| **Top Processes** | Top 10 processes sorted by CPU usage |
| **Sessions** | Who's logged in + last 5 logins |
| **Environment** | Shell, terminal, editor, PATH entry count |

---

### Usage

#### 1. Clone the repo

```bash
git clone https://github.com/boazobondo205-lab/bash-toolkit-repo.git
cd system
```

#### 2. Make the script executable

```bash
chmod +x sysinfo.sh
```

#### 3. Run it

```bash
./sysinfo.sh
```

---

### Optional: Run on every terminal open

Add this to your `~/.bashrc` or `~/.zshrc`:

```bash
~/path/to/sysinfo.sh
```

Or create an alias:

```bash
alias sysinfo='~/path/to/sysinfo.sh'
```

---

### Requirements

- Bash 4+
- Standard Linux tools: `ip`, `ss`, `lscpu`, `lsblk`, `ps`, `free`, `df`, `last`, `who`
- Works on Debian/Ubuntu, Arch/Garuda, Kali, and most Linux distros

---

## Author

**Boaz** — (https://github.com/boazobondo205-lab)
