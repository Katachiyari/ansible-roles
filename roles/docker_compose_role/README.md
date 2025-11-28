# 📖 README.md **docker_compose_role** – EXPLICATION DÉTAILLÉE


## 🎯 Description

Rôle Ansible pour **déployer et gérer des applications Docker Compose** sur Linux. Permet de copier, templater, et lancer des fichiers `docker-compose.yml` sur n’importe quel serveur, avec gestion des fichiers de configuration, variables d’environnement et options avancées.

**Fonctionnalités clés :**

- ✅ Déploiement de fichiers `docker-compose.yml`
- ✅ Templating avancé avec variables Ansible
- ✅ Copie de fichiers de configuration et `.env`
- ✅ Lancement et gestion des services Docker Compose
- ✅ Support de la mise à jour et du redémarrage
- ✅ Idempotence et compatibilité CI/CD

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL/CentOS 8+ |
| Packages | Docker, Docker Compose (plugin ou binaire) |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `docker_compose_files` | list | `[]` | Liste des fichiers `docker-compose.yml` à déployer |
| `docker_compose_base_dir` | str | `/opt/docker-compose` | Répertoire de base pour les déploiements |
| `docker_compose_env_files` | list | `[]` | Fichiers `.env` à copier |
| `docker_compose_configs` | list | `[]` | Fichiers de configuration à copier |
| `docker_compose_options` | dict | `{}` | Options avancées pour `docker-compose up` |
| `docker_compose_enabled` | bool | `true` | Activer/désactiver le déploiement |


***

## 💡 Exemple d’utilisation

### Déploiement simple

```yaml
---
- name: Déployer application Docker Compose
  hosts: all
  become: yes

  roles:
    - role: docker_compose_role
      vars:
        docker_compose_files:
          - src: "docker-compose.yml"
            dest: "/opt/docker-compose/myapp/docker-compose.yml"
        docker_compose_env_files:
          - src: "myapp.env"
            dest: "/opt/docker-compose/myapp/.env"
        docker_compose_configs:
          - src: "config/nginx.conf"
            dest: "/opt/docker-compose/myapp/config/nginx.conf"
        docker_compose_options:
          force_recreate: true
          build: true
```


### Avancé (templating + variables)

```yaml
        docker_compose_files:
          - src: "templates/docker-compose.yml.j2"
            dest: "/opt/docker-compose/myapp/docker-compose.yml"
            vars:
              app_version: "1.2.3"
              db_host: "db.example.com"
```


***

## 🧪 Tests recommandés

**Vérifier le déploiement :**

```bash
ansible all -m shell -a "ls -la /opt/docker-compose/myapp/"
```

**Vérifier les services :**

```bash
ansible all -m shell -a "docker-compose -f /opt/docker-compose/myapp/docker-compose.yml ps"
```

**Test idempotence :**

```bash
ansible-playbook docker-compose.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : déploiement + lancement = `changed`
- Exécutions suivantes : **0 changed** si aucune variable ou fichier modifié

***

## 📁 Structure du rôle

```text
docker_compose_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── deploy.yml        # Déploiement fichiers
│   ├── config.yml        # Copie configs/env
│   ├── run.yml           # Lancement Docker Compose
│   └── main.yml          # Inclusion des tâches
├── templates/
│   └── docker-compose.yml.j2  # Exemple template
├── handlers/
│   └── main.yml          # Redémarrage si besoin
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Déploiement centralisé d’applications Docker Compose
- Templating avancé et variables dynamiques
- Gestion complète des fichiers de config et d’environnement
- Idempotence et logging structuré
- Prêt pour orchestration CI/CD

***

## 🤝 Contributing

1. Fork → Ajouter type de déploiement → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `docker-compose ps` + logs
- 🚀 Features : Ajout de nouveaux templates ou options

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour le déploiement et la gestion d’applications Docker Compose sur toute infrastructure Linux moderne.** 🐳🚀[^1][^4]
<span style="display:none">[^2][^3][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://galaxy.ansible.com/ui/repo/published/arillso/container/content/role/docker_compose/

[^2]: https://aegis.outsilo.com/aegis/ansible-roles/docker-compose/-/blob/master/README.md

[^3]: https://docs.ansible.com/projects/ansible/latest/collections/community/docker/docker_compose_module.html

[^4]: https://git.hamburg.ccc.de/CCCHH/ansible-infra/src/commit/5f6000adcadb0be3dc917f2b5aaf55b15a7f5d9d/roles/docker_compose/README.md?display=source

[^5]: https://github.com/fccn/ansible-docker-deploy

[^6]: https://www.reddit.com/r/ansible/comments/12ua0tm/docker_compose_up/

[^7]: https://forum.ansible.com/t/good-practices-ansible-github-docker-compose/38292

[^8]: https://git.hamburg.ccc.de/sophia/ansible-infra/src/commit/78837e45fe452aa1fe9a60b8c70d583f865980ed/playbooks/roles/docker_compose/README.md

[^9]: https://docs.ansible.com/projects/ansible/latest/collections/community/hashi_vault/docsite/contributor_guide.html

