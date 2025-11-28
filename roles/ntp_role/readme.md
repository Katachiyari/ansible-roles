# 📖 README.md **ntp_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **installer et configurer NTP** (Network Time Protocol) sur Linux, avec gestion des serveurs, de la sécurité et de la synchronisation horaire.

**Fonctionnalités clés :**

- ✅ Installation NTP (ntp ou chrony)
- ✅ Configuration des serveurs NTP
- ✅ Gestion de la sécurité (restrictions)
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | ntp ou chrony |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `ntp_service` | str | `"ntp"` | `"ntp"` ou `"chrony"` |
| `ntp_servers` | list | `["pool.ntp.org"]` | Serveurs NTP |
| `ntp_restrict` | list | `[]` | Restrictions NTP |
| `ntp_enabled` | bool | `true` | Activer/désactiver le service |


***

## 💡 Exemple d’utilisation

### NTP basique

```yaml
---
- name: Installer NTP basique
  hosts: all
  become: yes
  roles:
    - role: ntp_role
      vars:
        ntp_servers:
          - "0.fr.pool.ntp.org"
          - "1.fr.pool.ntp.org"
          - "2.fr.pool.ntp.org"
        ntp_restrict:
          - "127.0.0.1"
          - "192.168.1.0/24"
```


***

## 🧪 Tests recommandés

**Vérifier le service :**

```bash
systemctl status ntp
```

**Vérifier la synchronisation :**

```bash
ntpq -p
```

**Test idempotence :**

```bash
ansible-playbook ntp.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si configuration identique

***

## 📁 Structure du rôle

```text
ntp_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation NTP
│   ├── config.yml        # Configuration serveurs/restrictions
│   └── main.yml          # Inclusion selon variables
├── templates/
│   └── ntp.conf.j2       # Template NTP
├── handlers/
│   └── main.yml          # Restart NTP
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle NTP
- Configuration centralisée serveurs/restrictions
- Idempotence et logging structuré
- Prêt pour serveurs critiques et clusters

***

## 🤝 Contributing

1. Fork → Ajouter gestion chrony → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `ntpq -p` + logs
- 🚀 Features : Ajout gestion chrony, notifications

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration de NTP sur toute infrastructure Linux moderne.** ⏰🚀

