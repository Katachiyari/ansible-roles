---
- name: Configurer système de sauvegarde automatisé
  hosts: all
  become: yes

  roles:
    - role: backup_role
      vars:
        backup_dest: "/var/backups"
        backup_sources:
          - "/etc/nginx"
          - "/home/deploy_user/app"
          - "/var/www/html"
        backup_name: "webserver-backup"
        backup_retention_days: 14
        backup_compression: "gzip"
        backup_mariadb: true
        backup_mariadb_root_password: "StrongRootPasswordHere!"
        backup_cron_enable: true
        backup_cron_hour: 3
        backup_cron_minute: 0
# Ce rôle crée des snapshots compressés des fichiers/configs/bases spécifiées,
# gère la rotation automatique des sauvegardes, et peut installer un cron
# pour exécution planifiée quotidienne.
