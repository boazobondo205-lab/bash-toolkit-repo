# portcheck.sh


A single-run shell script that checks a target host for open or closed ports - no more typing 'nc -zv', 'nmap' or 'telnet' one by one.

---
## What it checks 


| Section | Details |
|---|---|
| Target| Hostname or IP passed as an argument|
| Common Ports | 21, 22, 80, 443, 3306 (default list) |
| Port status | Open or closed per port |
| Summary | Count of open ports found |

---
## Usage


### Clone the repo


```bash

git clone https://github.com/boazobondo205-lab/bash-toolkit-repo.git
cd network
```

### Make the script executable


```bash

chmod +x portcheck.sh
```

### Run it


```bash

./portcheck.sh <host>
```
