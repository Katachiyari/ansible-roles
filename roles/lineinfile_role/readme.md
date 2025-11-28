# 📖 README.md **lineinlife_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **modifier ou ajouter des lignes spécifiques dans des fichiers texte** (logs, configs, scripts) sur les serveurs Linux, avec gestion de l’idempotence et du backup automatique.

**Fonctionnalités clés :**

- ✅ Ajout/remplacement/suppression de lignes dans des fichiers
- ✅ Backup automatique avant modification
- ✅ Idempotence et logging structuré
- ✅ Support multi-serveurs

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
| `lineinlife_items` | list | `[]` | Liste des lignes à gérer |
| `lineinlife_backup` | bool | `true` | Backup automatique avant modification |

**Structure item :**

```yaml
- path: "/etc/motd"
  line: "Welcome to my server"
  state: "present"
  backup: true
```


***

## 💡 Exemple d’utilisation

### Ajout de lignes

```yaml
---
- name: Modifier des fichiers texte
  hosts: all
  become: yes
  roles:
    - role: lineinlife_role
      vars:
        lineinlife_items:
          - path: "/etc/motd"
            line: "Welcome to my server"
            state: "present"
            backup: true
          - path: "/etc/hosts"
            line: "192.168.1.100 myserver"
            state: "present"
            backup: true
```


### Suppression de lignes

```yaml
        lineinlife_items:
          - path: "/etc/motd"
            line: "Old line to remove"
            state: "absent"
            backup: true
```


***

## 🧪 Tests recommandés

**Vérifier les modifications :**

```bash
ansible all -m shell -a "cat /etc/motd"
```

**Vérifier le backup :**

```bash
ansible all -m shell -a "ls -la /etc/motd.*"
```

**Test idempotence :**

```bash
ansible-playbook lineinlife.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : modification = `changed`
- Exécutions suivantes : **0 changed** si ligne identique

***

## 📁 Structure du rôle

```text
lineinlife_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   └── main.yml          # Gestion des lignes
├── handlers/
│   └── main.yml          # Nettoyage backups
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Modification centralisée de fichiers texte
- Backup automatique
- Idempotence et logging structuré
- Prêt pour scripts, configs et logs

***

## 🤝 Contributing

1. Fork → Ajouter gestion regex → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `cat` + logs
- 🚀 Features : Ajout gestion regex, multi-lignes

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour la gestion de lignes dans des fichiers texte sur toute infrastructure Linux moderne.** ✍️🚀[^2][^7]
<span style="display:none">[^1][^3][^4][^5][^6][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://gitlab.com/the-common/ansible-role-template

[^2]: https://blog.stephane-robert.info/docs/infra-as-code/gestion-de-configuration/ansible/ecrire-roles/

[^3]: https://access.redhat.com/articles/7068606

[^4]: https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_reuse_roles.html

[^5]: https://forum.ansible.com/t/easy-documentation-for-roles-collection/6043

[^6]: https://galaxy.semaphoreui.com/views/epicanthal/make_role_readme

[^7]: https://spacelift.io/blog/ansible-roles

[^8]: https://github.com/bluehalo/ansible-roles/blob/master/README.md

[^9]: https://gitlab.triumf.ca/gitlab/ci/templates/-/blob/0ac078f7b42e7e2dd0b57d222b9aaf4e0cbe3760/ansible/README.md

