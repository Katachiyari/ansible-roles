<<<<<<< HEAD
# 📖 README.md **con_job_role** – EXPLICATION DÉTAILLÉE
=======
# 📖 README.md **cron_job_role** – EXPLICATION DÉTAILLÉE
>>>>>>> 893a5ea5c1a6c1e5e3dee1f999647e564e2735bf


## 🎯 Description

Rôle Ansible pour **gérer la création, la modification et la suppression de jobs cron** sur Linux, de façon centralisée, idempotente et sécurisée. Permet de déployer des tâches automatisées (backup, nettoyage, monitoring) sur tous vos serveurs.

**Fonctionnalités clés :**

- ✅ Création/modification/suppression de jobs cron
- ✅ Gestion multi-users (root, admin, custom)
- ✅ Syntaxe cron standard (minute, hour, day, month, weekday)
- ✅ Idempotence totale (aucune modification inutile)
- ✅ Logging structuré et notifications


## 📋 Requirements

| Requirement | Version | Notes |
| :-- | :-- | :-- |
| Ansible | ≥2.10 | Testé 2.14+ |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |  |

**Dépendances externes :** Aucune

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `cron_jobs` | list | `[]` | Liste des jobs à déployer |
| `cron_enabled` | bool | `true` | Activer/désactiver la gestion cron |

**Structure job :**

```yaml
- name: "Backup quotidien"
  user: "root"
  minute: "0"
  hour: "2"
  day: "*"
  month: "*"
  weekday: "*"
  job: "/usr/local/bin/backup.sh"
```


## 💡 Exemple d'utilisation

```yaml
---
- name: Déployer jobs cron système
  hosts: all
  become: yes
  roles:
    - role: con_job_role
      vars:
        cron_jobs:
          - name: "Nettoyer /tmp"
            user: "root"
            minute: "0"
            hour: "0"
            job: "find /tmp -mtime +7 -delete"
          - name: "Backup MySQL"
            user: "backup"
            minute: "0"
            hour: "3"
            job: "/usr/local/bin/mysql-backup.sh"
        cron_enabled: true
```


## 🧪 Tests recommandés

**Vérifier les jobs :**

```bash
ansible all -m shell -a "crontab -l"
```

**Vérifier le service :**

```bash
ansible all -m service_facts -a "name=cron"
```

**Test idempotence :**

```bash
ansible-playbook cron.yml --check
```


## 🔄 Idempotence

```
1ère exécution : jobs créés ✅
2ème exécution : 0 changement ✅
```


## 📁 Structure du rôle

```
con_job_role/
├── defaults/
│   └── main.yml              # Variables par défaut
├── tasks/
│   └── main.yml              # Création/suppression jobs
├── handlers/
│   └── main.yml              # Reload cron si modifié
├── meta/
│   └── main.yml              # Métadonnées Galaxy
└── README.md                 # Documentation
```


## 🎨 Tags disponibles

| Tag | Description |
| :-- | :-- |
| `cron_jobs` | Gestion des jobs cron |
| `cron_service` | Gestion du service cron |

```bash
ansible-playbook site.yml --tags cron_jobs
```


## 🖥️ Compatibilité

| OS Family | Versions | Statut |
| :-- | :-- | :-- |
| Debian | 10-12 | ✅ Production |
| Ubuntu | 18.04-24.04 | ✅ Production |
| RHEL | 8-9 | ✅ Production |

## 🔐 Sécurité

- ✅ **Permissions** strictes sur fichiers cron
- ✅ **User** configurable pour chaque job
- ✅ **Validation** syntaxe cron


## 🚀 Avantages

- Gestion centralisée des tâches automatisées
- Idempotence et logging
- Compatible tous OS Linux modernes
- Intégration facile dans pipelines CI/CD


## 🤝 Contribution

1. Fork → Ajouter job type → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

## 🆘 Support

- GitHub Issues avec :
    - Sortie crontab
    - Version OS/Ansible
    - Job concerné


## 📜 License

MIT License — [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour la gestion des jobs cron sur toute infrastructure Linux moderne.** 🕒🚀[^1][^6]
<span style="display:none">[^2][^3][^4][^5][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://git.thesatelliteoflove.com/phil/ansible/src/commit/ace5fc1d1823e32d2be825f951fe42b3b63cee4f/roles/cron/README.md

[^2]: https://forum.ansible.com/t/easy-documentation-for-roles-collection/6043

[^3]: https://dev.to/lovestaco/automating-cron-job-setup-with-ansible-like-a-pro-4kgg

[^4]: https://codebase.helmholtz.cloud/datahub/marehub/ag-videosimages/ansible-role-centos-pkg-cron/-/blob/ae307b906b79afdd03a719ef57683a8ffcf6a967/README.md

[^5]: https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_reuse_roles.html

[^6]: https://github.com/boutetnico/ansible-role-cron

[^7]: https://ansible-runner-role.readthedocs.io/en/latest/example1-cron.html

[^8]: https://labex.io/tutorials/ansible-how-to-ensure-a-cron-job-is-properly-created-in-ansible-415128

[^9]: https://code.imphub.org/projects/KUBE/repos/openshift-ansible/browse/examples/README.md?at=feb9303d5d8e065ef2c659a14f5ee22294360704

