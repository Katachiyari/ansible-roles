---
- name: Déployer un serveur Apache avec PHP et support MariaDB sur Debian
  hosts: webservers
  become: yes

  roles:
    - role: apache_php_mariadb_r
      vars:
        web_domain: "example.com"
        web_port: 80
        web_admin_email: "admin@example.com"
        web_doc_root: "/var/www/example"
        use_mariadb: true

# Ce rôle installe Apache avec PHP, configure un virtualhost dynamique,
# et ajoute le support MariaDB en option selon les variables fournies.
