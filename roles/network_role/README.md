# 📖 README.md **network_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **configurer les interfaces réseau** (Ethernet, Bridge, Bond, VLAN) sur Linux, avec gestion des IP, routes, DNS et du fournisseur (NetworkManager ou initscripts).

**Fonctionnalités clés :**

- ✅ Configuration Ethernet, Bridge, Bond, VLAN
- ✅ Gestion IP, routes, DNS
- ✅ Support NetworkManager et initscripts
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `network_provider` | str | `"nm"` | `"nm"` ou `"initscripts"` |
| `network_connections` | list | `[]` | Liste des connexions à configurer |

**Structure connexion :**

```yaml
- name: "eth0"
  type: "ethernet"
  ip:
    dhcp4: yes
  autoconnect: yes
```


***

## 💡 Exemple d’utilisation

### Ethernet (DHCP)

```yaml
---
- name: Configurer interface Ethernet
  hosts: all
  become: yes
  roles:
    - role: network_role
      vars:
        network_connections:
          - name: "eth0"
            type: "ethernet"
            ip:
              dhcp4: yes
            autoconnect: yes
```


### Bridge + VLAN

```yaml
        network_connections:
          - name: "br0"
            type: "bridge"
            ip:
              dhcp4: no
              address:
                - 192.168.1.100/24
          - name: "vlan10"
            type: "vlan"
            parent: "eth0"
            vlanid: 10
            ip:
              dhcp4: yes
```


***

## 🧪 Tests recommandés

**Vérifier les connexions :**

```bash
nmcli connection show
```

**Vérifier les routes/DNS :**

```bash
ip route show
cat /etc/resolv.conf
```

**Test idempotence :**

```bash
ansible-playbook network.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : configuration = `changed`
- Exécutions suivantes : **0 changed** si configuration identique

***

## 📁 Structure du rôle

```text
network_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── ethernet.yml      # Ethernet
│   ├── bridge.yml        # Bridge
│   ├── bond.yml          # Bond
│   ├── vlan.yml          # VLAN
│   └── main.yml          # Inclusion selon variables
├── handlers/
│   └── main.yml          # Reload network
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Configuration centralisée interfaces réseau
- Support NetworkManager/initscripts
- Idempotence et logging structuré
- Prêt pour serveurs critiques et clusters

***

## 🤝 Contributing

1. Fork → Ajouter type interface → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `nmcli connection show` + logs
- 🚀 Features : Ajout gestion wireless, routes avancées

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour la configuration des interfaces réseau sur toute infrastructure Linux moderne.** 🔌🚀[^1][^2]
<span style="display:none">[^10][^3][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/NetworkManager/ansible-network-role/blob/master/README.md

[^2]: https://galaxy.ansible.com/ui/standalone/roles/linux-system-roles/network/documentation/

[^3]: https://docs.ansible.com/projects/ansible/latest/network/getting_started/network_roles.html

[^4]: https://linux-system-roles.github.io/documentation/role-readme-md

[^5]: https://www.redhat.com/en/topics/automation/what-is-an-ansible-role

[^6]: https://forums.rockylinux.org/t/ansible-vs-networkmanager/10100

[^7]: https://gitlab.developers.cam.ac.uk/rcs/platforms/infrastructure/ansible-roles/ansible-network

[^8]: https://docs.ansible.com/projects/ansible/latest/index.html

[^9]: https://stackoverflow.com/questions/69538796/ansible-generate-docs-from-role-argument-spec

[^10]: https://www.reddit.com/r/ansible/comments/dp7gn8/rfc_ansiblereadme_and_standard_role_documentation/

