# 📖 README.md **logging_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **configurer et gérer les systèmes de logging** (rsyslog, syslog-ng) sur Linux, avec gestion des inputs, outputs, flows et templates pour centraliser et filtrer les logs.

**Fonctionnalités clés :**

- ✅ Installation et configuration de rsyslog/syslog-ng
- ✅ Gestion des sources (inputs) et destinations (outputs)
- ✅ Configuration des flows (règles de routage des logs)
- ✅ Templates personnalisés pour la mise en forme
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
| `logging_inputs` | list | `[]` | Sources de logs (files, journal, remote) |
| `logging_outputs` | list | `[]` | Destinations des logs (files, remote, database) |
| `logging_flows` | list | `[]` | Règles de routage des logs |
| `logging_custom_templates` | list | `[]` | Templates personnalisés |
| `logging_enabled` | bool | `true` | Activer/désactiver le service logging |


***

## 💡 Exemple d’utilisation

### Configuration basique (fichiers + remote)

```yaml
---
- name: Configurer logging basique
  hosts: all
  become: yes
  roles:
    - role: logging_role
      vars:
        logging_inputs:
          - name: "local_logs"
            type: "files"
            path: "/var/log/*.log"
          - name: "journal"
            type: "journal"
        logging_outputs:
          - name: "local_files"
            type: "files"
            path: "/var/log/central/"
          - name: "remote_syslog"
            type: "remote"
            target: "192.168.1.100"
            port: 514
        logging_flows:
          - input: "local_logs"
            outputs:
              - "local_files"
              - "remote_syslog"
          - input: "journal"
            outputs:
              - "remote_syslog"
```


### Avancé (templates personnalisés)

```yaml
        logging_custom_templates:
          - name: "precise"
            type: "list"
            content: |
              template(name="precise" type="list") {
                  constant(value="Syslog MSG is: '")
                  property(name="msg")
                  constant(value="', ")
                  property(name="timereported" dateFormat="rfc3339" caseConversion="lower")
                  constant(value="\n")
              }
```


***

## 🧪 Tests recommandés

**Vérifier le service :**

```bash
systemctl status rsyslog
```

**Vérifier la configuration :**

```bash
rsyslogd -N1
```

**Test idempotence :**

```bash
ansible-playbook logging.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si aucune variable modifiée

***

## 📁 Structure du rôle

```text
logging_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation rsyslog/syslog-ng
│   ├── config.yml        # Configuration inputs/outputs/flows
│   └── main.yml          # Inclusion selon variables
├── handlers/
│   └── main.yml          # Restart logging
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle rsyslog/syslog-ng
- Configuration centralisée inputs/outputs/flows
- Templates personnalisés
- Idempotence et logging structuré
- Prêt pour centralisation et analyse des logs

***

## 🤝 Contributing

1. Fork → Ajouter input/output → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `rsyslogd -N1` + logs
- 🚀 Features : Ajout gestion syslog-ng, templates avancés

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration du système de logging sur toute infrastructure Linux moderne.** 📝🚀[^1][^7]
<span style="display:none">[^2][^3][^4][^5][^6][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/linux-system-roles/logging

[^2]: https://forum.ansible.com/t/easy-documentation-for-roles-collection/6043

[^3]: https://docs.redhat.com/fr/documentation/red_hat_enterprise_linux/9/html/automating_system_administration_by_using_rhel_system_roles/an-example-playbook-to-manage-logical-volumes_managing-local-storage-using-rhel-system-roles

[^4]: https://pypi.org/project/ansible-role-collect-logs/

[^5]: https://www.mantra-networking.com/ansible-roles/

[^6]: https://www.reddit.com/r/ansible/comments/dp7gn8/rfc_ansiblereadme_and_standard_role_documentation/

[^7]: https://galaxy.ansible.com/ui/standalone/roles/linux-system-roles/logging/

[^8]: https://gitlab.com/glienhart/ansible/ansible-roles-usage-example/-/blob/main/README.md

[^9]: https://linux-system-roles.github.io/documentation/role-requirements

