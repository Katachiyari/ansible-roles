---
- name: Configurer système de logging centralisé
  hosts: all
  become: yes

  roles:
    - role: logging_role
      vars:
        logging_remote_server: "log-server.example.com"  # Optionnel
        logging_remote_port: 514
        logrotate_retention_days: 45
        logging_services_enabled: true
# Ce rôle configure rsyslog pour logs locaux/distants, logrotate pour rotation automatique,
# et journald pour limitation de taille, assurant monitoring et débogage efficace.
