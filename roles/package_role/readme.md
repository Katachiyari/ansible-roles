# 📖 README.md **package_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **installer, mettre à jour et supprimer des paquets** (APT/YUM) sur Linux, avec gestion des dépôts, des clés GPG et des mises à jour système.

**Fonctionnalités clés :**

- ✅ Installation/mise à jour/suppression de paquets
- ✅ Gestion des dépôts et clés GPG
- ✅ Mises à jour système
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
| `package_packages` | list | `[]` | Paquets à gérer |
| `package_repositories` | list | `[]` | Dépôts à ajouter |
| `package_gpg_keys` | list | `[]` | Clés GPG à importer |
| `package_update_cache` | bool | `true` | Mettre à jour le cache |
| `package_upgrade` | bool | `false` | Mettre à jour tous les paquets |


***

## 💡 Exemple d’utilisation

### Installation de paquets

```yaml
---
- name: Installer paquets système
  hosts: all
  become: yes
  roles:
    - role: package_role
      vars:
        package_packages:
          - "nginx"
          - "mysql-server"
          - "fail2ban"
        package_repositories:
          - "deb http://fr.archive.ubuntu.com/ubuntu focal main"
        package_gpg_keys:
          - "https://example.com/key.gpg"
        package_update_cache: true
        package_upgrade: false
```


***

## 🧪 Tests recommandés

**Vérifier les paquets :**

```bash
dpkg -l | grep nginx
```

**Vérifier les dépôts :**

```bash
cat /etc/apt/sources.list
```

**Test idempotence :**

```bash
ansible-playbook package.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si configuration identique

***

## 📁 Structure du rôle

```text
package_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── packages.yml      # Gestion paquets
│   ├── repositories.yml  # Gestion dépôts
│   ├── gpg_keys.yml      # Gestion clés GPG
│   └── main.yml          # Inclusion selon variables
├── handlers/
│   └── main.yml          # Nettoyage temporaires
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation centralisée paquets/dépôts/clés
- Mises à jour système
- Idempotence et logging structuré
- Prêt pour serveurs critiques et clusters

***

## 🤝 Contributing

1. Fork → Ajouter gestion dépôts → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `dpkg -l` + logs
- 🚀 Features : Ajout gestion snap, flatpak

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour la gestion des paquets sur toute infrastructure Linux moderne.** 📦🚀

