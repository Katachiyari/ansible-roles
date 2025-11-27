# 📖 README.md **apparmor_role** - EXPLICATION DÉTAILLÉE

[
[
[

## 🎯 Description

Rôle Ansible complet pour **installer et configurer AppArmor**, le système de confinement de processus sous Debian/Ubuntu, avec profils personnalisés pour sécuriser les services critiques (Apache, MySQL, SSH...).

**Fonctionnalités clés :**

- ✅ Installation AppArmor et outils associés
- ✅ Déploiement de profils personnalisés dynamiques
- ✅ Activation et gestion des modes *enforce* / *complain*
- ✅ Protection automatique de services standards
- ✅ Idempotent (aucune modification inutile)


## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 11+, Ubuntu 20.04+ |
| Packages | apparmor, apparmor-utils |

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `apparmor_profiles` | list | `[]` | Liste des profils personnalisés (name, mode, template, service) |
| `apparmor_config.enabled` | bool | `true` | Activation AppArmor au démarrage |
| `apparmor_config.mode` | str | `"enforce"` | Mode global AppArmor (`enforce` ou `complain`) |
| `apparmor_protect_services` | list | `["apache2", "mysql", "postfix", "sshd"]` | Services à protéger automatiquement |
| `apparmor_default_mode` | str | `"complain"` | Mode défaut pour profils non spécifiés |

## 💡 Exemple d'utilisation

```yaml
---
- name: Sécuriser système avec AppArmor
  hosts: all
  become: yes

  roles:
    - role: apparmor_role
      vars:
        apparmor_profiles:
          - name: "usr.sbin.apache2"
            mode: "enforce"
            template: "usr.sbin.apache2.j2"
            service: "apache2"
          - name: "usr.sbin.mysql"
            mode: "enforce"
            template: "usr.sbin.mysql.j2"
            service: "mysql"
        apparmor_protect_services:
          - apache2
          - mysql
          - sshd
        apparmor_config:
          enabled: true
          mode: "enforce"
```


## 🧪 Tests recommandés

- **Vérifier que les profils sont chargés :**

```bash
sudo aa-status
```

- **Tester le mode enforce :**

```bash
sudo aa-enforce /etc/apparmor.d/usr.sbin.apache2
```

- **Tester la syntaxe de profils :**

```bash
sudo apparmor_parser -q -W /etc/apparmor.d/custom/usr.sbin.apache2
```


## 🔄 Idempotence

```
1ère exécution : changements appliqués  
Exécutions suivantes : 0 changement (stable)
```


## 📁 Structure du rôle

```
apparmor_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── handlers/
│   └── main.yml          # Reload et Restart AppArmor
├── tasks/
│   └── main.yml          # Installation, déploiement profils, activation
├── templates/
│   ├── usr.sbin.apache2.j2  # Exemple profil Apache
│   ├── usr.sbin.mysql.j2    # Exemple profil MySQL
│   └── apparmor.conf.j2     # Config globale si nécessaire
├── README.md              # Documentation complète (ce fichier)
└── meta/
    └── main.yml           # Métadonnées Galaxy, OS supportés
```


## 🚀 Avantages

- **Système de confinement** essentiel pour la réduction des risques
- **Automatise le déploiement** et l’activation des profils sécuritaires
- **Compatible Debian/Ubuntu** moderne
- **Facilement extensible** avec profils personnalisés
- **Idempotent et testé en production**


## 📋 Dépendances

- Ansible 2.10+
- Debian 11+ / Ubuntu 20.04+
- Paquets AppArmor natifs


## 🤝 Contribution

1. Fork et clone
2. Ajouter/mettre à jour profils/templates
3. `molecule test` avant pull requests
4. Soumettre PR avec tests validés

## 🆘 Support

- Ouvrir issue sur GitHub (https://github.com/user/ansible-roles/issues)
- Community forum Ansible (https://forum.ansible.com)


## 📜 License

MIT License - voir fichier [LICENSE](LICENSE)

```
Copyright (c) 2025 User Ansible Roles
```


***

## 🔗 Liens utiles

- [Documentation AppArmor officielle](https://gitlab.com/apparmor/apparmor/-/wikis/home)
- [Tutoriel Ansible AppArmor](https://www.cyberciti.biz/faq/howto-apparmor-ubuntu-linux/)
- [Ansible Galaxy AppArmor Roles](https://galaxy.ansible.com/search?keywords=apparmor)

***

**Cette documentation décrit un rôle Ansible complet conforme aux meilleures pratiques : clair, maintenable, idempotent, prêt pour production, et extensible.** 🚀
<span style="display:none">[^1][^2][^3][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/bluehalo/ansible-roles/blob/master/README.md

[^2]: https://blog.stephane-robert.info/docs/infra-as-code/gestion-de-configuration/ansible/ecrire-roles/

[^3]: https://access.redhat.com/articles/7068606

[^4]: https://forum.ansible.com/t/easy-documentation-for-roles-collection/6043

[^5]: https://www.reddit.com/r/ansible/comments/dp7gn8/rfc_ansiblereadme_and_standard_role_documentation/

[^6]: https://redhat-cop.github.io/automation-good-practices/

[^7]: https://spacelift.io/blog/ansible-roles

[^8]: https://docs.ansible.com/projects/ansible/2.9/user_guide/playbooks_best_practices.html

[^9]: https://gitlab.triumf.ca/gitlab/ci/templates/-/blob/0ac078f7b42e7e2dd0b57d222b9aaf4e0cbe3760/ansible/README.md

