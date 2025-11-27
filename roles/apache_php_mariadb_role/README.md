📖 README.md apache_php_mariadb_role - EXPLICATION DÉTAILLÉE

text
# Apache PHP MariaDB Role (LAMP Stack)

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/user/ansible-roles/actions)

## 🎯 Description

**Role Ansible complet pour déployer un stack LAMP (Linux Apache MySQL PHP)**

Installe et configure **en une seule exécution** :
- **Apache2** avec VirtualHost configuré
- **PHP 8.1** avec extensions (MySQL, cURL, GD, mbstring)
- **MariaDB 10.11** avec bases/utilisateurs sécurisés
- **Intégration parfaite** Apache ↔ PHP ↔ MariaDB

## 🔧 Fonctionnalités principales

### 1. **Apache2**

✅ Installation Apache2 + modules (rewrite, ssl, expires)
✅ VirtualHost dynamique avec ServerName personnalisé
✅ DocumentRoot configurable
✅ Logs personnalisés
✅ Service activé/redémarré automatiquement

text

### 2. **PHP 8.1**

✅ Paquets PHP + extensions web (mod_php)
✅ Configuration php.ini personnalisée (memory_limit, upload_max_filesize...)
✅ Liaison automatique Apache ↔ PHP
✅ Version PHP paramétrable (7.4, 8.0, 8.1, 8.2)

text

### 3. **MariaDB 10.11**

✅ Installation serveur MariaDB + client
✅ Sécurisation automatique (mysql_secure_installation)
✅ Création bases de données multiples
✅ Création utilisateurs avec privilèges précis
✅ Mot de passe root sécurisé

text

## 🖥️ Compatibilité

| OS | Version | Apache | PHP | MariaDB | Statut |
|----|---------|--------|-----|---------|--------|
| Ubuntu | 24.04 Noble | 2.4.58 | 8.1/8.2/8.3 | 10.11 | ✅ Production |
| Ubuntu | 22.04 Jammy | 2.4.52 | 8.1 | 10.6 | ✅ Testé |
| Debian | 12 Bookworm | 2.4.57 | 8.2 | 10.11 | ✅ Testé |

## ⚙️ Variables principales

### **Obligatoires**
| Variable | Exemple | Description |
|----------|---------|-------------|
| `apache_document_root` | `/var/www/html` | Racine des sites web |
| `mariadb_root_password` | `supersecret123` | Mot de passe root MariaDB |

### **Optionnelles (Apache)**
| Variable | Défaut | Description |
|----------|--------|-------------|
| `apache_listen_port` | `80` | Port d'écoute Apache |
| `apache_server_name` | `{{ inventory_hostname }}` | ServerName vhost |
| `apache_vhost_config` | `{}` | Config vhost avancée |

### **Optionnelles (PHP)**
| Variable | Défaut | Description |
|----------|--------|-------------|
| `php_version` | `8.1` | Version PHP (8.1, 8.2, 8.3) |
| `php_ini_values` | `{}` | Config php.ini personnalisée |

### **Optionnelles (MariaDB)**
| Variable | Défaut | Description |
|----------|--------|-------------|
| `mariadb_databases` | `[]` | Liste bases de données |
| `mariadb_users` | `[]` | Liste utilisateurs DB |

## 💡 Exemple d'utilisation

    name: Déployer stack LAMP complet
    hosts: web_servers
    become: yes
    vars:
    Obligatoires

    apache_document_root: "/var/www/example.com"
    mariadb_root_password: "MySecureRootPass123"
    Configuration

    apache_server_name: "example.com"
    php_ini_values:
    memory_limit: "512M"
    upload_max_filesize: "100M"
    mariadb_databases:
    - name: "appdb"
    encoding: "utf8mb4"
    mariadb_users:
    - name: "appuser"
    password: "AppPass456"
    priv: "appdb.*:ALL"

    roles:

        role: apache_php_mariadb_role

text

## 🧪 Test du rôle

Vérifier services

ansible web_servers -m shell -a "systemctl is-active apache2 mariadb"
Test PHP

ansible web_servers -m shell -a "curl -s localhost/info.php | grep 'PHP Version'"
Test MariaDB

ansible web_servers -m shell -a "mysql -u root -p'yourpass' -e 'SHOW DATABASES;'"

text

## 🔄 Idempotence

1ère exécution : 25+ changed
2ème exécution : 0 changed ✅

text

## 📁 Structure du rôle

apache_php_mariadb_role/
├── tasks/
│ ├── 01-apache.yml
│ ├── 02-php.yml
│ ├── 03-mariadb.yml
│ └── main.yml
├── templates/
│ ├── apache-vhost.conf.j2
│ └── php.ini.j2
├── handlers/
│ └── main.yml (restart apache, restart mariadb)
└── defaults/
└── main.yml

text

## 🚀 Avantages

- **Tout-en-un** : LAMP complet en 1 rôle
- **Idempotent** : Relance = 0 changed  
- **Configurable** : Variables précises
- **Sécurisé** : MariaDB root + users gérés
- **Production-ready** : Testé Ubuntu 24.04

## 📋 Dépendances

- Ansible 2.10+
- Ubuntu 22.04+ / Debian 11+