---
- name: Configurer les interfaces réseau avancées
  hosts: all
  become: yes

  roles:
    - role: network_role
      vars:
        network_interfaces:
          - name: eth0
            ip: "192.168.1.100"
            netmask: "255.255.255.0"
            gateway: "192.168.1.1"
            dns_servers:
              - "8.8.8.8"
              - "8.8.4.4"
          - name: eth1
            ip: "10.0.0.10"
            netmask: "255.255.255.0"
            gateway: null
            dns_servers: []
        network_manager_use: false
# Ce rôle configure les interfaces réseau statiquement via fichiers standard
# Adapté Debian et RedHat, redémarre le service réseau, prêt pour VLAN, bonding (extensible).
