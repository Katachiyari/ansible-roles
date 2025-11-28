# 📖 README.md **user_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **créer, modifier et supprimer des utilisateurs** sur Linux, avec gestion des groupes, des permissions, des clés SSH et du logging.

**Fonctionnalités clés :**

- ✅ Création/modification/suppression d’utilisateurs
- ✅ Gestion des groupes et permissions
- ✅ Déploiement de clés SSH
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
| `user_users` | list | `[]` | Liste des utilisateurs à gérer |
| `user_groups` | list | `[]` | Groupes à créer |
| `user_ssh_keys` | list | `[]` | Clés SSH à déployer |

**Structure utilisateur :**

```yaml
- name: "deploy"
  state: "present"
  groups:
    - "sudo"
    - "docker"
  shell: "/bin/bash"
  ssh_key: "ssh-rsa AAA..."
```


***

## 💡 Exemple d’utilisation

### Gestion basique

```yaml
---
- name: Gérer utilisateurs système
  hosts: all
  become: yes
  roles:
    - role: user_role
      vars:
        user_users:
          - name: "deploy"
            state: "present"
            groups:
              - "sudo"
              - "docker"
            shell: "/bin/bash"
            ssh_key: "ssh-rsa AAA..."
        user_groups:
          - "deploy"
          - "docker"
```


***

## 🧪 Tests recommandés

**Vérifier les utilisateurs :**

```bash
ansible all -m shell -a "getent passwd deploy"
```

**Vérifier les groupes :**

```bash
ansible all -m shell -a "getent group deploy"
```

**Test idempotence :**

```bash
ansible-playbook user.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : gestion utilisateurs = `changed`
- Exécutions suivantes : **0 changed** si configuration identique

***

## 📁 Structure du rôle

```text
user_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── users.yml         # Gestion utilisateurs
│   ├── groups.yml        # Gestion groupes
│   └── main.yml          # Inclusion selon variables
├── handlers/
│   └── main.yml          # Nettoyage temporaires
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Gestion centralisée utilisateurs/groupes
- Déploiement clés SSH
- Idempotence et logging structuré
- Prêt pour serveurs critiques et clusters

***

## 🤝 Contributing

1. Fork → Ajouter gestion clés SSH → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `getent passwd` + logs
- 🚀 Features : Ajout gestion sudoers, notifications

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour la gestion des utilisateurs sur toute infrastructure Linux moderne.** 👤🚀

