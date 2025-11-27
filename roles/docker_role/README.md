---
- name: Installer et configurer Docker sur serveurs Ubuntu 24.04 (Noble Numbat)
  hosts: docker_servers
  become: yes
  vars:                    
    # === VARIABLES OBLIGATOIRES ===
    docker_user: "deploy_user"
    
    # === VARIABLES OPTIONNELLES ===
    docker_install_official_repo: true
    docker_service_enabled: true
    
    # === CONFIGURATION DAEMON ===
    docker_daemon_config:
      log-driver: "json-file"
      log-opts:
        max-size: "20m"
        max-file: "5"
      storage-driver: "overlay2"
      data-root: "/var/lib/docker"
    
    # === VARIABLES TECHNIQUES ===
    docker_packages:
      - docker-ce
      - docker-ce-cli
      - containerd.io
      - docker-buildx-plugin
      - docker-compose-plugin

  roles:
    - role: docker_role




# Docker Role
## Description

**Role Ansible pour installer Docker CE sur Ubuntu 24.04 (Noble Numbat)**

Installe Docker Engine officiel depuis le dépôt Docker avec :
- Nettoyage complet des dépôts/clés existants (résout conflits Signed-By)
- Installation des paquets officiels : `docker-ce`, `docker-ce-cli`, `containerd.io`, `docker-buildx-plugin`, `docker-compose-plugin`
- Configuration service systemd
- Ajout utilisateur au groupe `docker`

## Compatibilité

| OS | Version | Statut |
|----|---------|--------|
| Ubuntu | 24.04 Noble | ✅ Testé & Production Ready |
| Debian | 12 Bookworm | ✅ Compatible |
| RedHat/CentOS | - | ❌ Non supporté |

## Variables

| Variable | Défaut | Description |
|----------|--------|-------------|
| `docker_user` | `{{ ansible_user_id }}` | Utilisateur à ajouter au groupe docker |
| `docker_service_enabled` | `yes` | Activer le service au boot |






