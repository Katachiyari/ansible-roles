# 📖 README.md **security_hardening_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **appliquer des règles de durcissement de sécurité** sur Linux, avec gestion des services, utilisateurs, fichiers et permissions.

**Fonctionnalités clés :**

- ✅ Durcissement des services système
- ✅ Gestion des utilisateurs et des permissions
- ✅ Application de règles CIS, STIG, ou personnalisées
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
| `security_hardening_cis` | bool | `true` | Appliquer règles CIS |
| `security_hardening_stig` | bool | `false` | Appliquer règles STIG |
| `security_hardening_custom` | dict | `{}` | Règles personnalisées |
| `security_hardening_enabled` | bool | `true` | Activer/désactiver le durcissement |


***

## 💡 Exemple d’utilisation

### Durcissement basique (CIS)

```yaml
---
- name: Appliquer durcissement sécurité basique
  hosts: all
  become: yes
  roles:
    - role: security_hardening_role
      vars:
        security_hardening_cis: true
        security_hardening_stig: false
        security_hardening_custom:
          disable_root_login: true
          restrict_ssh: true
```


***

## 🧪 Tests recommandés

**Vérifier les règles appliquées :**

```bash
ansible all -m shell -a "grep -r 'CIS' /etc/"
```

**Test idempotence :**

```bash
ansible-playbook security-hardening.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : application règles = `changed`
- Exécutions suivantes : **0 changed** si règles identiques

***

## 📁 Structure du rôle

```text
security_hardening_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── cis.yml           # Règles CIS
│   ├── stig.yml          # Règles STIG
│   ├── custom.yml        # Règles personnalisées
│   └── main.yml          # Inclusion selon variables
├── handlers/
│   └── main.yml          # Nettoyage temporaires
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Application centralisée règles CIS/STIG/custom
- Idempotence et logging structuré
- Prêt pour audits et conformité

***

## 🤝 Contributing

1. Fork → Ajouter règle → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie grep + logs
- 🚀 Features : Ajout gestion CIS v8, règles avancées

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour le durcissement de sécurité sur toute infrastructure Linux moderne.** 🔐🚀

