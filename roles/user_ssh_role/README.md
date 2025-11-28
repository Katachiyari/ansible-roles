# 📖 README.md **users_ssh_keys_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **déployer et gérer les clés SSH** des utilisateurs sur Linux, avec gestion des droits, du backup et de l’idempotence.

**Fonctionnalités clés :**

- ✅ Déploiement de clés SSH publiques
- ✅ Gestion des droits et permissions
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
| `users_ssh_keys` | list | `[]` | Liste des clés SSH à déployer |

**Structure clé SSH :**

```yaml
- user: "deploy"
  key: "ssh-rsa AAA..."
  state: "present"
```


***

## 💡 Exemple d’utilisation

### Déploiement basique

```yaml
---
- name: Déployer clés SSH utilisateurs
  hosts: all
  become: yes
  roles:
    - role: users_ssh_keys_role
      vars:
        users_ssh_keys:
          - user: "deploy"
            key: "ssh-rsa AAA..."
            state: "present"
          - user: "admin"
            key: "ssh-rsa BBB..."
            state: "present"
```


***

## 🧪 Tests recommandés

**Vérifier les clés déployées :**

```bash
ansible all -m shell -a "cat /home/deploy/.ssh/authorized_keys"
```

**Vérifier le backup :**

```bash
ansible all -m shell -a "ls -la /home/deploy/.ssh/authorized_keys.*"
```

**Test idempotence :**

```bash
ansible-playbook users-ssh-keys.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : déploiement = `changed`
- Exécutions suivantes : **0 changed** si clés identiques

***

## 📁 Structure du rôle

```text
users_ssh_keys_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   └── main.yml          # Déploiement clés SSH
├── handlers/
│   └── main.yml          # Nettoyage backups
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Déploiement centralisé clés SSH
- Gestion des droits/backup
- Idempotence et logging structuré
- Prêt pour accès sécurisé et audits

***

## 🤝 Contributing

1. Fork → Ajouter gestion backup → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `cat authorized_keys` + logs
- 🚀 Features : Ajout gestion clés multiples, notifications

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour la gestion des clés SSH utilisateurs sur toute infrastructure Linux moderne.** 🔐🚀

