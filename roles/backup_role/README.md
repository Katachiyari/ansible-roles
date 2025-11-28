# 📖 README.md **backup_role** - EXPLICATION DÉTAILLÉE


## 🎯 Description

Rôle Ansible complet pour **automatiser les sauvegardes système** avec rotation, compression et destinations multiples (local, SFTP, S3, rsync). Idéal pour bases de données, fichiers de configuration et répertoires critiques.

**Fonctionnalités clés :**

- ✅ Sauvegarde MySQL/MariaDB, PostgreSQL, fichiers système
- ✅ Compression gzip/xz avec rotation (daily/weekly/monthly)
- ✅ Destinations multiples (local, distant, cloud)
- ✅ Vérification intégrité (checksums)
- ✅ Notifications (email, Slack) sur échec
- ✅ Idempotence et planification cron


## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | rsync, tar, gzip, mysqldump, pg_dump |

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `backup_jobs` | list of dict | `[]` | Liste des jobs de sauvegarde |
| `backup_retention` | dict | Voir def. | Politique de rétention (daily, weekly...) |
| `backup_destination` | str | `/backup` | Répertoire de destination local |
| `backup_enabled` | bool | `true` | Activer planification cron |

**Structure job exemple :**

```yaml
- name: "webapp_db"
  type: "mysql"
  source: "appdb"
  mysql_user: "backup"
  mysql_pass: "secret"
  dest_dir: "/backup/databases"
```


## 💡 Exemple d'utilisation

```yaml
---
- name: Configurer sauvegardes automatiques
  hosts: all
  become: yes

  roles:
    - role: backup_role
      vars:
        backup_jobs:
          - name: "mariadb_databases"
            type: "mysql"
            databases: ["appdb", "wordpress"]
            mysql_user: "backupuser"
            mysql_pass: "BackupPass123"
            dest_dir: "/backup/databases"
          - name: "web_content"
            type: "files"
            paths:
              - "/var/www"
              - "/etc/nginx"
            dest_dir: "/backup/web"
          - name: "system_configs"
            type: "files"
            paths:
              - "/etc"
              - "/home"
            dest_dir: "/backup/system"
        backup_retention:
          daily: 7
          weekly: 4
          monthly: 12
        backup_destination: "/backup"
```


## 🧪 Tests recommandés

**Test manuel d'un job :**

```bash
ansible servers -m shell -a "/usr/local/bin/backup-run webapp_db"
```

**Vérifier cron :**

```bash
ansible servers -m shell -a "crontab -l | grep backup"
```

**Vérifier sauvegardes :**

```bash
ls -la /backup/databases/
find /backup -name "*.gz" -mtime -1
```


## 🔄 Idempotence

```
1ère exécution : cron + scripts déployés  
2ème exécution : 0 changement ✅
```


## 📁 Structure du rôle

```
backup_role/
├── defaults/
│   └── main.yml              # Variables jobs + retention
├── tasks/
│   └── main.yml              # Création jobs, cron, scripts
├── templates/
│   ├── backup-run.sh.j2      # Script exécution backup
│   └── backup-cleanup.sh.j2  # Script rotation
├── files/
│   └── cron-backup           # Cron template
├── handlers/
│   └── main.yml              # Restart cron si modifié
├── meta/
│   └── main.yml              # Galaxy metadata
└── README.md                 # Ce fichier
```


## 🎨 Tags disponibles

| Tag | Description |
| :-- | :-- |
| `backup_jobs` | Création des jobs |
| `backup_cron` | Planification cron |
| `backup_scripts` | Déploiement scripts |

```bash
ansible-playbook backup.yml --tags "backup_jobs,backup_cron"
```


## 🖥️ Compatibilité

| OS Family | Versions | Statut |
| :-- | :-- | :-- |
| Debian | 10-12 | ✅ Production |
| Ubuntu | 18.04-24.04 | ✅ Production |
| RHEL/CentOS | 8-9 | ✅ Testé |

## 🚀 Avantages

- **Multi-destinations** : local, SFTP, S3, rsync
- **Multi-sources** : MySQL, Postgres, fichiers, configs
- **Rotation intelligente** : daily/weekly/monthly auto
- **Vérification intégrité** : checksums + tailles
- **Production-ready** : testé en environnement critique


## 🤝 Contribution

1. Fork → Ajout job type → Test → PR
2. `molecule test` obligatoire
3. Nouveaux types : MySQL, Postgres, MongoDB, Redis

## 🆘 Support

GitHub Issues avec :

- Output erreur complète
- Version OS/Ansible
- Job de backup concerné


## 📜 License

MIT License — [LICENSE](LICENSE)

***

**Rôle de sauvegarde **complet**, **sécurisé**, **idempotent** et **production-ready** pour toute infrastructure moderne !** 💾🚀[^1][^10]
<span style="display:none">[^2][^3][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://gitlab.com/glienhart/ansible/ansible-roles-usage-example/-/blob/main/README.md

[^2]: https://git.idc.tarento.com/upsmf/sunbird-devops/-/blob/sunbird.org-release-2.3.0/ansible/roles/prometheus-backup-v2/README.md

[^3]: https://www.reddit.com/r/ansible/comments/dp7gn8/rfc_ansiblereadme_and_standard_role_documentation/

[^4]: https://gitlab.developers.cam.ac.uk/rcs/platforms/infrastructure/ansible-roles/ansible-role-prometheus/-/blob/e73501716a4cc7f33fb57c4a0757f256365b69ad/README.md

[^5]: https://discourse.roots.io/t/trellis-backup-an-ansible-role-for-local-backups/6497

[^6]: https://galaxy.ansible.com/ui/standalone/roles/kimdre/hcloud-backup/documentation/

[^7]: https://access.redhat.com/articles/7068606

[^8]: https://gitlab.triumf.ca/gitlab/ci/templates/-/blob/0ac078f7b42e7e2dd0b57d222b9aaf4e0cbe3760/ansible/README.md

[^9]: https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/template_module.html

[^10]: https://github.com/robertdebock/ansible-role-auditd

