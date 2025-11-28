# 📖 README.md **mariadb_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible complet pour **installer et configurer MariaDB** (serveur de base de données) sur Linux, avec gestion des utilisateurs, bases de données, sécurité et réplication.

**Fonctionnalités clés :**

- ✅ Installation MariaDB (10.11+)
- ✅ Sécurisation automatique (mot de passe root, suppression utilisateurs anonymes, suppression base test)
- ✅ Gestion des bases de données et utilisateurs
- ✅ Configuration avancée (replication, SSL, tuning)
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | mariadb-server, mariadb-client |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `mariadb_version` | str | `"10.11"` | Version MariaDB |
| `mariadb_admin_user` | str | `"root"` | Utilisateur admin |
| `mariadb_admin_password` | str | `""` | Mot de passe admin |
| `mariadb_databases` | list | `[]` | Bases de données à créer |
| `mariadb_users` | list | `[]` | Utilisateurs à créer |
| `mariadb_secure_installation` | bool | `true` | Sécurisation automatique |
| `mariadb_replication_role` | str | `"none"` | `primary` ou `replica` |
| `mariadb_ssl_enabled` | bool | `false` | Activer SSL |

**Structure base :**

```yaml
- name: "appdb"
  encoding: "utf8mb4"
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
- name: Installer MariaDB basique
  hosts: all
  become: yes
  roles:
    - role: mariadb_role
      vars:
        mariadb_admin_password: "MonMotDePasseSécurisé"
        mariadb_databases:
          - name: "appdb"
            encoding: "utf8mb4"
        mariadb_users:
          - name: "appuser"
            password: "AppPass456"
            priv: "appdb.*:ALL"
```


### Avancé (replication, SSL)

```yaml
        mariadb_replication_role: "primary"
        mariadb_replication_username: "replicationuser"
        mariadb_replication_password: "myPassword"
        mariadb_ssl_enabled: true
        mariadb_ssl_ca_crt: "/path/to/ca.crt"
        mariadb_ssl_server_crt: "/path/to/server.crt"
        mariadb_ssl_server_key: "/path/to/server.key"
```


***

## 🧪 Tests recommandés

**Vérifier le service :**

```bash
systemctl status mariadb
```

**Vérifier les bases/utilisateurs :**

```bash
mysql -u root -p -e "SHOW DATABASES;"
mysql -u root -p -e "SELECT User, Host FROM mysql.user;"
```

**Test idempotence :**

```bash
ansible-playbook mariadb.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si aucune variable modifiée

***

## 📁 Structure du rôle

```text
mariadb_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation MariaDB
│   ├── secure.yml        # Sécurisation
│   ├── config.yml        # Configuration bases/utilisateurs
│   └── main.yml          # Inclusion selon variables
├── templates/
│   └── my.cnf.j2         # Template config
├── handlers/
│   └── main.yml          # Restart MariaDB
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle MariaDB
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
- 🐛 Bugs : Sortie `SHOW DATABASES` + logs
- 🚀 Features : Ajout gestion backup, monitoring

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration de MariaDB sur toute infrastructure Linux moderne.** 🔐🚀[^1][^2]
<span style="display:none">[^3][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://mariadb.com/docs/server/server-management/automated-mariadb-deployment-and-administration/ansible-and-mariadb/existing-ansible-modules-and-roles-for-mariadb

[^2]: https://github.com/claranet/ansible-role-mariadb

[^3]: https://docs.ansible.com/projects/ansible/latest/collections/community/mysql/mysql_role_module.html

[^4]: https://galaxy.semaphoreui.com/it/views/claranet/ansible-role-mariadb

[^5]: https://github.com/bertvv/ansible-role-mariadb

[^6]: https://startx-ansible-services.readthedocs.io/en/latest/roles/mariadb

[^7]: https://gitlab.com/cbz-d-velop/public-ansible/ansible-role-labocbz-install-mariadb

[^8]: https://docs.ansible.com/projects/ansible/latest/collections/community/mysql/mysql_query_module.html

[^9]: https://mariadb.com/docs/server/server-management/automated-mariadb-deployment-and-administration/ansible-and-mariadb

