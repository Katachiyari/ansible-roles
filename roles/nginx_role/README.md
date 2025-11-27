📖 nginx_role - NGINX Server & Reverse Proxy

[
[
[
🎯 Description

Déploie NGINX haute performance (serveur web + reverse proxy) avec multi VirtualHosts, configuration optimisée multi-core, et support SSL prêt.

Fonctionnalités clés :

    ✅ Multi VirtualHosts (sites statiques + proxy)

    ✅ Worker processes auto (CPU cores)

    ✅ TCP tuning optimisé

    ✅ Proxy backends (Node.js, PHP-FPM, API)

    ✅ Idempotent (0 changed après 1ère exécution)

📋 Requirements
Requirement	Version	Notes
Ansible	≥2.10	Testé 2.14+
Python	≥3.8	
OS	Debian 11+, Ubuntu 20.04+, RHEL 8+	

Dépendances externes : Aucune
🛠️ Installation

bash
# Depuis Ansible Galaxy
ansible-galaxy install user.nginx_role

# Ou depuis Git
ansible-galaxy install git+https://github.com/user/ansible-roles.git,v1.0.0,nginx_role

⚙️ Variables (defaults/main.yml)
Obligatoires
Variable	Type	Exemple	Description
nginx_sites	list	[{name: "site1"}]	Liste des VirtualHosts
Configuration NGINX (nginx_config)
Variable	Défaut	Exemple	Description
worker_processes	auto	4	Workers CPU
worker_connections	1024	2048	Connexions/worker
keepalive_timeout	65	30	Keepalive timeout
Site configuration (nginx_sites[])
Variable	Type	Défaut	Description
name	str	-	Nom site (fichier config)
server_name	str	{{ inventory_hostname }}	ServerName
root	str	/var/www/{{ name }}	Document root
ports	list	[80]	Ports d'écoute
proxy_pass	str	null	Backend proxy
extra_config	str	""	Config location personnalisée

Exemple complet : Voir defaults/main.yml
💡 Exemple d'utilisation
Playbook minimal

text
---
- name: Déployer NGINX simple
  hosts: webservers
  become: yes
  roles:
    - role: nginx_role
      vars:
        nginx_sites:
          - name: "default"
            server_name: "{{ inventory_hostname }}"

Playbook avancé (multi-sites + proxy)

text
---
- name: NGINX Production (web + API proxy)
  hosts: webservers
  become: yes
  vars:
    nginx_sites:
      - name: "example.com"
        server_name: "example.com www.example.com"
        root: "/var/www/example"
        ports: ["80", "443"]
      - name: "api.example.com"
        server_name: "api.example.com"
        ports: ["80"]
        proxy_pass: "http://127.0.0.1:3000"
        extra_config: |
          location /health {
            access_log off;
            return 200 "healthy\n";
          }
    nginx_config:
      worker_processes: "4"
      worker_connections: "4096"

  roles:
    - role: nginx_role

🧪 Testing
Vérification rapide

bash
# Services
ansible-playbook site.yml -t "nginx_service"

# Syntaxe config
ansible-playbook site.yml -t "nginx_test_config"

# Test complet
ansible-playbook site.yml --check

Tests Molecule (développeurs)

bash
# Tests locaux
molecule test

# Matrix OS
molecule test -s default --parallel

Commandes de validation

bash
# Statut service
ansible webservers -m service_facts -a "name=nginx"

# Test syntaxe
ansible webservers -m shell -a "nginx -t"

# Test sites
ansible webservers -m shell -a "curl -I http://localhost"

🔄 Idempotence

text
1ère exécution : 18 tasks changed ✅
2ème exécution : 0 tasks changed ✅
3ème exécution : 0 tasks changed ✅

📁 Role Structure

text
nginx_role/
├── 📁 defaults/
│   └── main.yml              # Variables par défaut
├── 📁 tasks/
│   └── main.yml              # Tâches principales
├── 📁 templates/
│   ├── nginx.conf.j2         # Config globale
│   └── sites-available-default.j2  # VHosts
├── 📁 handlers/
│   └── main.yml              # Restart + test
├── 📁 meta/
│   └── main.yml              # Métadonnées Galaxy
├── 📁 tests/
│   └── test.yml              # Tests Molecule
└── 📄 README.md              # Documentation

🎨 Tags disponibles
Tag	Description
nginx_install	Installation paquets
nginx_config	Configuration globale
nginx_sites	VirtualHosts
nginx_service	Service management
nginx_test_config	Validation syntaxe

bash
ansible-playbook site.yml --tags "nginx_sites,nginx_service"

🖥️ Compatibilité
OS Family	Versions	NGINX	Statut
Debian	11, 12	1.18.x-1.24.x	✅ Production
Ubuntu	20.04, 22.04, 24.04	1.18.x-1.24.x	✅ Production
RHEL	8, 9	1.20.x+	✅ Testé
🔐 Sécurité

    ✅ Handlers testent config avant restart (nginx -t)

    ✅ Permissions 644 sur configs

    ✅ Backup automatique configs modifiées

    ✅ No root execution (www-data user)

🚀 Use Cases

    Serveur web statique multi-sites

    Reverse proxy Node.js/PHP/Python

    Load balancer simple

    API Gateway interne

    LEMP stack avec php-fpm_role

📈 Performance

text
Worker processes : auto (CPU cores)
Max connexions   : 1024+ par worker
Keepalive        : 65s optimisé
TCP tuning       : sendfile, tcp_nopush

🤝 Contributing

    Fork → Clone → Create feature branch

    molecule test avant push

    Pull Request avec tests ✅

    Suivre CONTRIBUTING.md

🆘 Support

    ❓ Questions : Issues GitHub

    🐛 Bugs : Label bug + molecule test output

    🚀 Features : Label enhancement

📜 License

MIT License - voir LICENSE

text
Copyright (c) 2025 User Ansible Roles

📊 Release Notes
Version	Date	Changes
v1.0.0	2025-11	Initial release
v1.1.0	Future	SSL auto + HTTP/2

Changelog complet : CHANGELOG.md
🔗 Liens utiles

    Ansible Galaxy

    Documentation NGINX

    Molecule Testing

Rôle production-ready, idempotent, testé, prêt pour LEMP stacks et reverse proxy haute performance ! 🚀