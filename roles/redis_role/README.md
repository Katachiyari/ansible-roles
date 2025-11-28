# 📖 README.md **redis_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **installer et configurer Redis** (serveur de cache et de données) sur Linux, avec gestion de la sécurité, des instances et de la persistance.

**Fonctionnalités clés :**

- ✅ Installation Redis (stable/latest)
- ✅ Configuration de la sécurité (mot de passe, restrictions)
- ✅ Gestion des instances et de la persistance
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | redis-server |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `redis_version` | str | `"stable"` | Version Redis |
| `redis_password` | str | `""` | Mot de passe Redis |
| `redis_port` | int | `6379` | Port Redis |
| `redis_bind` | str | `"127.0.0.1"` | IP d’écoute |
| `redis_instances` | list | `[]` | Instances à configurer |
| `redis_persistence` | bool | `true` | Activer la persistance |
| `redis_enabled` | bool | `true` | Activer/désactiver le service |

**Structure instance :**

```yaml
- name: "default"
  port: 6379
  bind: "127.0.0.1"
  password: "RedisPass123"
```


***

## 💡 Exemple d’utilisation

### Redis basique

```yaml
---
- name: Installer Redis basique
  hosts: all
  become: yes
  roles:
    - role: redis_role
      vars:
        redis_password: "MonMotDePasseSécurisé"
        redis_port: 6379
        redis_bind: "127.0.0.1"
        redis_instances:
          - name: "default"
            port: 6379
            bind: "127.0.0.1"
            password: "RedisPass123"
```


***

## 🧪 Tests recommandés

**Vérifier le service :**

```bash
systemctl status redis
```

**Vérifier la configuration :**

```bash
redis-cli -p 6379 ping
```

**Test idempotence :**

```bash
ansible-playbook redis.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si configuration identique

***

## 📁 Structure du rôle

```text
redis_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation Redis
│   ├── config.yml        # Configuration instances
│   └── main.yml          # Inclusion selon variables
├── templates/
│   └── redis.conf.j2     # Template Redis
├── handlers/
│   └── main.yml          # Restart Redis
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle Redis
- Configuration centralisée instances/persistance
- Idempotence et logging structuré
- Prêt pour applications critiques et clusters

***

## 🤝 Contributing

1. Fork → Ajouter gestion instances → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `redis-cli ping` + logs
- 🚀 Features : Ajout gestion clustering, TLS

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration de Redis sur toute infrastructure Linux moderne.** 🚀[^1]

<div align="center">⁂</div>

[^1]: https://github.com/angristan/ansible-grafana

