# 📖 README.md **iptables_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **installer et configurer iptables**, le pare-feu traditionnel Linux, sur Debian, Ubuntu, CentOS et RHEL. Permet de définir des règles de filtrage réseau (INPUT, FORWARD, OUTPUT) et de rendre la configuration persistante.

**Fonctionnalités clés :**

- ✅ Installation iptables (et iptables-persistent)
- ✅ Configuration des règles (filter, nat, mangle)
- ✅ Gestion des listes de règles (whitelist, blacklist, services)
- ✅ Rendu persistant (iptables-save/restore)
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, CentOS 8+, RHEL 8+ |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `iptables_rules` | dict | Voir exemple | Règles iptables à appliquer |
| `iptables_rules_enabled` | list | Voir exemple | Règles activées |
| `iptables_rules_default` | dict | Voir exemple | Règles par défaut |

**Exemple règles :**

```yaml
iptables_rules_default:
  initial:
    - INPUT -i lo -j ACCEPT
    - INPUT -p icmp --icmp-type echo-request -j ACCEPT
    - INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
  ssh:
    - INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT
  http:
    - INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
  reject:
    - INPUT -j REJECT --reject-with icmp-host-prohibited
```


***

## 💡 Exemple d’utilisation

### Configuration basique (SSH + HTTP)

```yaml
---
- name: Configurer iptables basique
  hosts: all
  become: yes
  roles:
    - role: iptables_role
      vars:
        iptables_rules_enabled:
          - initial
          - ssh
          - http
          - reject
```


### Avancé (whitelist, règles personnalisées)

```yaml
        iptables_rules:
          whitelist:
            - INPUT -s 192.168.1.0/24 -j ACCEPT
          custom:
            - INPUT -p tcp --dport 8443 -m state --state NEW -j ACCEPT
        iptables_rules_enabled:
          - initial
          - whitelist
          - ssh
          - http
          - custom
          - reject
```


***

## 🧪 Tests recommandés

**Vérifier les règles :**

```bash
iptables -L
```

**Vérifier la persistance :**

```bash
cat /etc/iptables/rules.v4
```

**Test idempotence :**

```bash
ansible-playbook iptables.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + règles = `changed`
- Exécutions suivantes : **0 changed** si aucune règle modifiée

***

## 📁 Structure du rôle

```text
iptables_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation iptables
│   ├── config.yml        # Configuration règles
│   └── main.yml          # Inclusion selon variables
├── handlers/
│   └── main.yml          # Sauvegarde règles
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle iptables
- Configuration centralisée règles
- Persistance automatique
- Idempotence et logging structuré
- Prêt pour serveurs critiques et clusters

***

## 🤝 Contributing

1. Fork → Ajouter règle → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `iptables -L` + logs
- 🚀 Features : Ajout gestion IPv6, règles avancées

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration d’iptables sur toute infrastructure Linux moderne.** 🔥🚀[^1][^5]
<span style="display:none">[^10][^2][^3][^4][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/skandyla/ansible-role-iptables

[^2]: https://galaxy.ansible.com/ui/repo/published/sedunne/simple/docs/iptables/

[^3]: https://projects.task.gda.pl/ansible-roles/iptables/-/blob/73f3507cf33e63fdc006da20f5f5e641673dcdd8/README.md

[^4]: https://aegis.outsilo.com/aegis/ansible-roles/iptables/-/blob/master/README.md

[^5]: https://galaxy.ansible.com/ui/repo/published/arillso/system/content/role/iptables

[^6]: https://git.selfnet.de/rapha/ansible-role-iptables/-/tree/master

[^7]: https://code.vandalsweb.com/ansible-roles/iptables

[^8]: https://github.com/geerlingguy/ansible-role-firewall/blob/master/README.md

[^9]: https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/iptables_module.html

[^10]: https://docs.rockylinux.org/10/books/learning_ansible/04-ansible-galaxy/

