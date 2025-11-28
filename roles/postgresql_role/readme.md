# 📖 README.md **postgres_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **installer et configurer PostgreSQL** (serveur de base de données) sur Linux, avec gestion des utilisateurs, bases de données, sécurité et réplication.

**Fonctionnalités clés :**

- ✅ Installation PostgreSQL (12+)
- ✅ Sécurisation automatique (mot de passe admin, restrictions)
- ✅ Gestion des bases de données et utilisateurs
- ✅ Configuration avancée (replication, SSL, tuning)
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | postgresql, postgresql-client |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `postgres_version` | str | `"12"` | Version PostgreSQL |
| `postgres_admin_user` | str | `"postgres"` | Utilisateur admin |
| `postgres_admin_password` | str | `""` | Mot de passe admin |
| `postgres_databases` | list | `[]` | Bases de données à créer |
| `postgres_users` | list | `[]` | Utilisateurs à créer |
| `postgres_secure_installation` | bool | `true` | Sécurisation automatique |
| `postgres_replication_role` | str | `"none"` | `primary` ou `replica` |
| `postgres_ssl_enabled` | bool | `false` | Activer SSL |

**Structure base :**

```yaml
- name: "appdb"
  encoding: "UTF8"
```

**Structure utilisateur :**

```yaml
- name: "appuser"
  password: "AppPass456"
  priv: "appdb.*:ALL"
```


***

## 💡 Exemple d’utilisation

### Configuration basique

```yaml
---
- name: Installer PostgreSQL basique
  hosts: all
  become: yes
  roles:
    - role: postgres_role
      vars:
        postgres_admin_password: "MonMotDePasseSécurisé"
        postgres_databases:
          - name: "appdb"
            encoding: "UTF8"
        postgres_users:
          - name: "appuser"
            password: "AppPass456"
            priv: "appdb.*:ALL"
```


### Avancé (replication, SSL)

```yaml
        postgres_replication_role: "primary"
        postgres_replication_username: "replicationuser"
        postgres_replication_password: "myPassword"
        postgres_ssl_enabled: true
        postgres_ssl_ca_crt: "/path/to/ca.crt"
        postgres_ssl_server_crt: "/path/to/server.crt"
        postgres_ssl_server_key: "/path/to/server.key"
```


***

## 🧪 Tests recommandés

**Vérifier le service :**

```bash
systemctl status postgresql
```

**Vérifier les bases/utilisateurs :**

```bash
sudo -u postgres psql -c "SELECT datname FROM pg_database;"
sudo -u postgres psql -c "SELECT usename FROM pg_user;"
```

**Test idempotence :**

```bash
ansible-playbook postgres.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si aucune variable modifiée

***

## 📁 Structure du rôle

```text
postgres_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation PostgreSQL
│   ├── secure.yml        # Sécurisation
│   ├── config.yml        # Configuration bases/utilisateurs
│   └── main.yml          # Inclusion selon variables
├── templates/
│   └── postgresql.conf.j2 # Template config
├── handlers/
│   └── main.yml          # Restart PostgreSQL
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle PostgreSQL
- Sécurisation automatique
- Gestion centralisée bases/utilisateurs
- Réplication et SSL
- Idempotence et logging structuré
- Prêt pour applications critiques

***

## 🤝 Contributing

1. Fork → Ajouter gestion SSL → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `psql` + logs
- 🚀 Features : Ajout gestion backup, monitoring

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration de PostgreSQL sur toute infrastructure Linux moderne.** 🔐🚀

