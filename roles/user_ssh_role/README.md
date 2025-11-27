---
- name: Déployer utilisateurs et clés SSH sécurisées
  hosts: all
  become: yes

  roles:
    - role: users_ssh_keys_role
      vars:
        ssh_users:
          - username: "deploy_user"
            groups:
              - sudo
              - docker
            authorized_keys:
              - "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC... deploy@workstation"
              - "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAI... deploy@laptop"
            state: "present"
          - username: "monitoring_user"
            authorized_keys:
              - "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC... monitoring@prometheus"
            state: "present"
        sshd_config:
          PermitRootLogin: "no"
          PasswordAuthentication: "no"
          PubkeyAuthentication: "yes"
# Ce rôle déploie utilisateurs + clés SSH multiples, sécurise sshd_config,
# désactive login root/mot de passe, et configure accès par clé uniquement.
