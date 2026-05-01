![Laptop Revive logo](files/logo.webp)

# Laptop Revival 

## stap 0 Prerequisites

Gebruik een USB stick van 4 Gb+.
Installeer hier Ventoy op.

Kopieer vervolgens de iso files van Shredos en Linux Mint naartoe.

- https://github.com/ventoy/Ventoy
- https://github.com/PartialVolume/shredos.x86_64
- https://linuxmint.com/download.php

Tip: Controleer in het BIOS of de laptop op UEFI mode staat. Dit werkt vaak beter met de moderne Linux Mint kernels en Ansible-configuraties.

Boot van USB stick en kies voor Shredos.
Clean the disk!

Boot van USB stick en kies voor Linux Mint. 
Installeer Linux Mint.

### Update het systeem 
```bash
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
```

### Installeer git en ansible
```bash
sudo apt install git ansible -y
mkdir -p repo
cd repo
git clone https://github.com/henrydenhengst/laptoprevive.git
cd laptoprevive
```
### Belangrijke directories en files 

```
laptop-revive/
├── inventory.ini
├── stap1-inventory.yml
├── stap2-hostname.yml
├── stap3-provisioning.yml
├── files/
│   ├── laptoprevive-config.dconf
│   ├── logo.webp
│   └── transparent-panels.zip
```

## Stap 1 → hardware inventarisatie

Tijdens installatie is de juiste user al aangemaakt:
- user: laptoprevive
- pwd: zie instructie op NextCloud

Run het playbook en de hardware info staat in `/home/laptoprevive`

```bash
ansible-playbook -K stap1.yml
```

Stuur `/home/laptoprevive/     hardware-info-{{ inventory_hostname }}.txt` naar de administratie `info@laptoprevive.nl`

## Stap 2 → identiteit (hostname toekennen)

Wachten op `hostname` van de administratie.

Edit de variabelen (hostname) in stap2.yml

```bash
nano stap2.yml
ansible-playbook -i inventory.ini stap2.yml
```

## Stap 3 → Volledige provisioning via declaratieve config

```bash
ansible-playbook -i inventory.ini stap3.yml
```

### Check-out:
- Werkt het geluid?
- Werkt de webcam?
- Werkt de WiFi?

## Stap 4 → Verwijder gebruikte WiFi login

```bash
sudo bash rmwifi.sh
```
