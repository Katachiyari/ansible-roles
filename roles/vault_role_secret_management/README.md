# 📖 README.md **vault_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **installer et configurer HashiCorp Vault** sur Linux, avec gestion du serveur, des politiques, des secrets et de la sécurité.

**Fonctionnalités clés :**

- ✅ Installation et configuration de Vault
- ✅ Gestion des politiques et des secrets
- ✅ Configuration de la sécurité (TLS, auth)
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | vault |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `vault_version` | str | `"latest"` | Version Vault |
| `vault_config` | dict | `{}` | Configuration Vault |
| `vault_policies` | list | `[]` | Politiques à créer |
| `vault_secrets` | list | `[]` | Secrets à déployer |
| `vault_tls_enabled` | bool | `false` | Activer TLS |
| `vault_auth_enabled` | bool | `true` | Activer authentification |


***

## 💡 Exemple d’utilisation

### Vault basique

```yaml
---
- name: Installer et configurer Vault
  hosts: all
  become: yes
  roles:
    - role: vault_role
      vars:
        vault_version: "1.12.0"
        vault_config:
          listener:
            tcp:
              address: "0.0.0.0:8200"
              tls_disable: true
          storage:
            file:
              path: "/opt/vault/data"
        vault_policies:
          - name: "admin"
            rules: |
              path "secret/*" {
                capabilities = ["create", "read", "update", "delete", "list"]
              }
        vault_secrets:
          - path: "secret/myapp"
            data:
              password: "MonMotDePasseSécurisé"
        vault_tls_enabled: false
        vault_auth_enabled: true
```


***

## 🧪 Tests recommandés

**Vérifier le service :**

```bash
systemctl status vault
```

**Vérifier la configuration :**

```bash
vault status
```

**Test idempotence :**

```bash
ansible-playbook vault.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si configuration identique

***

## 📁 Structure du rôle

```text
vault_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation Vault
│   ├── config.yml        # Configuration
│   ├── policies.yml      # Politiques
│   ├── secrets.yml       # Secrets
│   └── main.yml          # Inclusion selon variables
├── templates/
│   └── vault.hcl.j2      # Template config
├── handlers/
│   └── main.yml          # Restart Vault
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle Vault
- Configuration centralisée politiques/secrets
- Idempotence et logging structuré
- Prêt pour gestion de secrets et sécurité

***

## 🤝 Contributing

1. Fork → Ajouter gestion secrets → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `vault status` + logs
- 🚀 Features : Ajout gestion auth backends, notifications

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration de HashiCorp Vault sur toute infrastructure Linux moderne.** 🔐🚀

