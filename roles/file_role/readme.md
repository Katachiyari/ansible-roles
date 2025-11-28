# 📖 README.md **file_role** – EXPLICATION DÉTAILLÉE


## 🎯 Description

Rôle Ansible utilitaire pour **gérer la création, la modification et la suppression de fichiers et de répertoires** sur les serveurs Linux, avec gestion des permissions, du propriétaire, des groupes et des options SELinux/AppArmor. Remplace le module `file` brut avec idempotence avancée et logging structuré.

**Fonctionnalités clés :**

- ✅ Création/modification/suppression de fichiers et répertoires
- ✅ Gestion des permissions, propriétaire et groupe
- ✅ Support SELinux/AppArmor
- ✅ Idempotence et logging structuré
- ✅ Notifications sur échec (optionnel)

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |

**Dépendances externes :** Aucune

***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `file_items` | list | `[]` | Liste des fichiers/répertoires à gérer |
| `file_log_dir` | str | `/var/log/ansible/file` | Répertoire logs |
| `file_force` | bool | `false` | Forcer la création même si existe |

**Structure item :**

```yaml
- path: "/tmp/test"
  state: "directory"
  owner: "root"
  group: "root"
  mode: "0755"
  selinux: "s0"
```


***

## 💡 Exemple d’utilisation

### Playbook simple (fichiers/répertoires)

```yaml
---
- name: Gérer fichiers et répertoires système
  hosts: all
  become: yes
  roles:
    - role: file_role
      vars:
        file_items:
          - path: "/tmp/test"
            state: "directory"
            owner: "root"
            group: "root"
            mode: "0755"
          - path: "/tmp/test/file.txt"
            state: "touch"
            owner: "root"
            group: "root"
            mode: "0644"
```


### Avancé (permissions SELinux)

```yaml
        file_items:
          - path: "/var/www/html"
            state: "directory"
            owner: "www-data"
            group: "www-data"
            mode: "0755"
            selinux: "httpd_sys_content_t"
```


***

## 🧪 Tests recommandés

**Vérification rapide**

```bash
# Logs
ansible all -m shell -a "ls -la /var/log/ansible/file/"

# Vérifier fichiers
ansible all -m shell -a "test -d /tmp/test && echo 'OK'"

# Test idempotence
ansible-playbook file.yml --check
```


***

## 🔄 Idempotence

```
✅ Permissions préservées
✅ Owner/group précis
✅ SELinux/AppArmor support
✅ 2ème exécution : 0 changed ✅
```


***

## 📁 Structure du rôle

```
file_role/
├── 📁 defaults/
│   └── main.yml              # Variables par défaut
├── 📁 tasks/
│   └── main.yml              # Boucle sur file_items
├── 📁 handlers/
│   └── main.yml              # Nettoyage logs temporaires
├── 📁 meta/
│   └── main.yml              # Métadonnées Galaxy
└── 📄 README.md              # Documentation
```


## 🎨 Tags disponibles

| Tag | Description |
| :-- | :-- |
| `file_manage` | Gestion fichiers/répertoires |
| `file_permissions` | Permissions/ownership |
| `file_selinux` | SELinux/AppArmor |

```bash
ansible-playbook site.yml --tags file_manage
```


## 🖥️ Compatibilité

| OS Family | Versions | Statut |
| :-- | :-- | :-- |
| Debian | 10-12 | ✅ Production |
| Ubuntu | 18.04-24.04 | ✅ Production |
| RHEL | 8-9 | ✅ Production |
| SELinux | Enforcing | ✅ Testé |

## 🔐 Sécurité

- ✅ **Permissions** 644/755 standard
- ✅ **Owner/group** précis
- ✅ **SELinux/AppArmor** support
- ✅ **Logging** structuré


## 🚀 Use Cases

1. **Création de répertoires** (logs, cache, temp)
2. **Gestion de fichiers** (configs, scripts)
3. **Permissions système** (www-data, backup)
4. **Replacement** module `file` brut

## 📈 Performance

```
Permissions : rapide
SELinux     : support natif
Overhead    : négligeable
Parallèle   : natif Ansible
```


## 🤝 Contributing

1. Fork → Ajouter validateur → Test
2. `molecule test` ✅
3. Nouveaux types : `apparmor`, `auditd`

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Logs + `ansible-playbook -vvv`
- 🚀 Features : `auditd`, `apparmor`


## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle utilitaire **essentiel** pour remplacer tous les modules `file` par une approche **sécurisée, idempotente et observable avec logging structuré**.** 📁🚀[^6][^7]
<span style="display:none">[^1][^10][^2][^3][^4][^5][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/include_role_module.html

[^2]: https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_reuse_roles.html

[^3]: https://docs.ansible.com/projects/ansible/latest/index.html

[^4]: https://fedorapeople.org/~toshio/ansible/2.9/modules/include_role_module.html

[^5]: https://acozine.github.io/html/user_guide/playbooks_reuse_roles.html

[^6]: https://www.redhat.com/en/topics/automation/what-is-an-ansible-role

[^7]: https://spacelift.io/blog/ansible-roles

[^8]: https://www.youtube.com/watch?v=yiooWsMERaY

[^9]: https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/import_role_module.html

[^10]: https://labex.io/tutorials/ansible-ansible-file-module-289654

