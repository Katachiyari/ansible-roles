# 📖 README.md **git_clone_role** – EXPLICATION DÉTAILLÉE


## 🎯 Description

Rôle Ansible pour **cloner des dépôts Git** sur les serveurs cibles, avec gestion des branches, des tags, des clés SSH, et du déploiement de sources. Idéal pour déployer applications, scripts ou configs depuis un repo Git.

**Fonctionnalités clés :**

- ✅ Clonage de dépôts Git (HTTPS/SSH)
- ✅ Gestion de branches, tags et révisions
- ✅ Support des clés SSH pour accès privé
- ✅ Déploiement sécurisé des sources
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | git |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `git_repos` | list | `[]` | Liste des dépôts à cloner |
| `git_deploy_key` | str | `""` | Chemin vers clé SSH privée |
| `git_force` | bool | `false` | Forcer le clone même si existe |

**Structure dépôt :**

```yaml
- name: "MonApp"
  repo: "https://github.com/user/monapp.git"
  dest: "/opt/monapp"
  version: "main"
  ssh_key: "/home/user/.ssh/id_rsa"
```


***

## 💡 Exemple d’utilisation

### Clone simple (HTTPS)

```yaml
---
- name: Cloner dépôt public
  hosts: all
  become: yes
  roles:
    - role: git_clone_role
      vars:
        git_repos:
          - name: "monapp"
            repo: "https://github.com/user/monapp.git"
            dest: "/opt/monapp"
            version: "main"
```


### Clone avancé (SSH + clé)

```yaml
        git_repos:
          - name: "monapp"
            repo: "git@github.com:user/monapp.git"
            dest: "/opt/monapp"
            version: "v1.2.3"
            ssh_key: "/home/deploy/.ssh/id_rsa"
```


***

## 🧪 Tests recommandés

**Vérifier le clone :**

```bash
ansible all -m shell -a "ls -la /opt/monapp/"
```

**Vérifier la branche/tag :**

```bash
ansible all -m shell -a "cd /opt/monapp && git status"
```

**Test idempotence :**

```bash
ansible-playbook git-clone.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : clone + checkout = `changed`
- Exécutions suivantes : **0 changed** si version/branch identique

***

## 📁 Structure du rôle

```text
git_clone_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── clone.yml         # Clonage dépôt
│   ├── checkout.yml      # Checkout branch/tag
│   └── main.yml          # Inclusion selon variables
├── handlers/
│   └── main.yml          # Nettoyage clés temporaires
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Déploiement centralisé depuis Git
- Support SSH/HTTPS
- Gestion branches/tags
- Idempotence et logging structuré
- Prêt pour CI/CD et déploiements applicatifs

***

## 🤝 Contributing

1. Fork → Ajouter gestion tag → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `git status` + logs
- 🚀 Features : Ajout gestion sous-modules, webhooks

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour le clonage et le déploiement de dépôts Git sur toute infrastructure Linux moderne.** 🔄🚀[^1][^2]
<span style="display:none">[^3][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/git_module.html

[^2]: https://blog.stephane-robert.info/docs/infra-as-code/gestion-de-configuration/ansible/ecrire-roles/

[^3]: https://gitlab.com/the-common/ansible-role-template/-/blob/main/README.md

[^4]: https://snum.gitlab-pages.din.developpement-durable.gouv.fr/dis/go/pst/surikate/documentation/Outils/Alloy/Avec ansible/installation_configuration_alloy_ansible/

[^5]: https://github.com/lework/Ansible-roles/blob/master/README.md

[^6]: https://gitlab.bht-berlin.de/smart-learning/ansible-roles/-/blob/smart-learning.apache.flink/README.md

[^7]: https://code.facil.services/facil/ansible

[^8]: https://docs.ansible.com/projects/ansible/latest/dev_guide/developing_collections_structure.html

[^9]: https://docs.ansible.com/projects/ansible/latest/collections_guide/collections_installing.html

