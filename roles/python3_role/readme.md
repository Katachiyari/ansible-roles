# 📖 README.md **python3_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **installer et configurer Python** (2.x/3.x) sur Linux, avec gestion des paquets pip, des venv et des dépendances.

**Fonctionnalités clés :**

- ✅ Installation Python (2.x/3.x)
- ✅ Installation des paquets pip
- ✅ Création d’environnements virtuels (venv)
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | python, python3, python3-pip |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `python_version` | str | `"3"` | Version Python |
| `python_pip_packages` | list | `[]` | Paquets pip à installer |
| `python_venvs` | list | `[]` | Environnements virtuels à créer |

**Structure venv :**

```yaml
- name: "myapp"
  path: "/opt/myapp/venv"
  packages:
    - "requests"
    - "flask"
```


***

## 💡 Exemple d’utilisation

### Installation Python + pip

```yaml
---
- name: Installer Python basique
  hosts: all
  become: yes
  roles:
    - role: python_role
      vars:
        python_version: "3"
        python_pip_packages:
          - "requests"
          - "flask"
```


### Avancé (venv)

```yaml
        python_venvs:
          - name: "myapp"
            path: "/opt/myapp/venv"
            packages:
              - "requests"
              - "flask"
```


***

## 🧪 Tests recommandés

**Vérifier Python :**

```bash
python3 --version
```

**Vérifier pip :**

```bash
pip3 list
```

**Test idempotence :**

```bash
ansible-playbook python.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si configuration identique

***

## 📁 Structure du rôle

```text
python_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation Python
│   ├── pip.yml           # Installation pip
│   ├── venv.yml          # Création venv
│   └── main.yml          # Inclusion selon variables
├── handlers/
│   └── main.yml          # Nettoyage temporaires
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle Python
- Gestion centralisée pip/venv
- Idempotence et logging structuré
- Prêt pour applications Python et scripts

***

## 🤝 Contributing

1. Fork → Ajouter gestion venv → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `python3 --version` + logs
- 🚀 Features : Ajout gestion virtualenv, pipenv

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration de Python sur toute infrastructure Linux moderne.** 🐍🚀

