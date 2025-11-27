# 📖 README.md **auditd_role** - EXPLICATION DÉTAILLÉE

[
[
[

## 🎯 Description

Rôle Ansible complet pour **installer et configurer auditd**, le démon d’audit Linux indispensable pour la sécurité, la supervision et le forensic.

**Fonctionnalités clés :**

- ✅ Installation et configuration complète d’auditd
- ✅ Déploiement dynamique des règles d’audit personnalisées
- ✅ Rotation et gestion des logs d’audit
- ✅ Activation et gestion du service auditd
- ✅ Suivi des fichiers sensibles, des commandes, des accès utilisateurs
- ✅ Idempotence forte


## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | auditd, audispd-plugins (RedHat) |

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `audit_rules` | list of str | Voir defaults | Liste des règles d’audit à appliquer |
| `auditd_config` | dict | Voir defaults | Options de configuration d’auditd |
| `auditd_enabled` | bool | true | Activation automatique du service auditd |

## 💡 Exemple d'utilisation

```yaml
---
- name: Configurer auditd pour audit système complet
  hosts: all
  become: yes

  roles:
    - role: auditd_role
      vars:
        audit_rules:
          - "-w /etc/passwd -p wa -k identity"
          - "-a always,exit -F arch=b64 -S execve -k process"
          - "-w /var/log -p wa -k log_mods"
        auditd_config:
          log_file: "/var/log/audit/audit.log"
          max_log_file: 100
          num_logs: 5
        auditd_enabled: true
```


## 🧪 Tests recommandés

- Vérifier que le service est actif :

```bash
systemctl status auditd
```

- Vérifier que les règles sont chargées :

```bash
auditctl -l
```

- Tester audit en créant un fichier ou en exécutant une commande :

```bash
touch /tmp/test-audit
ausearch -f /tmp/test-audit
```


## 🔄 Idempotence

```
1ère exécution : règles appliquées, service démarré  
2ème exécution : 0 modification (stable)
```


## 📁 Structure du rôle

```
auditd_role/
├── defaults/
│   └── main.yml          # Variables par défaut (rules, config)
├── handlers/
│   └── main.yml          # Reload règles, restart service
├── tasks/
│   └── main.yml          # Installation, config, règles, service
├── templates/
│   └── audit.rules.j2    # Règles dynamiques
├── README.md             # Documentation complète (ce fichier)
└── meta/
    └── main.yml          # Métadonnées Galaxy et OS supportés
```


## 🚀 Avantages

- Surveillance complète indispensable sécurité et forensic
- Règles modifiables et extensibles simplement
- Gestion centralisée logs audit rotatifs
- Compatible majoritairement Linux (Debian, Ubuntu, RHEL)
- Intégration dans monitoring ou SIEM


## 🤝 Contribution

1. Fork \& clone
2. Livraison testée avec Molecule
3. PR validée après revue

## 🆘 Support

- GitHub Issues : [lien du repo]
- Forum Ansible


## 📜 License

MIT License — voir fichier [LICENSE](LICENSE)

***

## 🔗 Liens utiles

- [auditd man page](https://linux.die.net/man/8/auditd)
- [Ansible Role auditd Galaxy](https://galaxy.ansible.com/robertdebock/auditd)
- [Linux Audit Framework](https://wiki.linuxfoundation.org/security/audit)

***

**Documentation claire, complète, conforme aux meilleures pratiques Ansible, pour un rôle de sécurité essentiel.** 🚀
<span style="display:none">[^1][^10][^2][^3][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/robertdebock/ansible-role-auditd

[^2]: https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_reuse_roles.html

[^3]: https://galaxy.ansible.com/robertdebock/auditd

[^4]: https://blog.stephane-robert.info/docs/infra-as-code/gestion-de-configuration/ansible/ecrire-roles/

[^5]: https://www.redhat.com/fr/topics/automation/what-is-an-ansible-role

[^6]: https://connect.ed-diamond.com/linux-pratique/lp-128/comment-tester-un-role-ansible-avec-molecule

[^7]: https://techblog.ingeniance.fr/gestion-des-roles-sous-ansible/

[^8]: https://gitlab.com/robertdebock-iac/ansible-role-auditd/-/tree/2.5.2

[^9]: https://egi-federation.github.io/ansible-style-guide/role-documentation

[^10]: https://spacelift.io/blog/ansible-roles

