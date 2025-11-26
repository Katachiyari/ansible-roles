# Ansible Role: Apache PHP Client

Installs Apache2, PHP, and the PHP-MySQL connector (client libraries only).
Creates a dynamic VirtualHost and a test page.

## Requirements

Target OS: Debian / Ubuntu.

## Role Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `web_domain` | `monsite.test` | The ServerName for the vhost |
| `web_port` | `80` | The listening port |
| `web_doc_root` | `/var/www/html` | The root directory for files |
| `web_packages` | `[apache2, php, php-mysql...]` | List of packages to install |

## Example Playbook

hosts: webservers
become: true

vars:
web_domain: "app.prod.lan"
web_doc_root: "/var/www/app_prod"

roles:

apache_php_client