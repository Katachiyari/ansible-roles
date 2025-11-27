---
- name: Configurer tâches planifiées automatisées
  hosts: all
  become: yes

  roles:
    - role: cron_job_role
      vars:
        cron_jobs:
          - name: "Backup quotidien à 2h00"
            minute: "0"
            hour: "2"
            job: "/usr/local/bin/backup.sh"
            user: "root"
            state: "present"
          - name: "Nettoyage logs toutes les 6h"
            minute: "0"
            hour: "*/6"
            job: "/usr/local/bin/clean-logs.sh"
            user: "root"
            state: "present"
          - name: "Vérification système chaque dimanche 4h"
            minute: "0"
            hour: "4"
            weekday: "0"
            job: "/usr/local/bin/system-check.sh"
            user: "root"
            state: "present"
# Ce rôle déploie un crontab centralisé avec plusieurs tâches planifiées,
# gère l'installation de cron, et applique les bonnes permissions.
# Supporte format standard cron avec nom, timing, commande et utilisateur.
