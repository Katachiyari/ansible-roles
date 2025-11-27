- hosts: webservers
  become: yes
  roles:
    - role: apache_php_mariadb_r
      vars:
        web_domain: example.com
        web_port: 8080
        web_admin_email: admin@example.com
        web_doc_root: /var/www/example
        use_mariadb: true
