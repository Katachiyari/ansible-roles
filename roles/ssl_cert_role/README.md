---
- name: Déployer certificats SSL Let's Encrypt automatiques
  hosts: webservers
  become: yes

  roles:
    - role: ssl_cert_role
      vars:
        ssl_domains:
          - "example.com"
          - "www.example.com"
        ssl_email: "admin@example.com"
        ssl_challenge: "http-01"
        ssl_webroot: "/var/www/html/.well-known/acme-challenge"
        ssl_webserver: "apache2"
        ssl_staging: false
        ssl_auto_renew: true
# Ce rôle obtient/renouvelle automatiquement les certificats Let's Encrypt,
# configure l'auto-renouvellement quotidien via systemd timer,
# et redémarre le webserver après renouvellement.
