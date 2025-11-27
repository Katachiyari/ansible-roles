📖 README.md apache_php_mariadb_role - EXPLICATION DÉTAILLÉE

text
# Apache PHP MariaDB Role (LAMP Stack)</br>

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/user/ansible-roles/actions)

## 🎯 Description</br>

**Role Ansible complet pour déployer un stack LAMP (Linux Apache MySQL PHP)**</br>

Installe et configure **en une seule exécution** :</br>
- **Apache2** avec VirtualHost configuré</br>
- **PHP 8.1** avec extensions (MySQL, cURL, GD, mbstring)</br>
- **MariaDB 10.11** avec bases/utilisateurs sécurisés</br>
- **Intégration parfaite** Apache ↔ PHP ↔ MariaDB</br>

## 🔧 Fonctionnalités principales</br>

### 1. **Apache2**</br>

✅ Installation Apache2 + modules (rewrite, ssl, expires)w</br>
✅ VirtualHost dynamique avec ServerName personnalisé</br>
✅ DocumentRoot configurable</br>
✅ Logs personnalisés</br>
✅ Service activé/redémarré automatiquement</br>

text

### 2. **PHP 8.1**</br>

✅ Paquets PHP + extensions web (mod_php)</br>
✅ Configuration php.ini personnalisée (memory_limit, upload_max_filesize...)</br>
✅ Liaison automatique Apache ↔ PHP</br>
✅ Version PHP paramétrable (7.4, 8.0, 8.1, 8.2)</br>

text

### 3. **MariaDB 10.11**</br>

✅ Installation serveur MariaDB + client</br>
✅ Sécurisation automatique (mysql_secure_installation)</br>
✅ Création bases de données multiples</br>
✅ Création utilisateurs avec privilèges précis</br>
✅ Mot de passe root sécurisé</br>
</br>
text

## 🖥️ Compatibilité</br>

| OS | Version | Apache | PHP | MariaDB | Statut |
|----|---------|--------|-----|---------|--------|
| Ubuntu | 24.04 Noble | 2.4.58 | 8.1/8.2/8.3 | 10.11 | ✅ Production |
| Ubuntu | 22.04 Jammy | 2.4.52 | 8.1 | 10.6 | ✅ Testé |
| Debian | 12 Bookworm | 2.4.57 | 8.2 | 10.11 | ✅ Testé |

## ⚙️ Variables principales</br>

### **Obligatoires**</br>
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
```
ansible web_servers -m shell -a "systemctl is-active apache2 mariadb"
Test PHP

ansible web_servers -m shell -a "curl -s localhost/info.php | grep 'PHP Version'"
Test MariaDB

ansible web_servers -m shell -a "mysql -u root -p'yourpass' -e 'SHOW DATABASES;'"
```
text

## 🔄 Idempotence

1ère exécution : 25+ changed
2ème exécution : 0 changed ✅

text

## 📁 Structure du rôle

apache_php_mariadb_role/</br>
├── tasks/</br>
│ ├── 01-apache.yml</br>
│ ├── 02-php.yml</br>
│ ├── 03-mariadb.yml</br>
│ └── main.yml</br>
├── templates/</br>
│ ├── apache-vhost.conf.j2</br>
│ └── php.ini.j2</br>
├── handlers/</br>
│ └── main.yml (restart apache, restart mariadb)</br>
└── defaults/</br>
└── main.yml</br>

text

## 🚀 Avantages</br>

- **Tout-en-un** : LAMP complet en 1 rôle</br>
- **Idempotent** : Relance = 0 changed  </br>
- **Configurable** : Variables précises</br>
- **Sécurisé** : MariaDB root + users gérés</br>
- **Production-ready** : Testé Ubuntu 24.04</br>

## 📋 Dépendances</br>

- Ansible 2.10+</br>
- Ubuntu 22.04+ / Debian 11+</br>
