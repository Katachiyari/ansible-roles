# 📖 README.md **selinux_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **installer, configurer et gérer SELinux** sur Linux, avec gestion du mode (enforcing, permissive, disabled), des politiques et des contextes.

**Fonctionnalités clés :**

- ✅ Installation et activation de SELinux
- ✅ Configuration du mode (enforcing, permissive, disabled)
- ✅ Gestion des politiques et des contextes
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | RHEL 8+, CentOS 8+, Fedora |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `selinux_mode` | str | `"enforcing"` | `"enforcing"`, `"permissive"`, `"disabled"` |
| `selinux_policy` | str | `"targeted"` | Politique SELinux |
| `selinux_contexts` | list | `[]` | Contextes à configurer |
| `selinux_enabled` | bool | `true` | Activer/désactiver SELinux |

**Structure contexte :**

```yaml
- path: "/var/www/html"
  type: "httpd_sys_content_t"
```


***

## 💡 Exemple d’utilisation

### SELinux basique (enforcing)

```yaml
---
- name: Installer et configurer SELinux
  hosts: all
  become: yes
  roles:
    - role: selinux_role
      vars:
        selinux_mode: "enforcing"
        selinux_policy: "targeted"
        selinux_contexts:
          - path: "/var/www/html"
            type: "httpd_sys_content_t"
```


***

## 🧪 Tests recommandés

**Vérifier le mode SELinux :**

```bash
getenforce
```

**Vérifier les contextes :**

```bash
ls -laZ /var/www/html
```

**Test idempotence :**

```bash
ansible-playbook selinux.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si configuration identique

***

## 📁 Structure du rôle

```text
selinux_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation SELinux
│   ├── config.yml        # Configuration mode/politique/contextes
│   └── main.yml          # Inclusion selon variables
├── handlers/
│   └── main.yml          # Restart services
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle SELinux
- Configuration centralisée mode/politique/contextes
- Idempotence et logging structuré
- Prêt pour audits et conformité

***

## 🤝 Contributing

1. Fork → Ajouter gestion contextes → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `getenforce` + logs
- 🚀 Features : Ajout gestion modules, audit

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration de SELinux sur toute infrastructure Linux moderne.** 🔐🚀

