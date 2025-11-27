---
- name: Déployer HashiCorp Vault serveur ou client
  hosts: vault_servers
  become: yes

  roles:
    - role: vault_role
      vars:
        vault_mode: "server"
        vault_version: "1.15.0"
        vault_service_enabled: true
        vault_server_config:
          storage:
            path: "/opt/vault/data"
          listener:
            address: "0.0.0.0:8200"
            tls_disable: 1
          api_addr: "http://127.0.0.1:8200"
          cluster_addr: "http://127.0.0.1:8201"
# Ce rôle déploie Vault en mode serveur (stockage file) ou client,
# configure l'API/UI, systemd service, et variables d'environnement.
# Gère centralement tous vos secrets (DB, API keys, certificats).
