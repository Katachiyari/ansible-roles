# 📖 README.md **unarchive_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **décompresser et déployer des archives** (tar, zip, gz) sur les serveurs Linux, avec gestion des permissions, du propriétaire et du backup.

**Fonctionnalités clés :**

- ✅ Décompression d’archives (tar, zip, gz)
- ✅ Gestion des permissions, propriétaire et groupe
- ✅ Backup automatique avant extraction
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | tar, unzip |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `unarchive_files` | list | `[]` | Liste des archives à décompresser |
| `unarchive_backup` | bool | `true` | Backup avant extraction |
| `unarchive_owner` | str | `"root"` | Propriétaire des fichiers |
| `unarchive_group` | str | `"root"` | Groupe des fichiers |
| `unarchive_mode` | str | `"0644"` | Permissions des fichiers |

**Structure archive :**

```yaml
- src: "files/app.tar.gz"
  dest: "/opt/app"
  owner: "appuser"
  group: "appgroup"
  mode: "0755"
  backup: true
```


***

## 💡 Exemple d’utilisation

### Décompression basique

```yaml
---
- name: Décompresser archives
  hosts: all
  become: yes
  roles:
    - role: unarchive_role
      vars:
        unarchive_files:
          - src: "files/app.tar.gz"
            dest: "/opt/app"
            owner: "appuser"
            group: "appgroup"
            mode: "0755"
            backup: true
```


***

## 🧪 Tests recommandés

**Vérifier les fichiers extraits :**

```bash
ansible all -m shell -a "ls -la /opt/app/"
```

**Vérifier le backup :**

```bash
ansible all -m shell -a "ls -la /opt/app.*"
```

**Test idempotence :**

```bash
ansible-playbook unarchive.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : extraction = `changed`
- Exécutions suivantes : **0 changed** si archive identique

***

## 📁 Structure du rôle

```text
unarchive_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   └── main.yml          # Décompression archives
├── handlers/
│   └── main.yml          # Nettoyage backups
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Décompression centralisée archives
- Gestion permissions/backup
- Idempotence et logging structuré
- Prêt pour déploiements applicatifs et scripts

***

## 🤝 Contributing

1. Fork → Ajouter gestion backup → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `ls -la` + logs
- 🚀 Features : Ajout gestion formats, notifications

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour la décompression et le déploiement d’archives sur toute infrastructure Linux moderne.** 📦🚀

