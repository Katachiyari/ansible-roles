---
- name: Déployer stack web complète avec Docker Compose
  hosts: app_servers
  become: yes

  roles:
    - role: docker_compose_role
      vars:
        compose_project_name: "webstack"
        compose_dir: "/opt/docker/webstack"
        compose_services:
          web:
            image: nginx:alpine
            ports:
              - "80:80"
              - "443:443"
            volumes:
              - /var/www:/usr/share/nginx/html
            depends_on:
              - app
          app:
            image: myapp:latest
            environment:
              DB_HOST: db
              DB_PORT: 3306
            depends_on:
              - db
          db:
            image: mariadb:10.6
            environment:
              MYSQL_ROOT_PASSWORD: secret123
              MYSQL_DATABASE: myapp
            volumes:
              - db_data:/var/lib/mysql
        compose_env:
          DB_PASSWORD: "secret123"
          APP_SECRET: "myappsecret"
        compose_pull: true
        compose_enabled: true
# Ce rôle déploie une stack Docker Compose complète (web+app+DB),
# génère systemd service pour démarrage auto, gère .env et redéploiement.
