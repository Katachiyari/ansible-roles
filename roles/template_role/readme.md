# 📖 README.md **template_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **gérer le déploiement et la configuration de fichiers templates** (Jinja2) sur les serveurs Linux, avec gestion des variables, des permissions et du backup.

**Fonctionnalités clés :**

- ✅ Déploiement de templates Jinja2
- ✅ Gestion des variables et des permissions
- ✅ Backup automatique avant modification
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `template_files` | list | `[]` | Liste des fichiers templates à déployer |
| `template_backup` | bool | `true` | Backup automatique avant modification |

**Structure template :**

```yaml
- src: "templates/nginx.conf.j2"
  dest: "/etc/nginx/nginx.conf"
  owner: "root"
  group: "root"
  mode: "0644"
  vars:
    server_name: "example.com"
```


***

## 💡 Exemple d’utilisation

### Déploiement basique

```yaml
---
- name: Déployer templates basiques
  hosts: all
  become: yes
  roles:
    - role: template_role
      vars:
        template_files:
          - src: "templates/nginx.conf.j2"
            dest: "/etc/nginx/nginx.conf"
            owner: "root"
            group: "root"
            mode: "0644"
            vars:
              server_name: "example.com"
          - src: "templates/motd.j2"
            dest: "/etc/motd"
            owner: "root"
            group: "root"
            mode: "0644"
            vars:
              message: "Welcome!"
```


***

## 🧪 Tests recommandés

**Vérifier les fichiers générés :**

```bash
ansible all -m shell -a "cat /etc/nginx/nginx.conf"
```

**Vérifier le backup :**

```bash
ansible all -m shell -a "ls -la /etc/nginx/nginx.conf.*"
```

**Test idempotence :**

```bash
ansible-playbook template.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : déploiement = `changed`
- Exécutions suivantes : **0 changed** si template/variables identiques

***

## 📁 Structure du rôle

```text
template_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   └── main.yml          # Déploiement templates
├── handlers/
│   └── main.yml          # Nettoyage backups
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Déploiement centralisé templates Jinja2
- Gestion des variables/permissions
- Backup automatique
- Idempotence et logging structuré
- Prêt pour configs applicatives et serveurs

***

## 🤝 Contributing

1. Fork → Ajouter gestion variables → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `cat` + logs
- 🚀 Features : Ajout gestion multi-templates, notifications

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour le déploiement et la gestion de templates Jinja2 sur toute infrastructure Linux moderne.** 📄🚀

