---
- name: Déployer NGINX multi-sites (web + reverse proxy)
  hosts: webservers
  become: yes

  roles:
    - role: nginx_role
      vars:
        nginx_sites:
          - name: "example.com"
            server_name: "example.com www.example.com"
            root: "/var/www/example.com"
            ports: ["80", "443"]
            ssl: false
          - name: "api.example.com"
            server_name: "api.example.com"
            ports: ["80"]
            proxy_pass: "http://localhost:3000"
            extra_config: |
              location /health {
                  access_log off;
                  return 200 "healthy\n";
              }
        nginx_config:
          worker_processes: "4"
          worker_connections: "2048"
# Ce rôle déploie NGINX complet : sites statiques + reverse proxy,
# configuration optimisée, vhosts multiples, validation config.
# Complète parfaitement apache_php_mariadb_r pour LEMP stack.
