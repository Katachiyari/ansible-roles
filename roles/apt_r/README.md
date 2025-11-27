# Rôle Ansible apt_manage

Ce rôle gère l’installation de paquets apt sur un système Debian.

## Variables principales

- `apt_packages`: Liste des paquets apt à installer (ex: ["nginx", "curl"]).
- `apt_update_cache`: Met à jour le cache apt avant installation (booléen, défaut: true).
- `apt_upgrade`: Effectuer une mise à niveau complète des paquets (booléen, défaut: no).

## Exemple d’utilisation

---
- name: Gestion paquet apt simple
  hosts: debian_servers
  become: yes

  roles:
    - role: apt_manage
      vars:
        apt_packages:
          - htop
          - git
          - unzip
        apt_update_cache: true
        apt_upgrade: false

