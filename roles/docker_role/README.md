---
- name: Installer et configurer Docker sur serveurs Debian/RedHat
  hosts: all
  become: yes

  roles:
    - role: docker_role
      vars:
        docker_install_official_repo: true
        docker_user: "deploy_user"
        docker_service_enabled: true
        docker_daemon_config:
          log-driver: "json-file"
          log-opts:
            max-size: "20m"
            max-file: "5"
# Ce rôle installe Docker CE depuis les dépôts officiels, configure le daemon,
# ajoute un utilisateur au groupe docker, et active le service pour déploiement containerisé.
