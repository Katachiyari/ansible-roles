# 📖 **container_runtime_role**


## 🎯 Description

Rôle Ansible complet pour **installer et configurer un runtime de conteneurs** (Docker ou containerd) sur Linux, avec gestion des dépôts, du daemon, des utilisateurs et de la sécurité.

**Fonctionnalités clés :**

- ✅ Installation **Docker CE** ou **containerd** selon variable
- ✅ Configuration du daemon (`daemon.json` ou `config.toml`)
- ✅ Gestion des dépôts officiels (APT/YUM) et clés GPG
- ✅ Ajout d’utilisateurs au groupe `docker` (si Docker)
- ✅ Support rootless (optionnel, Docker)
- ✅ Idempotence et ready pour CI/CD / Kubernetes nodes

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 20.04+, RHEL/CentOS 8+ |
| Kernel | cgroups v1/v2 support |


***

## ⚙️ Variables (defaults/main.yml)

### Sélection du runtime

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `container_runtime` | string | `"docker"` | `docker` ou `containerd` |

### Docker

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `docker_edition` | string | `"ce"` | `ce` ou `ee` |
| `docker_packages_state` | string | `"present"` | `present` / `latest` / `absent` |
| `docker_users` | list | `[]` | Utilisateurs à ajouter au groupe `docker` |
| `docker_daemon_options` | dict | `{}` | Contenu de `/etc/docker/daemon.json` |
| `docker_enable_rootless` | bool | `false` | Activer mode rootless si supporté |

### containerd

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `containerd_packages_state` | string | `"present"` | État des paquets |
| `containerd_config` | dict | `{}` | Options pour `config.toml` généré |
| `containerd_systemd_cgroup` | bool | `true` | `SystemdCgroup=true` pour Kubernetes |


***

## 💡 Exemples d’utilisation

### 1. Docker CE standard

```yaml
---
- name: Installer Docker CE runtime
  hosts: docker_nodes
  become: yes

  roles:
    - role: container_runtime_role
      vars:
        container_runtime: "docker"
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
```


### 2. containerd pour nœuds Kubernetes

```yaml
---
- name: Installer containerd pour cluster Kubernetes
  hosts: k8s_nodes
  become: yes

  roles:
    - role: container_runtime_role
      vars:
        container_runtime: "containerd"
        containerd_systemd_cgroup: true
        containerd_config:
          sandbox_image: "registry.k8s.io/pause:3.9"
```


***

## 🧪 Tests recommandés

**Docker :**

```bash
# Service
systemctl status docker

# Test run
docker run --rm hello-world
```

**containerd :**

```bash
systemctl status containerd
ctr version
ctr images ls
```

**Ansible / idempotence :**

```bash
ansible-playbook container-runtime.yml
ansible-playbook container-runtime.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : install + config + service = `changed`
- Exécutions suivantes : **0 changed** si aucune variable modifiée

***

## 📁 Structure du rôle

```text
container_runtime_role/
├── defaults/
│   └── main.yml          # Variables par défaut (runtime, options)
├── tasks/
│   ├── docker.yml        # Installation & config Docker
│   ├── containerd.yml    # Installation & config containerd
│   └── main.yml          # Include selon container_runtime
├── templates/
│   ├── daemon.json.j2    # Config Docker
│   └── containerd.toml.j2# Config containerd
├── handlers/
│   └── main.yml          # Restart services
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Un **seul rôle** pour gérer Docker et containerd
- Conforme aux bonnes pratiques (séparation defaults/tasks/templates, handlers, meta)[^11][^12]
- Prêt pour utilisation comme **base de nodes Kubernetes**, CI runners, ou hosts de conteneurs généraux
- Facilement extensible (ajout d’autres runtimes type CRI-O si besoin)

Si tu veux, le prochain message peut détailler le `defaults/main.yml` et un `tasks/main.yml` minimal cohérent avec ce README.
<span style="display:none">[^1][^10][^2][^3][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/rolehippie/docker

[^2]: https://github.com/mstrohl/ansible-docker-containers-role

[^3]: https://docs.ansible.com/projects/ansible/latest/collections/community/docker/docker_container_module.html

[^4]: https://ansible-runner.readthedocs.io/_/downloads/en/stable/pdf/

[^5]: https://github.com/geerlingguy/ansible-role-docker

[^6]: https://github.com/ansible

[^7]: https://gitlab.oit.duke.edu/oit-ssi-systems/openshift/openshift-ansible/-/blob/master/openshift-ansible.spec

[^8]: https://www.linkedin.com/posts/dylan-dufresne-solutions_systemarchitecture-ignitionscada-iiot-activity-7376719114062475264-cMKu

[^9]: https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/include_role_module.html

[^10]: https://github.com/docsible/docsible

[^11]: https://blog.stephane-robert.info/docs/infra-as-code/gestion-de-configuration/ansible/ecrire-roles/

[^12]: https://spacelift.io/blog/ansible-roles

