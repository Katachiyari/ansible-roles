# 📖 README.md **ufw_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **installer et configurer UFW** (Uncomplicated Firewall), le pare-feu simple pour Linux, sur Debian/Ubuntu. Permet de définir des règles de filtrage réseau (ports, services, IP) de façon centralisée, idempotente et sécurisée.

**Fonctionnalités clés :**

- ✅ Installation et activation de UFW
- ✅ Gestion des règles (ports, services, IP)
- ✅ Gestion des politiques par défaut (allow, deny, reject)
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+ |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `ufw_enabled` | bool | `true` | Activer/désactiver UFW |
| `ufw_default_policy` | str | `"deny"` | `"allow"`, `"deny"`, `"reject"` |
| `ufw_rules` | list | Voir exemple | Règles à appliquer |

**Exemple règles :**

```yaml
- name: "allow SSH"
  port: "22"
  proto: "tcp"
  direction: "in"
  action: "allow"
- name: "allow HTTP"
  port: "80"
  proto: "tcp"
  direction: "in"
  action: "allow"
```


***

## 💡 Exemple d’utilisation

### Configuration basique (SSH + HTTP)

```yaml
---
- name: Configurer UFW basique
  hosts: all
  become: yes
  roles:
    - role: ufw_role
      vars:
        ufw_enabled: true
        ufw_default_policy: "deny"
        ufw_rules:
          - name: "allow SSH"
            port: "22"
            proto: "tcp"
            direction: "in"
            action: "allow"
          - name: "allow HTTP"
            port: "80"
            proto: "tcp"
            direction: "in"
            action: "allow"
```


### Avancé (règles personnalisées)

```yaml
        ufw_rules:
          - name: "allow SSH from IP"
            port: "22"
            proto: "tcp"
            direction: "in"
            action: "allow"
            from: "192.168.1.0/24"
          - name: "allow HTTP"
            port: "80"
            proto: "tcp"
            direction: "in"
            action: "allow"
```


***

## 🧪 Tests recommandés

**Vérifier le service :**

```bash
systemctl status ufw
```

**Vérifier les règles :**

```bash
ufw status verbose
```

**Test idempotence :**

```bash
ansible-playbook ufw.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + règles = `changed`
- Exécutions suivantes : **0 changed** si aucune règle modifiée

***

## 📁 Structure du rôle

```text
ufw_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation UFW
│   ├── config.yml        # Configuration règles
│   └── main.yml          # Inclusion selon variables
├── handlers/
│   └── main.yml          # Reload UFW
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle UFW
- Configuration centralisée règles
- Idempotence et logging structuré
- Prêt pour serveurs critiques et clusters

***

## 🤝 Contributing

1. Fork → Ajouter gestion règles → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `ufw status verbose` + logs
- 🚀 Features : Ajout gestion IPv6, règles avancées

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration d’UFW sur toute infrastructure Linux moderne.** 🔥🚀

