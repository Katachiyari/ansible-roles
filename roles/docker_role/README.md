# 📖 README.md **docker_role** – EXPLICATION DÉTAILLÉE


## 🎯 Description

Rôle Ansible complet pour **installer et configurer Docker Engine** (CE/EE) sur Linux, avec gestion des dépôts, du daemon, des utilisateurs, de la sécurité et de la compatibilité avec les modules Ansible Docker.

**Fonctionnalités clés :**

- ✅ Installation Docker CE/EE (officiel ou distribution)
- ✅ Ajout des dépôts officiels + gestion clés GPG
- ✅ Configuration du daemon (`daemon.json`)
- ✅ Ajout d’utilisateurs au groupe `docker`
- ✅ Support Docker Compose (plugin ou binaire)
- ✅ Idempotence et compatibilité CI/CD

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL/CentOS 8+ |
| Python | ≥ 3.6 (pour modules Docker) |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `docker_edition` | string | `"ce"` | `"ce"` (Community) ou `"ee"` (Enterprise) |
| `docker_packages_state` | string | `"present"` | `"present"`, `"latest"`, `"absent"` |
| `docker_users` | list | `[]` | Utilisateurs à ajouter au groupe `docker` |
| `docker_daemon_options` | dict | `{}` | Options pour `/etc/docker/daemon.json` |
| `docker_install_compose` | bool | `true` | Installer Docker Compose (plugin ou binaire) |
| `docker_add_repo` | bool | `true` | Ajouter le dépôt Docker officiel |
| `docker_service_manage` | bool | `true` | Gérer le service Docker |


***

## 💡 Exemple d’utilisation

### Docker CE standard

```yaml
---
- name: Installer Docker CE
  hosts: docker_nodes
  become: yes

  roles:
    - role: docker_role
      vars:
        docker_edition: "ce"
        docker_users:
          - "deploy"
          - "ci"
        docker_daemon_options:
          storage-driver: "overlay2"
          log-driver: "json-file"
          log-opts:
            max-size: "100m"
            max-file: "3"
        docker_install_compose: true
```


### Docker EE (Enterprise)

```yaml
---
- name: Installer Docker EE
  hosts: prod_nodes
  become: yes

  roles:
    - role: docker_role
      vars:
        docker_edition: "ee"
        docker_users:
          - "admin"
        docker_daemon_options:
          storage-driver: "overlay2"
          live-restore: true
```


***

## 🧪 Tests recommandés

**Docker installé :**

```bash
systemctl status docker
docker info
```

**Utilisateurs dans le groupe docker :**

```bash
getent group docker
```

**Test run container :**

```bash
docker run --rm hello-world
```

**Ansible / idempotence :**

```bash
ansible-playbook docker.yml
ansible-playbook docker.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : install + config + service = `changed`
- Exécutions suivantes : **0 changed** si aucune variable modifiée

***

## 📁 Structure du rôle

```text
docker_role/
├── defaults/
│   └── main.yml          # Variables par défaut (edition, options)
├── tasks/
│   ├── install.yml       # Installation Docker
│   ├── config.yml        # Configuration daemon + users
│   └── main.yml          # Inclusion selon variables
├── templates/
│   └── daemon.json.j2   # Template daemon.json
├── handlers/
│   └── main.yml          # Restart Docker
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle Docker CE/EE
- Configuration centralisée du daemon
- Gestion des utilisateurs et des permissions
- Support Docker Compose intégré
- Idempotence et logging structuré
- Prêt pour orchestration Kubernetes ou Swarm

***

## 🤝 Contributing

1. Fork → Modifier config → Test
2. `molecule test` ✅
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : `docker info` + logs
- 🚀 Features : Ajout de nouveaux modules Docker

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration de Docker Engine sur toute infrastructure Linux moderne.** 🐳🚀[^1][^5]
<span style="display:none">[^2][^3][^4][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/geerlingguy/ansible-role-docker

[^2]: https://docs.ansible.com/projects/ansible/latest/collections/community/docker/docsite/scenario_guide.html

[^3]: https://www.rubydoc.info/gems/ansible-role/1.1.0

[^4]: https://gitlab.com/ansible-roles543108/docker-role

[^5]: https://spacelift.io/blog/ansible-docker

[^6]: https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_reuse_roles.html

[^7]: https://gitlab.with.de/ansible/ansible-role-docker-container/-/tree/d731957588a8a24999cb774b4acc375e12762323

[^8]: https://git.idc.tarento.com/upsmf/sunbird-devops/-/blob/d2c9676d43d9d22ccb1efb3aaf38be385e8dd4f6/ansible/roles/docker-ce/README.md

[^9]: https://gitlab.developers.cam.ac.uk/rcs/platforms/infrastructure/ansible-roles/ansible-role-prometheus/-/blob/e73501716a4cc7f33fb57c4a0757f256365b69ad/README.md

