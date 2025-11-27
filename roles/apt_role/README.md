---
- name: Installer et gérer des paquets avec apt sur Debian
  hosts: all
  become: yes

  roles:
    - role: apt_r
      vars:
        apt_packages:
          - htop
          - git
        apt_update_cache: true
        apt_upgrade: false

# Ce rôle met à jour le cache apt et installe ou met à jour la liste des paquets spécifiés.
