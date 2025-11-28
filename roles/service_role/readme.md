# 📖 README.md **service_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **gérer les services système** (start, stop, restart, enable, disable) sur Linux, avec gestion des dépendances et du logging.

**Fonctionnalités clés :**

- ✅ Démarrage/arrêt/restart des services
- ✅ Activation/désactivation des services au boot
- ✅ Gestion des dépendances et du logging
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
| `service_services` | list | `[]` | Liste des services à gérer |
| `service_enabled` | bool | `true` | Activer/désactiver au boot |
| `service_state` | str | `"started"` | `"started"`, `"stopped"`, `"restarted"` |

**Structure service :**

```yaml
- name: "nginx"
  enabled: true
  state: "started"
```


***

## 💡 Exemple d’utilisation

### Gestion de services basique

```yaml
---
- name: Gérer les services système
  hosts: all
  become: yes
  roles:
    - role: service_role
      vars:
        service_services:
          - name: "nginx"
            enabled: true
            state: "started"
          - name: "fail2ban"
            enabled: true
            state: "started"
```


***

## 🧪 Tests recommandés

**Vérifier les services :**

```bash
systemctl list-units --type=service --state=active
```

**Test idempotence :**

```bash
ansible-playbook service.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : gestion services = `changed`
- Exécutions suivantes : **0 changed** si configuration identique

***

## 📁 Structure du rôle

```text
service_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   └── main.yml          # Gestion des services
├── handlers/
│   └── main.yml          # Nettoyage temporaires
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Gestion centralisée des services système
- Idempotence et logging structuré
- Prêt pour serveurs critiques et clusters

***

## 🤝 Contributing

1. Fork → Ajouter gestion dépendances → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `systemctl list-units` + logs
- 🚀 Features : Ajout gestion dépendances, notifications

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour la gestion des services système sur toute infrastructure Linux moderne.** 🔧🚀

