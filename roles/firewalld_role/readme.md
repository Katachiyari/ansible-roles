# 📖 README.md **firewalld_role** – EXPLICATION DÉTAILLÉE


## 🎯 Description

Rôle Ansible complet pour **installer et configurer firewalld**, le gestionnaire de pare-feu moderne sur RHEL, CentOS, Fedora et autres distributions utilisant firewalld. Permet de définir zones, services, ports, règles de routage et politiques de sécurité de façon centralisée, idempotente et sécurisée.

**Fonctionnalités clés :**

- ✅ Installation et activation de firewalld
- ✅ Gestion des zones (public, internal, etc.)
- ✅ Ajout/suppression de services et ports
- ✅ Gestion des sources IP/réseaux
- ✅ Politiques de routage et redirection
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | RHEL 8+, CentOS 8+, Fedora, Rocky Linux, AlmaLinux |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `firewalld_enabled` | bool | `true` | Activer/désactiver firewalld |
| `firewalld_default_zone` | str | `"public"` | Zone par défaut |
| `firewalld_zones` | list | Voir exemple | Liste des zones à configurer |
| `firewalld_services` | list | Voir exemple | Services à autoriser |
| `firewalld_ports` | list | Voir exemple | Ports à ouvrir |
| `firewalld_sources` | list | Voir exemple | Sources IP/réseaux |
| `firewalld_masquerade` | bool | `false` | Activer le masquage |
| `firewalld_forward_ports` | list | Voir exemple | Redirections de ports |

**Exemple zones :**

```yaml
- name: "internal"
  state: "enabled"
  sources:
    - "192.168.1.0/24"
```


***

## 💡 Exemple d’utilisation

### Configuration basique (public + SSH)

```yaml
---
- name: Configurer firewalld basique
  hosts: all
  become: yes
  roles:
    - role: firewalld_role
      vars:
        firewalld_enabled: true
        firewalld_zones:
          - name: "public"
            state: "enabled"
        firewalld_services:
          - name: "ssh"
            zone: "public"
            state: "enabled"
        firewalld_ports:
          - port: "80"
            protocol: "tcp"
            zone: "public"
            state: "enabled"
```


### Avancé (zones, sources, redirection)

```yaml
        firewalld_zones:
          - name: "internal"
            state: "enabled"
            sources:
              - "192.168.1.0/24"
          - name: "dmz"
            state: "enabled"
            sources:
              - "10.0.0.0/8"
        firewalld_services:
          - name: "http"
            zone: "public"
            state: "enabled"
        firewalld_forward_ports:
          - zone: "public"
            port: "8080"
            protocol: "tcp"
            to_port: "80"
            to_addr: "192.168.1.10"
```


***

## 🧪 Tests recommandés

**Vérifier le service :**

```bash
systemctl status firewalld
```

**Vérifier les règles :**

```bash
firewall-cmd --list-all-zones
firewall-cmd --list-services
```

**Test idempotence :**

```bash
ansible-playbook firewalld.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si aucune variable modifiée

***

## 📁 Structure du rôle

```text
firewalld_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation firewalld
│   ├── config.yml        # Configuration zones/services/ports
│   └── main.yml          # Inclusion selon variables
├── handlers/
│   └── main.yml          # Reload firewalld
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle firewalld
- Configuration centralisée zones/services/ports
- Politiques de routage et redirection
- Idempotence et logging structuré
- Prêt pour serveurs critiques et clusters

***

## 🤝 Contributing

1. Fork → Ajouter zone/service → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `firewall-cmd --list-all-zones` + logs
- 🚀 Features : Ajout de nouveaux services ou zones

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration de firewalld sur toute infrastructure Linux moderne.** 🔥🚀[^1][^3]
<span style="display:none">[^10][^2][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/ryandaniels/ansible-role-firewalld

[^2]: https://gitlab.hpc.taltech.ee/hpc-public/ansible/roles/ansible-firewalld/-/blob/master/README.md

[^3]: https://galaxy.ansible.com/ui/repo/published/fedora/linux_system_roles/content/role/firewall/

[^4]: https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/7/html/automating_system_administration_by_using_rhel_system_roles_in_rhel_7.9/assembly_configuring-firewalld-using-system-roles_automating-system-administration-by-using-rhel-system-roles

[^5]: https://ryandaniels.ca/blog/ansible-manage-firewalld/

[^6]: https://gitlab.com/ifb-elixirfr/ansible-roles/ansible-firewalld

[^7]: https://docs.ansible.com/projects/ansible/latest/collections/ansible/posix/firewalld_module.html

[^8]: https://blog.stephane-robert.info/docs/infra-as-code/gestion-de-configuration/ansible/ecrire-roles/

[^9]: https://gitlab.nics.utk.edu/ops-public/ansible-code/nics_firewalld_role/-/blob/main/nics_firewalld/.gitkeep

[^10]: https://gitlab.agetic.gob.bo/oscar.flores/alta-disponibilidad-postgresql/-/blob/main/automation/roles/ansible-role-firewall/README.md

