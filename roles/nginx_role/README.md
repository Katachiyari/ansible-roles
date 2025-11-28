# 📖 README.md **nginx_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible complet pour **installer et configurer NGINX** (serveur web, reverse proxy) sur Linux, avec gestion des sites, des virtual hosts et de la sécurité.

**Fonctionnalités clés :**

- ✅ Installation NGINX (stable/latest)
- ✅ Configuration des sites (HTTP/HTTPS)
- ✅ Gestion des virtual hosts et SSL
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | nginx |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `nginx_version` | str | `"stable"` | Version NGINX |
| `nginx_sites` | list | `[]` | Sites à configurer |
| `nginx_ssl_enabled` | bool | `false` | Activer SSL |
| `nginx_ssl_cert` | str | `""` | Certificat SSL |
| `nginx_ssl_key` | str | `""` | Clé SSL |

**Structure site :**

```yaml
- name: "default"
  server_name: "example.com"
  root: "/var/www/html"
  ssl: false
```


***

## 💡 Exemple d’utilisation

### Site basique (HTTP)

```yaml
---
- name: Installer NGINX basique
  hosts: all
  become: yes
  roles:
    - role: nginx_role
      vars:
        nginx_sites:
          - name: "default"
            server_name: "example.com"
            root: "/var/www/html"
            ssl: false
```


### Avancé (HTTPS)

```yaml
        nginx_sites:
          - name: "secure"
            server_name: "secure.example.com"
            root: "/var/www/secure"
            ssl: true
            ssl_cert: "/etc/ssl/certs/example.com.crt"
            ssl_key: "/etc/ssl/private/example.com.key"
```


***

## 🧪 Tests recommandés

**Vérifier le service :**

```bash
systemctl status nginx
```

**Vérifier la configuration :**

```bash
nginx -t
```

**Test idempotence :**

```bash
ansible-playbook nginx.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si configuration identique

***

## 📁 Structure du rôle

```text
nginx_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml     # Installation NGINX
│   ├── config.yml      # Configuration sites
│   └── main.yml        # Inclusion selon variables
├── templates/
│   ├── nginx.conf.j2   # Template NGINX
│   └── site.conf.j2    # Template site
├── handlers/
│   └── main.yml        # Restart NGINX
├── meta/
│   └── main.yml        # Métadonnées Galaxy
└── README.md           # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle NGINX
- Configuration centralisée sites/SSL
- Idempotence et logging structuré
- Prêt pour serveurs web et reverse proxy

***

## 🤝 Contributing

1. Fork → Ajouter gestion SSL → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `nginx -t` + logs
- 🚀 Features : Ajout gestion load balancing, HTTP/2

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration de NGINX sur toute infrastructure Linux moderne.** 🌐🚀

